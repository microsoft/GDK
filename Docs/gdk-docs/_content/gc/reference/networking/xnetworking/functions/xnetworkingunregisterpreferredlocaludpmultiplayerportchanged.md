---
author: M-Stahl
title: XNetworkingUnregisterPreferredLocalUdpMultiplayerPortChanged
description: Unregisters a callback function that was registered with RegisterPreferredLocalUdpMultiplayerPortChanged.
kindex: XNetworkingUnregisterPreferredLocalUdpMultiplayerPortChanged
ms.author: v-doglov
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XNetworkingUnregisterPreferredLocalUdpMultiplayerPortChanged

Unregisters a callback function that was registered with [XNetworkingRegisterPreferredLocalUdpMultiplayerPortChanged](xnetworkingregisterpreferredlocaludpmultiplayerportchanged.md).

## Syntax

```cpp
bool XNetworkingUnregisterPreferredLocalUdpMultiplayerPortChanged(
         XTaskQueueRegistrationToken token,
         bool wait
)
```

### Parameters

*token* &nbsp;&nbsp;\_In\_  
Type: [XTaskQueueRegistrationToken](../../../system/xtaskqueue/structs/xtaskqueueregistrationtoken.md)

The token returned from [XNetworkingRegisterPreferredLocalUdpMultiplayerPortChanged](xnetworkingregisterpreferredlocaludpmultiplayerportchanged.md).

*wait* &nbsp;&nbsp;\_In\_  
Type: bool

Indicates whether to block until any pending callbacks are completed.

### Return value 

Type: bool

Returns false if *wait* is false and the unregister call is pending. Returns true otherwise.

## Remarks
  > [!NOTE]
> This function is safe to call on a time-sensitive thread only if the *wait* parameter is false. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
This function performs the following actions:

* The callback associated with the token is removed from the set of registered callbacks.
* If no callbacks are executing for that callback token, the call returns true.
* If callbacks are executing and *wait* is true, the call blocks until the executing callback has finished.
* If callbacks are executing and *wait* is false, the call does not block but does return false. When the callback for the token is complete, the token is automatically unregistered.

This mechanism allows for the following coding patterns:

* You can block on unregistration to ensure your callbacks are never invoked after an unregister call.
* You can choose not to block. If you need to ensure your callbacks are completed before deleting data, you can periodically call this function with *wait* set to false. When it finally returns true, all your callbacks are completed and you can delete the state.
* If your callback doesn't care whether it is being invoked during an unregister call, you can pass false for *wait* and ignore the return value.

## Requirements

**Header:** XNetworking.h

**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
  
[XNetworkingQueryPreferredLocalUdpMultiplayerPort](xnetworkingquerypreferredlocaludpmultiplayerport.md)  
[Preferred local UDP multiplayer port networking APIs](../../../../networking/overviews/game-mesh/preferred-local-udp-multiplayer-port-networking.md)  
[XNetworking](../xnetworking_members.md)  
  