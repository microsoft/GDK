---
author: M-Stahl
title: Preferred UDP multiplayer port
description: Describes how to use the preferred local UDP multiplayer port APIs to improve multiplayer reliability.
kindex:
- Preferred UDP multiplayer port
- PreferredLocalUdpMultiplayerPortNetworking
- udp port
ms.author: jkepner
ms.topic: conceptual
edited: 11/26/2020
security: public
---

# Preferred local User Datagram Protocol (UDP) multiplayer port networking APIs

Use this topic to understand how to use the preferred local User Datagram Protocol (UDP) multiplayer port APIs to improve multiplayer reliability. All iterations of Xbox consoles have allowed you to use *UDP 3074*. It's a publicly registered, well-known port for multiplayer network traffic. Microsoft Game Development Kit (GDK) titles are no exception and can use the preferred local UDP multiplayer port networking APIs to access this special port.

The preferred local UDP multiplayer port is the local port that's used in a subsequent [socket bind](/windows/desktop/api/winsock/nf-winsock-bind) operation as opposed to the public port that remote devices might use to connect to the local device. The former is meaningful only for UDP traffic rather than for Transmission Control Protocol (TCP) and HTTP traffic, because it's targeted specifically at multiplayer, real-time&ndash;title-networking flows.

Historically, the port has been confined to UDP 3074. However, in recent years, fallback logic has been introduced to increase the reliability of this port. In addition, users have been able to manually configure the port to work with their own unique network configurations. This is why it's no longer safe to hard-code UDP 3074 in a Microsoft Game Development Kit (GDK) title. Instead, Microsoft Game Development Kit (GDK) titles should dynamically query for the currently configured port.

There are three ways to retrieve the preferred local UDP multiplayer port.
* **Blocking:** [XNetworkingQueryPreferredLocalUdpMultiplayerPort](../../../reference/networking/xnetworking/functions/xnetworkingquerypreferredlocaludpmultiplayerport.md)
* **Asynchronous:** [XNetworkingQueryPreferredLocalUdpMultiplayerPortAsync](../../../reference/networking/xnetworking/functions/xnetworkingquerypreferredlocaludpmultiplayerportasync.md)
* **Notification-based:** [XNetworkingRegisterPreferredLocalUdpMultiplayerPortChanged](../../../reference/networking/xnetworking/functions/xnetworkingregisterpreferredlocaludpmultiplayerportchanged.md)

All three variants provide the same basic functionality. Any (or any combination) of them can be called by a Microsoft Game Development Kit (GDK) title in accordance with its specific needs and use cases.

We strongly recommend that all Microsoft Game Development Kit (GDK) titles use the preferred port for their main game traffic. This port is optimized for both peer-to-peer network topologies and client/server network topologies. The Microsoft Game Development Kit (GDK) platform ensures that this specific port is the one most likely to work for each user's particular networking environment. Using this specific port maximizes the use of the platform's customer support and diagnostic flows, increases standardized network address translation (NAT) compatibility, provides standardized UPnP&trade;&ndash;certified device functionality, and identifies the packets as real-time&ndash;sensitive for Quality of Service (QoS) router and ISP algorithms.

This preferred port is particularly relevant to titles relying on peer-to-peer network topologies. It's the only port that allows inbound UDP packets through the firewall without performing firewall punching. Titles relying on peer-to-peer network topologies in the Microsoft Game Development Kit (GDK) are still expected to provide their own public IP address and port discovery along with a NAT punching solution for clients that have moderate or strict NAT types. The preferred port improves the success rate of these technologies but isn't a substitute for them.

Titles using client/server network topologies also benefit from using this port. Troubleshooting, UPnP&trade;, and packet identification are still relevant for captive portal and other source-based filtering approaches common in hospitals, hotels, and college dormitories.

The preferred port should be treated just like any other port. It should be used in conjunction with the [Windows Sockets 2 (Winsock)](/windows/desktop/WinSock/windows-sockets-start-page-2) APIs. The title should bind to both IPv4 and IPv6 on this port or use a dual-stack socket, and it should bind to the `INADDR_ANY`/`in6addr_any` address.


## Handling socket failures

There's no guarantee that the returned port can be used to establish a successful socket connection with particular servers or peers. Normal title retry and fallback logic should be performed. Whenever the socket is closed and reopened, the title should query again for the most recent, preferred local UDP multiplayer port, because the port can change over time.


## Network initialization

All three (blocking, asynchronous, and notification-based) variants of the `XNetworkingQueryPreferredLocalUdpMultiplayerPort` API will block or delay completion/notifications until the network is initialized on title launch and on resume.  You may separately wait for network initialization according to the [Detecting network initialization status](../initialization-connectivity-networking.md#ID4ETA) overview, or may make a call to these APIs and wait for them to return.


<a id="SuspendResume"></a>
## Suspend and resume

Just like any other socket, the socket bound to the preferred local UDP multiplayer port should be closed on suspend and re-created on resume after waiting for network initialization. You should register for suspend and resume events via `RegisterAppStateChangeNotification`.  On resume, you should assume that the preferred local UDP multiplayer port has changed and either be listening for changes to the preferred local UDP multiplayer port or re-query when creating your new sockets.  For more information on WinSock suspend and resume handling, see [Suspend and resume in Winsock](winsock-intro-networking.md#SuspendResume).


## Changes in the preferred local UDP multiplayer port

The title can listen for changes in the preferred local UDP multiplayer port by using the [XNetworkingRegisterPreferredLocalUdpMultiplayerPortChanged](../../../reference/networking/xnetworking/functions/xnetworkingregisterpreferredlocaludpmultiplayerportchanged.md) API.

All attempts are made to ensure that the preferred local UDP multiplayer port doesn't change while the title is running. However, there are unavoidable cases where the port will change due to the user's external network conditions changing and invalidating any existing socket flows. The port is especially likely to change when the [network connectivity level](../initialization-connectivity-networking.md) changes, or as part of a title's suspend/resume cycle.

When the preferred local UDP multiplayer port changes, additional inbound connections from future peers might get blocked on any previous preferred port. This might not cause a failure at the socket layer. However, the title might eventually stop receiving packets on any socket bound to any previous preferred port.

Packets sent to and from existing peers might continue to function. A notification about a change in the preferred local UDP multiplayer port might not be fatal to any in-progress game session.

When a change notification occurs, the title should migrate to a new socket bound on the new preferred port. This migration should happen at the earliest opportunity and without interrupting any existing gameplay. To detect a connection loss and to retry the socket connection, the title should always use the most recent preferred port.


### Testing changes to the preferred local UDP multiplayer port

Use the following steps to change the preferred local UDP multiplayer port.

1. While your game is running, open the **Xbox Guide**. Go to the **Settings** app.
1. On the **General** tab, select **Network settings**.
1. Select **Advanced settings**, and then select **Alternate port selection**.
1. Set the port selection to **Manual**. To select a port, use the drop-down menu.
1. Port selection immediately takes effect and causes a corresponding notification to your title.
1. When you're done testing, set the port selection back to **Automatic** to return the port behavior back to the default.
> [!NOTE]
> While in the Settings app, your title is constrained but still running and immediately receives the port change notification, even though your title isn't visible. Your title is suspended if you leave the Settings app open for longer than 10 minutes without switching back to your title.


## Security

The socket bound to the preferred local UDP multiplayer port behaves just as any other socket would. In particular, the socket doesn't provide any additional security. The title should use its own secure communication protocol on top of the socket that's bound to the preferred local UDP multiplayer port as specified by the communication security best practices. See [Communication Security Overview (NDA topic)](../../../security/communication-security/communication-security-overview.md) for more information.


## Peer-to-peer

The preferred local UDP multiplayer port provides the best-known port that a peer-to-peer mesh can be built from. It's configured in the best possible way to allow inbound connections through the user's NAT layer. However, it's the responsibility of the title to perform NAT traversal, including the following.

* Detection of the NAT type
* Detection and exchange of the device's public IP address and port
* NAT punching and traversal


## Azure PlayFab Party

Internally, [PlayFab Party](playfab-party-intro-networking.md) uses the preferred local UDP multiplayer port by default. This is configurable through the PlayFab Party API. Unless the PlayFab Party port is changed, the title shouldn't bind directly to the preferred local UDP multiplayer port.


## Example usage

The following example shows how to bind a dual-stack socket to the preferred local UDP multiplayer port. The example uses the blocking [XNetworkingQueryPreferredLocalUdpMultiplayerPort](../../../reference/networking/xnetworking/functions/xnetworkingquerypreferredlocaludpmultiplayerport.md) call for brevity and assumes that the title has previously waited for the network to become ready and has already called [WSAStartup](/windows/desktop/api/winsock/nf-winsock-wsastartup).

```cpp
HRESULT
CreateAndBindMultiplayerSocket(
    _Out_ SOCKET* multiplayerSocket
    )
{
    HRESULT hr;
    SOCKET resultSocket = INVALID_SOCKET;

    uint16_t port;
    hr = XNetworkingQueryPreferredLocalUdpMultiplayerPort(&port);
    if (FAILED(hr))
    {
        goto Failure;
    }

    resultSocket = socket(AF_INET6, SOCK_DGRAM, IPPROTO_UDP);
    if (resultSocket == INVALID_SOCKET)
    {
        hr = HRESULT_FROM_WIN32(WSAGetLastError());
        goto Failure;
    }

    // Enable both IPv4 and IPv6 on this socket.
    int v6only = 0;
    if (setsockopt(resultSocket, IPPROTO_IPV6, IPV6_V6ONLY, (char*)&v6only, sizeof(v6only)) == SOCKET_ERROR)
    {
        hr = HRESULT_FROM_WIN32(WSAGetLastError());
        goto Failure;
    }

    sockaddr_in6 sa;
    ZeroMemory(&sa, sizeof(sa));
    sa.sin6_family = AF_INET6;
    sa.sin6_port = htons(port);
    sa.sin6_addr = in6addr_any;
    if (bind(resultSocket, (const sockaddr*)&sa, sizeof(sa)) == SOCKET_ERROR)
    {
        hr = HRESULT_FROM_WIN32(WSAGetLastError());
        goto Failure;
    }

    *multiplayerSocket = resultSocket;

Exit:

    return hr;

Failure:

    if (resultSocket != INVALID_SOCKET)
    {
        (void)closesocket(resultSocket);
    }

    goto Exit;
}
```


## See also


 [Preferred local UDP multiplayer port API reference (XNetworking)](../../../reference/networking/xnetworking/xnetworking_members.md)

 [Windows Sockets 2 (Winsock)](/windows/desktop/WinSock/windows-sockets-start-page-2)

 [Communication Security Overview (NDA topic)](../../../security/communication-security/communication-security-overview.md)