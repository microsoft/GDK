---
author: M-Stahl
title: Windows Sockets
description: Describes how to use sockets and the Winsock API in a Microsoft Game Development Kit (GDK) title.
kindex: winsock
ms.author: jkepner
ms.topic: conceptual
edited: 11/13/2020
security: public
---

# Introduction to Windows sockets in the Microsoft Game Development Kit

The Microsoft Game Development Kit (GDK) supports the use of the [Windows Sockets 2
(Winsock)](/windows/desktop/WinSock/windows-sockets-start-page-2) API. 

Windows Sockets 2 (Winsock) enables you to create advanced Internet, intranet, and other network-capable applications to transmit application data across the wire, independent of the network protocol being used.

The way Microsoft Game Development Kit (GDK) titles interact with Winsock is, generally the same as the way Win32 programs interact with Winsock. 

This topic describes the minor differences and best practices specific to the use of Winsock in Microsoft Game Development Kit (GDK) titles.

## Set up

This section describes which .h and .lib files you need to include when using Winsock APIs.

* Add `#include <winhttp.h>` in your source files. 
* For PC titles, continue to link against `Winhttp.lib`.
* For Xbox console titles, you must link against `XGamePlatform.lib`, instead of directly against `Winhttp.lib`.

Only the APIs under the `WINAPI_PARTITION_GAMES` API family work in Microsoft Game Development Kit (GDK) titles. 

## Network initialization

Before making the first call to [WSAStartup](/windows/desktop/api/winsock/nf-winsock-wsastartup), Microsoft Game Development Kit (GDK) titles must ensure that the networking stack is ready. If `WSAStartup` is called too early during the title's launch process, `WSAStartup` or subsequent Winsock calls might fail. For details about how to determine when the networking stack is ready, see [Network initialization and connectivity](../initialization-connectivity-networking.md).


<a id="SuspendResume"></a>
## Suspend and resume

You should register for suspend and resume events via `RegisterAppStateChangeNotification`. On suspend, you should close all socket handles and call [WSACleanup](/windows/desktop/api/winsock/nf-winsock-wsacleanup). On resume, you should again wait for [network initialization](../initialization-connectivity-networking.md) before calling [WSAStartup](/windows/desktop/api/winsock/nf-winsock-wsastartup) and creating any new sockets.


<a id="ID4EQBAC"></a>

## Microsoft Game Development Kit (GDK) preferred local User Datagram Protocol (UDP) multiplayer port API

The Microsoft Game Development Kit (GDK) [preferred local UDP multiplayer port](preferred-local-udp-multiplayer-port-networking.md) API returns an optimal, dynamically selected port that titles should [bind](/windows/desktop/api/winsock/nf-winsock-bind) to by using Winsock to facilitate in-game
communication via UDP. The Microsoft Game Development Kit (GDK) platform ensures that this specific port is the one most likely to work for each user's particular networking environment. Using this specific port maximizes the use of the platform's customer support and diagnostic flows, increases standardized network address translation (NAT) compatibility, provides standardized UPnP&trade;&ndash;certified device functionality, and identifies the packets as real-time&ndash;sensitive for Quality of Service (QoS) router and ISP algorithms.

The UDP port is particularly relevant to titles that rely on peer-to-peer network topologies. It's the only port that allows inbound UDP packets through the firewall without performing firewall punching. Titles that rely on peer-to-peer network topologies in the Microsoft Game Development Kit (GDK) are still expected to provide their own public IP address and port discovery, along with a NAT punching solution for clients that have moderate or strict NAT types. The preferred port by itself improves the success rate of these technologies but isn't a substitute for them.

Titles using client/server network topologies also benefit from using the UDP port. Troubleshooting, UPnP&trade;, and packet identification are still relevant for captive portal and other source-based filtering approaches that are common in hospitals, hotels, and college dormitories.

We strongly recommend that Microsoft Game Development Kit (GDK) titles use the preferred local UDP multiplayer port for their main multiplayer and chat network traffic.


<a id="ID4EQBAD"></a>

## Security of sockets

Microsoft Game Development Kit (GDK) titles are responsible for ensuring that there's appropriate security and encryption for all data that's transferred over the network with the Winsock API.

[BCrypt](/windows/desktop/api/bcrypt/index),
[WinCrypt](/windows/desktop/api/wincrypt/index),
[schannel](/windows/desktop/api/schannel/index), and other standard Windows APIs provide the recommended cryptographic primitives. Microsoft Game Development Kit (GDK) titles should use these APIs to implement Datagram Transport Layer Security (DTLS) and other standardized security protocols for all socket flows.

For titles that don't want to implement their own security model, the Microsoft Game Development Kit (GDK) library [PlayFab Party](playfab-party-intro-networking.md) provides a complete and integrated socket security story, among other features.


<a id="SocketMemory"></a>

## Socket memory considerations

Microsoft Game Development Kit (GDK) titles only have approximately 16MB currently available to the network stack for all WinSock and WinHTTP usage after which point the system may become unstable.  One of the largest sources of memory consumption is in the WinSock kernel mode send and receive memory pools where incoming and outgoing packets are stored until they can be sent on the wire or transfered to your title's user mode memory through one of the many `recv` variants.

Particularly for high bandwidth situations, the onus is on your title to transfer data into its own user-mode buffers with low latency at a rate at least equal to what the remote peer or server is pushing.  There are a couple of ways to do this with increasing complexity and guarantees, but the underlying goal for all of the below suggestions is to always have a user-mode buffer pending for immediate transfer as soon as data arrives so that the kernel does not need to allocate an increasing amount of memory.  The net effect is to change the memory usage for pending unprocessed data from the extremely limited kernel pool to memory managed directly by you within your much larger title memory pool.

Higher level APIs that consume WinSock generally have mechanisms in place to control their sockets' kernel memory usage. [WinHTTP](../web-requests/intro-winhttp.md#MemoryConsiderations) and [XCurl](../web-requests/intro-xcurl.md#xCurlMemory) both allow control over their kernel memory usage through their respective read notification mechanisms, while other APIs such as [XSAPI](/windows/uwp/xbox-live/xsapi-flat-c) and [PlayFab Party](playfab-party-intro-networking.md) minimize their kernel memory usage with the below techniques.

### Berkley (BSD) Sockets

If you want to stick with blocking Berkley socket APIs, you need to increase the frequency of recv calls.  We recommend using a dedicated thread with a tight loop that queues received data for processing elsewhere.  Ideally, the thread would always be blocked inside a recv call; any time spent outside of the recv call will potentially be time where the kernel memory usage will grow as it waits for you to call recv again.  Often if you try to process the data before calling recv again your title can get behind and the kernel memory usage will grow as long as data continues to be received at high rates.  We also recommend specifying buffer sizes of at least 8k to line up with the kernel buffer size boundaries and to help with jitter and bursty send patterns.

### WinSock Overlapped I/O

[WinSock's overlapped I/O](/windows/win32/winsock/overlapped-i-o-and-event-objects-2) allows you to asynchronously keep a user-mode receive buffer pended.  It also will allow the kernel to directly use your memory buffer and avoid an extra memory copy (unlike with the Berkley socket paradigm), and assuming a buffer is always pended the kernel will not allocate at all for received data.  In addition, with overlapped I/O you can set SO_RCVBUF and SO_SNDBUF to the special value of 0 which will mostly avoid any send/receive kernel memory being allocated at all.

This approach is the best way to manage the memory used by your sockets in almost all scenarios.

### Registered I/O

[Registered I/O](/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/hh997032(v=ws.11)) is a complicated networking API that gives you the lowest latency and guarantees that there is no kernel memory used for send and receive operations. It lets you set up multiple receive/send buffers directly used by the kernel to ensure that you always have buffers ready for incoming data.

<a id="ID4E3CAC"></a>

## Maximum UDP transmission unit size

Although a theoretical maximum payload size exists in the Microsoft Game Development Kit (GDK), in practice, the maximum for a particular connection depends on the network connection type. It can vary while a title is running. Instead of attempting to determine the actual Maximum Transmission Unit (MTU) and to react to changes in the MTU while your title is running, you should design your networking code to assume a maximum UDP payload per packet of 1,384 bytes. This value is safe to use under all networking configurations to avoid in-transmission fragmentation. We recommend this whether the socket type is IPv4 or IPv6.

Transmission of payloads larger than 1,384 bytes often requires IP-level packet fragmentation. IP packet fragmentation isn't well-supported by ISPs and users' home routers and devices. In these network configurations, IP packet fragmentation doesn't cause failures from the Winsock API. The fragmentation instead appears as packet losses to your title. To avoid IP-level packet fragmentation, use 1,384 bytes as a safe maximum for your packet payload.

To ensure that your title avoids fragmentation and to assist your title in meeting the associated Xbox Requirements around minimum multiplayer network requirements, you should apply the socket options `IP_DONTFRAGMENT` and `IP_USER_MTU` to every socket that your title opens. These flags are only available to Microsoft Game Development Kit (GDK) titles when the [XGameRuntimeIsFeatureAvailable(XGameRuntimeFeature::XNetworking)](../../../reference/system/xgameruntimefeature/functions/xgameruntimeisfeatureavailable.md)  API returns `true`. If the `XNetworking` feature isn't available, the `setsockopt` call fails. The following is an example of how to set these two socket options.

```cpp

HRESULT
ApplyFragmentationSocketOptions(
    SOCKET s
)
{
    int value = 1;
    int error = setsockopt(s, IPPROTO_IP, IP_DONTFRAGMENT, (char *)&value, sizeof(value));
    if (error == SOCKET_ERROR)
    {
        return HRESULT_FROM_WIN32(WSAGetLastError());
    }

    value = 1384;
    error = setsockopt(s, IPPROTO_IP, IP_USER_MTU, (char *)&value, sizeof(value));
    if (error == SOCKET_ERROR)
    {
        return HRESULT_FROM_WIN32(WSAGetLastError());
    }

    return S_OK;
}

```

## See also

* [Windows Sockets 2 (Winsock)](/windows/desktop/WinSock/windows-sockets-start-page-2)

* [Network initialization and connectivity](../initialization-connectivity-networking.md)

* [Preferred UDP multiplayer port](preferred-local-udp-multiplayer-port-networking.md)

* [PlayFab Party](playfab-party-intro-networking.md)

* [PC port behavior](pc-port-behavior.md)

* [Xbox console port behavior (NDA topic)](xbox-console-port-behavior.md)