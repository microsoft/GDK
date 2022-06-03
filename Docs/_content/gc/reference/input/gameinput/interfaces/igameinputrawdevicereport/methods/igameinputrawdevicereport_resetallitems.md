---
author: M-Stahl
title: ResetAllItems
description: IGameInputRawDeviceReport ResetAllItems API reference
kindex: ResetAllItems
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# IGameInputRawDeviceReport::ResetAllItems  
> [!NOTE]
> This function is not yet implemented.

Resets all report items to their its original "rest" state values.
This will essentially re-initialize the device report buffer. 

## Syntax  
  
```cpp
bool ResetAllItems(  
)  
```  
  
### Parameters  
  
  
### Return value  

Type: bool  
  
Returns true on success; returns false otherwise.  
  
## Remarks  

This function is not yet implemented.
Currently has no function.
  
Once implemented, the [SetItemValue](igameinputrawdevicereport_setitemvalue.md), [ResetItemValue](igameinputrawdevicereport_resetitemvalue.md), and ResetAllItems methods can only be called for output and feature reports. All of these methods return very quickly, and are safe to call from any context.  
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
[IGameInputRawDeviceReport](../igameinputrawdevicereport.md)  
  
  