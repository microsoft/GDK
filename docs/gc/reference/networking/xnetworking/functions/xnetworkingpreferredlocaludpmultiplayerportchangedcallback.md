---
author: M-Stahl
title: XNetworkingPreferredLocalUdpMultiplayerPortChangedCallback
description: Gets called when the preferred local multiplayer port is changed.
kindex: XNetworkingPreferredLocalUdpMultiplayerPortChangedCallback
ms.author: v-doglov
ms.topic: reference
edited: 07/15/2020
security: public
applies-to: pc-gdk
---

# XNetworkingPreferredLocalUdpMultiplayerPortChangedCallback

Gets called when the preferred local multiplayer port is changed.

## Syntax

```cpp
void XNetworkingPreferredLocalUdpMultiplayerPortChangedCallback(
         void* context,
         uint16_t preferredLocalUdpMultiplayerPort
)
```

### Parameters

*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void\*

An optional context pointer that was passed to the [XNetworkingRegisterPreferredLocalUdpMultiplayerPortChanged](xnetworkingregisterpreferredlocaludpmultiplayerportchanged.md) function.

*preferredLocalUdpMultiplayerPort* &nbsp;&nbsp;\_In\_  
Type: uint16_t

Pointer to the preferred local User Datagram Protocol (UDP) multiplayer port in host order.

### Return value

Type: void

## Remarks

`XNetworkingPreferredLocalUdpMultiplayerPortChangedCallback` gets called when the title listens for changes in the preferred local UDP multiplayer port. All attempts are made to ensure the preferred local UDP multiplayer port does not change while the title is running. However, there are unavoidable cases where the port will change due to the user’s external network conditions changing and invalidating any existing socket flows. The port is especially likely to change when the [network connectivity level](../../../../networking/overviews/initialization-connectivity-networking.md) changes, or as part of a title’s suspend/resume cycle.

For more information, see the "Changes in the preferred local UDP multiplayer port" section of [Preferred local User Datagram Protocol (UDP) multiplayer port networking APIs](../../../../networking/overviews/game-mesh/preferred-local-udp-multiplayer-port-networking.md). 

This method interrogates the local state within the calling process and returns quickly, so it is safe to call from time-sensitive contexts.

## Requirements

**Header:** XNetworking.h

**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
 
[XNetworkingRegisterPreferredLocalUdpMultiplayerPortChanged](xnetworkingregisterpreferredlocaludpmultiplayerportchanged.md)  
[XNetworking](../xnetworking_members.md)
  