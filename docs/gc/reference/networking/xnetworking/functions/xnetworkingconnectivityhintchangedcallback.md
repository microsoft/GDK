---
author: M-Stahl
title: XNetworkingConnectivityHintChangedCallback
description: Gets called when the connectivity hint structure is changed.
kindex: XNetworkingConnectivityHintChangedCallback
ms.author: aablackm
ms.topic: reference
edited: 07/15/2020
security: public
applies-to: pc-gdk
---

# XNetworkingConnectivityHintChangedCallback

Gets called when the connectivity hint structure is changed.

## Syntax

```cpp
void XNetworkingConnectivityHintChangedCallback(
         void* context,
         const XNetworkingConnectivityHint* connectivityHint
)
```

### Parameters

*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void\*

An optional context pointer that was passed to the [XNetworkingRegisterConnectivityHintChanged](xnetworkingregisterconnectivityhintchanged.md) function.

*connectivityHint* &nbsp;&nbsp;\_In\_  
Type: [XNetworkingConnectivityHint](../structs/xnetworkingconnectivityhint.md)\*

The new device-wide connectivity hint structure.

### Return value

Type: void

## Remarks  

This callback function is called when something about the device's current connectivity changes. It includes the context pointer passed when the register function was called. The triggering of this callback does not guarantee that something changed from the last time the callback triggered.

![alert](../../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** Best-effort pertains to the current device-wide state of the network and network connectivity level. Network initialization must be respected that it is not best-effort because initialization can infrequently not happen.

The fields in the returned `XNetworkingConnectivityHint` structure (except the `XNetworkingConnectivityHint::networkInitialized` field) are hints. They are best-effort guesses by the device about the current state of the network based on a summary of the network traffic on the device. Importantly, these fields do not represent whether there is connectivity to your specific title endpoints. We recommend that, after waiting for network initialization, you use WinSock and/or WinHTTP to try to establish a connection to your endpoint regardless of the state of the `XNetworkingConnectivityHint::connectivityLevelHint` field. If those APIs subsequently fail, we recommend that you then use the `XNetworkingGetConnectivityHint` API for additional UI and diagnostic reporting purposes. You should then wait for a change in the network connectivity level before trying again. 

This method interrogates the local state within the calling process and returns quickly, so it is safe to call from time-sensitive contexts.

## Requirements

**Header:** XNetworking.h

**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Retrieving Network Information](../../../../networking/overviews/initialization-connectivity-networking.md)  
[XNetworkingGetConnectivityHint](xnetworkinggetconnectivityhint.md)  
[XNetworkingRegisterConnectivityHintChanged](xnetworkingregisterconnectivityhintchanged.md)  
[XNetworkingUnregisterConnectivityHintChanged](xnetworkingunregisterconnectivityhintchanged.md)  
[XNetworking](../xnetworking_members.md)