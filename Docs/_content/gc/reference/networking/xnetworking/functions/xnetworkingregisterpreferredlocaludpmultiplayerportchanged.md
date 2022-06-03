---
author: M-Stahl
title: XNetworkingRegisterPreferredLocalUdpMultiplayerPortChanged
description: Registers a callback function to call when the preferred local UDP multiplayer port changes.
kindex: XNetworkingRegisterPreferredLocalUdpMultiplayerPortChanged
ms.author: v-doglov
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XNetworkingRegisterPreferredLocalUdpMultiplayerPortChanged

Registers a callback function to call when the preferred local UDP multiplayer port changes.

## Syntax

```cpp
HRESULT XNetworkingRegisterPreferredLocalUdpMultiplayerPortChanged(
         XTaskQueueHandle queue,
         void* context,
         XNetworkingPreferredLocalUdpMultiplayerPortChangedCallback* callback,
         XTaskQueueRegistrationToken* token
)
```

### Parameters

*queue* &nbsp;&nbsp;\_In\_opt\_  
Type: XTaskQueueHandle

Queue in which to register the callback. Both the work and completion sides of the queue are used.

*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*

Optional context pointer to pass to the callback.

*callback* &nbsp;&nbsp;\_In\_  
Type: [XNetworkingPreferredLocalUdpMultiplayerPortChangedCallback](xnetworkingpreferredlocaludpmultiplayerportchangedcallback.md)\*

Callback function to call when the preferred port changes.

*token* &nbsp;&nbsp;\_Out\_  
Type: [XTaskQueueRegistrationToken](../../../system/xtaskqueue/structs/xtaskqueueregistrationtoken.md)\*

Token used to identify the callback when calling [XNetworkingUnregisterPreferredLocalUdpMultiplayerPortChanged](xnetworkingunregisterpreferredlocaludpmultiplayerportchanged.md). 

### Return value

Type: HRESULT

HRESULT success or error code.

## Remarks

Registering for a preferred local User Datagram Protocol (UDP) multiplayer port change notification always fires an initial notification callback.

All attempts are made to ensure the preferred local UDP multiplayer port does not change while a title is running. However, there are unavoidable cases where the port will change due to the user's external network conditions changing and invalidating any existing socket flows. In particular, the port is much more likely to change when the [network connectivity level](../../../../networking/overviews/initialization-connectivity-networking.md) changes or as part of a title suspend/resume cycle.

When the preferred local UDP multiplayer port changes, additional inbound connections from future peers may be blocked on any previous preferred port. This may not cause a failure at the socket layer, but the title may eventually stop receiving packets on any socket bound to any previous preferred port.

Packets sent to and from existing peers may continue to function and so a preferred local UDP multiplayer port change notification may not be fatal to any in-progress game session.

When a change notification occurs, the title should migrate to a new socket bound on the new preferred port at the earliest opportunity without interrupting any existing game play. If the title detects a connection loss and retries the socket connection, the title should always use the most recent preferred port.

This method interrogates the local state within the calling process and returns quickly, so it is safe to call from time-sensitive contexts.

## Requirements

**Header:** XNetworking.h

**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[Preferred local UDP multiplayer port networking APIs](../../../../networking/overviews/game-mesh/preferred-local-udp-multiplayer-port-networking.md)  
[XNetworking](../xnetworking_members.md)  
  