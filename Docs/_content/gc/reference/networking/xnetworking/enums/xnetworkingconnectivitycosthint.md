---
author: M-Stahl
title: XNetworkingConnectivityCostHint
description: Defines data-limit classification hints for a device.
kindex: XNetworkingConnectivityCostHint
ms.author: aablackm
ms.topic: reference
edited: 07/15/2020
security: public
applies-to: pc-gdk
---

# XNetworkingConnectivityCostHint

Defines data-limit classification hints for a device. 

## Syntax

```cpp
enum class XNetworkingConnectivityCostHint  : uint32_t
{
    Unknown = 0,
    Unrestricted = 1,
    Fixed = 2,
    Variable = 3,
}
```

## Constants

| Constant | Description |
| --- | --- |
| Unknown | Cost information is not available. |
| Unrestricted | The connection is unlimited and has unrestricted usage charges and capacity. |
| Fixed | The use of this connection is unrestricted up to a specific limit. |
| Variable | The connection cost is determined on a per-byte basis. |

## Remarks

This enumeration determines whether the device has limits and whether the data limits are fixed or variable. 

> ![note](../../../../../../resources/gamecore/images/en-us/common/note.gif)**NOTE:** The data-limit hint is a best-effort guess by a device about the current state of the network based on a summary of the network traffic on the device. 

An unknown connectivity cost occurs when the network is not initialized. Unrestricted connectivity refers to a connection that is unlimited and has unrestricted usage charges and capacity. Fixed connectivity refers to the use of a connection that is unrestricted up to a specific limit. Variable connectivity refers to the connection cost that is determined on a per-byte basis.

## Requirements

**Header:** XNetworking.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Retrieving Network Information](../../../../networking/overviews/initialization-connectivity-networking.md)  
[XNetworkingConnectivityHint](../structs/xnetworkingconnectivityhint.md)  
[XNetworking](../xnetworking_members.md)  
  