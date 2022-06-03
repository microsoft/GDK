---
author: M-Stahl
title: XNetworkingRegisterConnectivityHintChanged
description: Registers title to changes in device-wide information about current network connectivity level, data limits, interface type, and network initialization state.
kindex: XNetworkingRegisterConnectivityHintChanged
ms.author: aablackm
ms.topic: reference
edited: 07/15/2020
security: public
applies-to: pc-gdk
---

# XNetworkingRegisterConnectivityHintChanged

Registers title to changes in device-wide information about the current network connectivity level, data limits, interface type, and network initialization state.

## Syntax

```cpp
HRESULT XNetworkingRegisterConnectivityHintChanged(
         XTaskQueueHandle queue,
         void* context,
         XNetworkingConnectivityHintChangedCallback* callback,
         XTaskQueueRegistrationToken* token
)
```

### Parameters

*queue* &nbsp;&nbsp;\_In\_opt\_  
Type: XTaskQueueHandle

The queue in which to place the callback when the connectivity hint changes. 

*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void\*

Optional context pointer to pass to the callback. 

*callback* &nbsp;&nbsp;\_In\_  
Type: XNetworkingConnectivityHintChangedCallback\*

Function to call when the connectivity hint changes. 

*token* &nbsp;&nbsp;\_Out\_  
Type: [XTaskQueueRegistrationToken](../../../system/xtaskqueue/structs/xtaskqueueregistrationtoken.md)\*

Token used to identify the callback when unregistering. 

### Return value 

Type: HRESULT

HRESULT success or error code.

## Remarks

This function registers a "connectivity hint changed" notification and sends an initial notification callback. 

To unregister a callback, use [XNetworkingUnregisterConnectivityHintChanged](xnetworkingunregisterconnectivityhintchanged.md). 

The fields in the returned `XNetworkingConnectivityHint` structure (except the `XNetworkingConnectivityHint::networkInitialized` field) are hints. They are best-effort guesses by the device about the current state of the network based on a summary of the network traffic on the device. Importantly, these fields do not represent whether there is connectivity to your specific title endpoints. We recommend that, after waiting for network initialization, you use WinSock and/or WinHTTP to try to establish a connection to your endpoint regardless of the state of the `XNetworkingConnectivityHint::connectivityLevelHint` field. If those APIs subsequently fail, we recommend that you then use the `XNetworkingGetConnectivityHint` API for additional UI and diagnostic reporting purposes. You should then wait for a change in the network connectivity level before trying again. 

For more information about network initialization, see [Network Initialization & Connectivity](../../../../networking/overviews/initialization-connectivity-networking.md). 

This method interrogates the local state within the calling process and returns quickly, so it is safe to call from time-sensitive contexts.

## Requirements

**Header:** XNetworking.h

**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XNetworkingGetConnectivityHint](xnetworkinggetconnectivityhint.md)  
[XNetworkingUnregisterConnectivityHintChanged](xnetworkingunregisterconnectivityhintchanged.md)  
[XNetworking](../xnetworking_members.md)  
  