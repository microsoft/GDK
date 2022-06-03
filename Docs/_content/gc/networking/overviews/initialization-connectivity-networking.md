---
author: M-Stahl
title: Network initialization and connectivity
description: Describes how to retrieve network connectivity and initialization information in Microsoft Game Development Kit (GDK) titles.
kindex:
- Network Initialization and Connectivity
- Connectivity
- GetNetworkConnectivityHint
- NotifyNetworkConnectivityHintChange
ms.author: jkepner
ms.topic: conceptual
edited: 11/13/2020
security: public
---

<a id="ID4ETA"></a>

# Detecting network initialization status

Use this topic to understand how to retrieve network connectivity and initialization information in Microsoft Game Development Kit (GDK) titles. They are often launched before core OS components and networking services are running. As a result, attempting to call most networking and security APIs including `WinSock`, `WinHTTP`, `BCrypt`, `WinCrypt`, `schannel`, and `IPHLPAPI` too soon after the title is launched causes indeterminate behavior. This behavior can include unexpected failures, uninitialized return values, arbitrary packet loss, and potential memory corruption and crashes.

To avoid this indeterminate behavior, Microsoft Game Development Kit (GDK) titles should use the [XNetworkingGetConnectivityHint](../../reference/networking/xnetworking/functions/xnetworkinggetconnectivityhint.md) and [XNetworkingRegisterConnectivityHintChanged](../../reference/networking/xnetworking/functions/xnetworkingregisterconnectivityhintchanged.md) functions. In particular, the `XNetworkingConnectivityHint::networkInitialized` field indicates whether the network is initialized. Titles should wait for the `networkInitialized` field to be `true` before calling into networking and security APIs.

Many middleware libraries also internally use the networking and security APIs&mdash;even non-networking middleware can use the network stack for telemetry or debugging. Consult with the middleware provider for what to do in each instance. If the middleware itself doesn't wait for network initialization, you might have to delay loading the middleware until the network becomes initialized. Several libraries within the Microsoft Game Development Kit (GDK) such as [XSAPI](/windows/uwp/xbox-live/xsapi-flat-c) and [Azure PlayFab Party](game-mesh/playfab-party-intro-networking.md) require you to wait for the network to be initialized before using them.

<a id="SuspendResume"></a>
## Suspend and resume

Additionally, title suspend/resume cycles reset the `networkInitialized` field back to `false`. On suspend, titles should clean up all handles to all network and security components and cease all network operations. See the overview page for each networking API for more information about requirements for that API on suspend.  On resume, titles should again wait for the `networkInitialized` field to become `true` before attempting to reestablish connections and use any of the networking or security APIs. We recommend that the resume network initialization path is the same as the initial title launch path&mdash;on resume or on title launch, wait for the network to be initialized before starting your network code.  Middleware libraries that are unaware of suspend/resume such as XSAPI, GameChat2, and Azure PlayFab Party must be cleaned up on suspend and reinitialized on resume after waiting for the network to be initialized.

## Testing network initialization

Network initialization usually takes a couple of seconds on both resume and title launch and varies, based on console type and the user's network environment. During development, the network initialization is almost instantaneous. This can hide issues with various pieces of your title not properly waiting for the network to be initialized. To test network initialization scenarios, use `xbconfig NetworkInitDelayInSeconds=30` to add an arbitrary delay to the network initialization process. When using this setting, make sure to fully restart your title between each test by using `xbapp terminate /full`. Set `NetworkInitDelayInSeconds` back to `0` when you've finished testing.

## Network initialization code examples

The following code example shows you how to poll in a real-time, safe way for whether the network is initialized.
```cpp

bool IsNetworkInitialized()
{
    XNetworkingConnectivityHint connectivityHint;
    if (SUCCEEDED(XNetworkingGetConnectivityHint(&connectivityHint)))
    {
        return connectivityHint.networkInitialized;
    }
    return false;
}

```

The following code example shows how a title could block until the network is initialized.
```cpp
static
void
NetworkConnectivityHintChangedCallback(
    _In_ void* context,
    _In_ const XNetworkingConnectivityHint* connectivityHint
    )
{
    HANDLE networkInitializedEvent = static_cast<HANDLE>(context);
    if (connectivityHint->networkInitialized)
    {
        (void)SetEvent(networkInitializedEvent);
    }
}

HRESULT EnsureNetworkInitialized()
{
    HRESULT hr = S_OK;
    XNetworkingConnectivityHint connectivityHint;
    XTaskQueueHandle queue;

    hr = XTaskQueueCreate(XTaskQueueDispatchMode::Immediate, XTaskQueueDispatchMode::Immediate, &queue);
    if (SUCCEEDED(hr))
    {
        // Use the new XNetworking APIs to check if the network is initialized.
        hr = XNetworkingGetConnectivityHint(&connectivityHint);
        if (SUCCEEDED(hr))
        {
            if (!connectivityHint.networkInitialized)
            {
                // The network isn't initialized. Wait until the network becomes initialized.
                HANDLE networkInitializedEvent = CreateEvent(nullptr, TRUE, FALSE, nullptr);
                if (networkInitializedEvent != nullptr)
                {
                    XTaskQueueRegistrationToken token;
                    hr = XNetworkingRegisterConnectivityHintChanged(queue, networkInitializedEvent, NetworkConnectivityHintChangedCallback, &token);
                    if (SUCCEEDED(hr))
                    {
                        DWORD result = WaitForSingleObjectEx(networkInitializedEvent, INFINITE, FALSE);
                        if (result != WAIT_OBJECT_0)
                        {
                            hr = HRESULT_FROM_WIN32(GetLastError());
                        }

                        XNetworkingUnregisterConnectivityHintChanged(token, true);
                    }

                    CloseHandle(networkInitializedEvent);
                }
                else
                {
                    hr = HRESULT_FROM_WIN32(GetLastError());
                }
            }
        }

        XTaskQueueCloseHandle(queue);
    }

    return hr;
}

```

## Network information

Network information in Microsoft Game Development Kit (GDK) titles can be retrieved with the [XNetworkingGetConnectivityHint](../../reference/networking/xnetworking/functions/xnetworkinggetconnectivityhint.md) API.

The [XNetworkingGetConnectivityHint](../../reference/networking/xnetworking/functions/xnetworkinggetconnectivityhint.md) API returns device-wide information network connectivity levels, data limits, wired versus wireless connectivity types, and whether the network is initialized. It's a real-time, safe API that immediately returns the current information. You can listen for changes with the [XNetworkingRegisterConnectivityHintChanged](../../reference/networking/xnetworking/functions/xnetworkingregisterconnectivityhintchanged.md) and [XNetworkingUnregisterConnectivityHintChanged](../../reference/networking/xnetworking/functions/xnetworkingunregisterconnectivityhintchanged.md) functions.

The following code example shows how to use the [XNetworkingGetConnectivityHint](../../reference/networking/xnetworking/functions/xnetworkinggetconnectivityhint.md) function to query information about the current network state.
```cpp

XNetworkingConnectivityHint connectivityHint;
if (SUCCEEDED(XNetworkingGetConnectivityHint(&connectivityHint)))
{
    printf(L"network initialized %u\n", connectivityHint.networkInitialized);
    printf(L"network connectivity level hint %u\n", connectivityHint.connectivityLevel);
    printf(L"network connectivity cost hint %u\n", connectivityHint.connectivityCost);
    printf(L"network approaching data limit %u\n", connectivityHint.approachingDataLimit);
    printf(L"network over data limit %u\n", connectivityHint.overDataLimit);
    printf(L"device is roaming %u\n", connectivityHint.roaming);
    switch (connectivityHint.ianaInterfaceType) {
    case IF_TYPE_ETHERNET_CSMACD:
        printf(L"network type is wired\n");
            break;
    case IF_TYPE_IEEE80211:
        printf(L"network type is wireless\n");
        break;
    case IF_TYPE_WWANPP:
    case IF_TYPE_WWANPP2:
        printf(L"network type is broadband\n");
        break;
    default:
        printf(L"network type is unusually esoteric %u\n", connectivityHint.connectivityLevel);
        break;
    }
}

```


## Network connectivity best practices

The fields in the returned [XNetworkingConnectivityHint](../../reference/networking/xnetworking/structs/xnetworkingconnectivityhint.md) struct other than the `XNetworkingConnectivityHint::networkInitialized` field are hints. They are the best-effort guess by the device as to the current state of the network. This is based on heuristics of observed network traffic on the device.

The state of `XNetworkingConnectivityLevelHint` represents a general network level approximation to simplify the connectivity logic for titles. Titles can expect `XNetworkingConnectivityLevelHint::None` to reflect network medium disconnect as well as general lack of connectivity in steady state where the network environment hasn't changed for several minutes. Other states don't represent whether there's connectivity to your specific title endpoints.

As a result, we recommend that after waiting for network initialization, you use `WinSock` and/or `WinHTTP` to try to establish a connection to your endpoint, regardless of the state of the `XNetworkingConnectivityHint::connectivityLevelHint` field. If those APIs subsequently fail, we recommend that you then use the [XNetworkingGetConnectivityHint](../../reference/networking/xnetworking/functions/xnetworkinggetconnectivityhint.md) API for additional UI and diagnostic reporting purposes. You should then wait for a change in the network connectivity level before trying again.


## Retrieving advanced network information

The vast majority of Microsoft Game Development Kit (GDK) titles should use the [XNetworkingGetConnectivityHint](../../reference/networking/xnetworking/functions/xnetworkinggetconnectivityhint.md) API in conjunction with the `WinSock` APIs for retrieving state about the network and basic network information such as IP addresses. If you need more information, the low-level [IP Helper API](/windows/desktop/IpHlp/ip-helper-start-page) is available in the GDK.

In general, work with the `IP Helper` API in the Microsoft Game Development Kit (GDK) the same way as you would work with this API in a Win32 program.

1. In your source files, `#include <iphlpapi.h>` after `#include <winsock2.h>`.

1. Link against `XGamePlatform.lib` instead of linking directly against `Ws2_32.lib` and `Iphlpapi.lib`.

Only the APIs under the `WINAPI\_PARTITION\_GAMES` API family work in Microsoft Game Development Kit (GDK) titles.

On Xbox consoles, certain information isn't accurate when using the `IP Helper` API because of underlying platform abstraction. This includes, but isn't limited to, the following:

- The MAC address will always be `AA-AA-AA-AA-AA-AA`.
- All interfaces always report a wired interface, regardless of the underlying network connection type. The true interface type is only retrievable from [XNetworkingGetConnectivityHint](../../reference/networking/xnetworking/functions/xnetworkinggetconnectivityhint.md).


<a id="ID4ETB"></a>


## Unsupported network connectivity APIs

The following network connectivity APIs aren't supported for Microsoft Game Development Kit (GDK) titles, which should instead use the [XNetworkingGetConnectivityHint](../../reference/networking/xnetworking/functions/xnetworkinggetconnectivityhint.md) API to determine network connectivity.

- [Windows.Networking.Connectivity Namespace](/uwp/api/windows.networking.connectivity)

- [Network List Manager](/windows/desktop/nla/portal)


## See also

[XNetworkingGetConnectivityHint](../../reference/networking/xnetworking/functions/xnetworkinggetconnectivityhint.md)

[XNetworkingRegisterConnectivityHintChanged](../../reference/networking/xnetworking/functions/xnetworkingregisterconnectivityhintchanged.md)

[XNetworkingUnregisterConnectivityHintChanged](../../reference/networking/xnetworking/functions/xnetworkingunregisterconnectivityhintchanged.md)

[Windows Sockets 2 (Winsock)](/windows/desktop/WinSock/windows-sockets-start-page-2)

[Windows HTTP Services (WinHTTP)](/windows/desktop/winhttp/winhttp-start-page)

[IP Helper API](/windows/desktop/IpHlp/ip-helper-start-page)