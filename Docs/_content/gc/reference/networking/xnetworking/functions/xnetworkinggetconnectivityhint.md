---
author: M-Stahl
title: XNetworkingGetConnectivityHint
description: Queries for device-wide information about the current network connectivity level, data limits, interface type, and network initialization state.
kindex: XNetworkingGetConnectivityHint
ms.author: aablackm
ms.topic: reference
edited: 07/15/2020
security: public
applies-to: pc-gdk
---

# XNetworkingGetConnectivityHint

Queries for device-wide information about the current network connectivity level, data limits, interface type, and network initialization state. 

## Syntax

```cpp
HRESULT XNetworkingGetConnectivityHint(
         XNetworkingConnectivityHint* connectivityHint
)
```

### Parameters

*connectivityHint* &nbsp;&nbsp;\_Out\_  
Type: [XNetworkingConnectivityHint](../structs/xnetworkingconnectivityhint.md)\*

The current device-wide state of the network. 

### Return value

Type: HRESULT

HRESULT success or error code.

## Remarks 

This function returns device-wide information about the network connectivity level, data limits, wired vs. wireless connectivity, and whether the network is initialized. You can listen for changes with the [XNetworkingRegisterConnectivityHintChanged](xnetworkingregisterconnectivityhintchanged.md) and [XNetworkingUnregisterConnectivityHintChanged](xnetworkingunregisterconnectivityhintchanged.md) functions. 

The fields in the returned `XNetworkingConnectivityHint` structure (except the `XNetworkingConnectivityHint::networkInitialized` field) are hints. They are best-effort guesses by the device about the current state of the network based on a summary of the network traffic on the device. Importantly, these fields do not represent whether there is connectivity to your specific title endpoints. We recommend that, after waiting for network initialization, you use WinSock and/or WinHTTP to try to establish a connection to your endpoint regardless of the state of the `XNetworkingConnectivityHint::connectivityLevelHint` field. If those APIs subsequently fail, we recommend that you then use the `XNetworkingGetConnectivityHint` API for additional UI and diagnostic reporting purposes. You should then wait for a change in the network connectivity level before trying again. 

For more information about network initialization, see [Network Initialization & Connectivity](../../../../networking/overviews/initialization-connectivity-networking.md#ID4ETA). 

This method interrogates the local state within the calling process and returns quickly, so it is safe to call from time-sensitive contexts.

## Requirements

**Header:** XNetworking.h

**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[XNetworkingRegisterConnectivityHintChanged](xnetworkingregisterconnectivityhintchanged.md)  
[XNetworkingUnregisterConnectivityHintChanged](xnetworkingunregisterconnectivityhintchanged.md)  
[Detecting Network Initialization Status](../../../../networking/overviews/initialization-connectivity-networking.md)  
[XNetworking](../xnetworking_members.md)  
  