---
author: M-Stahl
title: XNetworkingConnectivityHint
description: Defines the current device-wide state of the network, including network connectivity level, data limits, interface type, and network initialization state.
kindex: XNetworkingConnectivityHint
ms.author: aablackm
ms.topic: reference
edited: 07/15/2020
security: public
applies-to: pc-gdk
---

# XNetworkingConnectivityHint

Defines the current device-wide state of the network, including network connectivity level, data limits, interface type, and network initialization state.

## Syntax

```cpp
typedef struct XNetworkingConnectivityHint {
    XNetworkingConnectivityLevelHint connectivityLevel;
    XNetworkingConnectivityCostHint connectivityCost;
    uint32_t ianaInterfaceType;
    bool networkInitialized;
    bool approachingDataLimit;
    bool overDataLimit;
    bool roaming;
} XNetworkingConnectivityHint
```

### Members

*connectivityLevel*  
Type: [XNetworkingConnectivityLevelHint](../enums/xnetworkingconnectivitylevelhint.md)

The current best-effort connectivity level for the device.

*connectivityCost*  
Type: [XNetworkingConnectivityCostHint](../enums/xnetworkingconnectivitycosthint.md)

The current best-effort classification of the data limits for the device.

*ianaInterfaceType*  
Type: uint32_t

The current interface type that is likely to be used by WinSock and WinHTTP to reach the internet.  One of the [IANA NDIS Interface Types](/windows-hardware/drivers/network/ndis-interface-types).

*networkInitialized*  
Type: bool

Determines whether the network is currently initialized.  For more information, see the [Network Initialization](../../../../networking/overviews/initialization-connectivity-networking.md#ID4ETA) section of [Retrieving network information](../../../../networking/overviews/initialization-connectivity-networking.md).

*approachingDataLimit*  
Type: bool

Determines whether the device is close to exceeding its data limits.

*overDataLimit*  
Type: bool

Determines whether the device has exceeded its data limits.

*roaming*  
Type: bool

Determines whether the device is roaming or not.

## Remarks

Ensure that the *networkInitialized* member returns true before attempting to use any networking or security APIs. 

![alert](../../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** Attempting to use XNetworking APIs with a network that is not initialized will result in failed calls and unpredictable behavior. 
 
This structure is returned from the [XNetworkingGetConnectivityHint](../functions/xnetworkinggetconnectivityhint.md) API and callback from the register flow. For network information in Microsoft Game Development Kit (GDK) titles, see [Retrieving Network Information](../../../../networking/overviews/initialization-connectivity-networking.md). 

The fields in the returned `XNetworkingConnectivityHint` structure (except the `XNetworkingConnectivityHint::networkInitialized` field) are hints. They are best-effort guesses by the device about the current state of the network based on a summary of the network traffic on the device. Importantly, these fields do not represent whether there is connectivity to your specific title endpoints. We recommend that, after waiting for network initialization, you use WinSock and/or WinHTTP to try to establish a connection to your endpoint regardless of the state of the `XNetworkingConnectivityHint::connectivityLevelHint` field. If those APIs subsequently fail, we recommend that you then use the `XNetworkingGetConnectivityHint` API for additional UI and diagnostic reporting purposes. You should then wait for a change in the network connectivity level before trying again. 

## Requirements

**Header:** XNetworking.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XNetworking](../xnetworking_members.md)