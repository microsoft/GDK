---
author: M-Stahl
title: XNetworkingConnectivityLevelHint
description: Defines connectivity level hints for a device.
kindex: XNetworkingConnectivityLevelHint
ms.author: aablackm
ms.topic: reference
edited: 07/15/2020
security: public
applies-to: pc-gdk
---

# XNetworkingConnectivityLevelHint

Defines connectivity level hints for a device. 

## Syntax

```cpp
enum class XNetworkingConnectivityLevelHint  : uint32_t
{
    Unknown = 0,
    None = 1,
    LocalAccess = 2,
    InternetAccess = 3,
    ConstrainedInternetAccess = 4,
}
```

## Constants

| Constant | Description | 
| --- | --- | 
| Unknown | Connectivity level is unknown. | 
| None | No connectivity. | 
| LocalAccess | Local network access only. | 
| InternetAccess | Local and internet access. | 
| ConstrainedInternetAccess | Limited internet access. | 

## Remarks

This enumeration defines the current connectivity level hints for a device. 

> ![note](../../../../../../resources/gamecore/images/en-us/common/note.gif)**NOTE:** The connectivity level hint is a best-effort guess by a device about the current state of the network based on a summary of the network traffic on the device. 

An `Unknown` connectivity level occurs when the network is not initialized. 

The `ConstrainedInternetAccess` value indicates captive portal connectivity, where local access to a web portal is provided, but access to the internet requires that specific credentials are provided via the portal. This level of connectivity is generally encountered when using connections hosted in public locations (such as coffee shops and book stores). However, the value does not guarantee detection of a captive portal. Titles should also determine whether the captive portal can be reached using a URL for the captive portal, or by attempting to access a public web site which then redirects to the captive portal when `LocalAccess` is reported. 

## Requirements

**Header:** XNetworking.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Network Initialization & Connectivity](../../../../networking/overviews/initialization-connectivity-networking.md)  
[XNetworkingConnectivityHint](../structs/xnetworkingconnectivityhint.md)  
[XNetworking](../xnetworking_members.md)    