---
author: M-Stahl
title: XNetworkingQueryPreferredLocalUdpMultiplayerPortAsyncResult
description: Gets the results from a QueryPreferredLocalUdpMultiplayerPortAsync call.
kindex: XNetworkingQueryPreferredLocalUdpMultiplayerPortAsyncResult
ms.author: v-doglov
ms.topic: reference
edited: 07/15/2020
security: public
applies-to: pc-gdk
---

# XNetworkingQueryPreferredLocalUdpMultiplayerPortAsyncResult

Gets the results from a [XNetworkingQueryPreferredLocalUdpMultiplayerPortAsync](xnetworkingquerypreferredlocaludpmultiplayerportasync.md) call.

## Syntax

```cpp
HRESULT XNetworkingQueryPreferredLocalUdpMultiplayerPortAsyncResult(
         XAsyncBlock* asyncBlock,
         uint16_t* preferredLocalUdpMultiplayerPort
)
```

### Parameters

*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock](../../../system/xasync/structs/xasyncblock.md)\*

Pointer to the [XAsyncBlock](../../../system/xasync/structs/xasyncblock.md) structure that was passed to the [XNetworkingQueryPreferredLocalUdpMultiplayerPortAsync](xnetworkingquerypreferredlocaludpmultiplayerportasync.md) function.

*preferredLocalUdpMultiplayerPort* &nbsp;&nbsp;\_Out\_  
Type: uint16_t\*

Pointer to the preferred local User Datagram Protocol (UDP) port number in host endian order.

### Return value

Type: HRESULT

HRESULT success or error code.

## Remarks  

This function gets the preferred local UDP port number for asynchronous multiplayer traffic when the `XAsyncBlock` structure gets passed to the `NetworkingQueryPreferredLocalUdpMultiplayerPortAsyncResult` function. For more information about the preferred local UDP multiplayer port being retrieved, see [Preferred local User Datagram Protocol (UDP) multiplayer port networking APIs](../../../../networking/overviews/game-mesh/preferred-local-udp-multiplayer-port-networking.md). For network information in Microsoft Game Development Kit (GDK) titles, see [Retrieving Network Information](../../../../networking/overviews/initialization-connectivity-networking.md).

The returned preferred local UDP multiplayer port is the local port utilized in a subsequent [socket bind](/windows/desktop/api/winsock/nf-winsock-bind) operation as opposed to the public port that remote devices might use to connect to the local device. It is meaningful only for UDP traffic rather than TCP or HTTP traffic because it is targeted specifically at multiplayer real-time title networking flows.

This port defaults to UDP 3074, but there are both automatic fallbacks when the port is determined not to be suitable for gaming traffic and a manual override that users can set through the Xbox network settings troubleshooter. The network behavior for this port is used to drive the user-visible NAT type of strict, moderate, and open. The port is used by Xbox Party Chat, the Xbox network troubleshooter, online Xbox Live troubleshooting documentation, and CSS troubleshooting flows and is often manually configured in home routers by users.

The returned port will already be configured in the user’s home router via UPnP to allow inbound and outbound packets.

The port should be treated just like every other port and should be used in conjunction with the [Windows Sockets (Winsock)](/windows/desktop/WinSock/windows-sockets-start-page-2) APIs. The title should bind to both IPv4 and IPv6 on this port or use a dual-stack socket and should bind to the `INADDR_ANY`/`in6addr_any` address.
 > [!NOTE]
 > The port is returned from this function in host endian order. The `sockaddr_in::sin_port` and `sockaddr_in6::sin6_port` fields are both in network endian order. The [htons](/windows/desktop/api/winsock/nf-winsock-htons) function should be used to convert the endianness of the returned port when passing it to the bind function.

The returned port is not guaranteed to be able to be used to establish a successful socket connection with the desired server or peers. Any normal title retry and fallback logic should be performed.

The title is expected to provide a security layer and any necessary Network Address Translation (NAT) detection and traversal implementations that it might require.

Titles are strongly recommended to use this port for their main game traffic socket flow for the best chance at having a successful connection. This port is used automatically by the [Microsoft Azure PlayFab Party](../../../../networking/overviews/game-mesh/playfab-party-intro-networking.md) library defaults to using this port. Unless you explicitly configure the PlayFab Party library to use a different port, the preferred local UDP multiplayer port should not be bound to directly.

This method interrogates the local state within the calling process and returns quickly, so it is safe to call from time-sensitive contexts.

## Requirements

**Header:** XNetworking.h

**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XNetworkingQueryPreferredLocalUdpMultiplayerPortAsync](xnetworkingquerypreferredlocaludpmultiplayerportasync.md)  
[XNetworking](../xnetworking_members.md)  
  