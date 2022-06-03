---
author: M-Stahl
title: SetItemValue
description: IGameInputRawDeviceReport SetItemValue API reference
kindex: SetItemValue
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# IGameInputRawDeviceReport::SetItemValue  
> [!NOTE]
> This function is not yet implemented.

Write an item value to the device report buffer.  

## Syntax  
  
```cpp
bool SetItemValue(  
         uint32_t itemIndex,  
         int64_t value  
)  
```  
  
### Parameters  
  
*itemIndex* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

  
Index for the report item within the device report buffer.  


*value* &nbsp;&nbsp;\_In\_  
Type: int64_t  

  
Value to write to the report item.

### Return value  

Type: bool  
  
Returns true on success; returns false otherwise.  
  
  
## Remarks  

Valid indexes for report items are based on the *itemCount* member of [GameInputRawDeviceReportInfo](../../../structs/gameinputrawdevicereportinfo.md)  
  
Rarely, reports may contain items that are large byte arrays (indicated by the GameInputBufferedItem flag in the item’s GameInputRawDeviceReportItemInfo structure). These items are not supported by the GetItemValue and SetItemValue methods, and can only be accessed via the full report buffer by using the GetRawData and SetRawData methods. Attempting to get or set the value of such items using the GetItemValue and SetItemValue methods results in an error HRESULT being returned.  

The SetItemValue, [ResetItemValue](igameinputrawdevicereport_resetitemvalue.md), and [ResetAllItems](igameinputrawdevicereport_resetallitems.md) methods can only be called for output and feature reports. All of these methods return very quickly, and are safe to call from any context.  
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
[IGameInputRawDeviceReport](../igameinputrawdevicereport.md)  
  
  