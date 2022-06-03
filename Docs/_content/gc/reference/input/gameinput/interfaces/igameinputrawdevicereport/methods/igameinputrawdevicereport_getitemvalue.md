---
author: M-Stahl
title: GetItemValue
description: IGameInputRawDeviceReport GetItemValue API reference
kindex: GetItemValue
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# IGameInputRawDeviceReport::GetItemValue  
> [!NOTE]
> This function is not yet implemented.

Reads an individual item from the report buffer.  

## Syntax  
  
```cpp
bool GetItemValue(  
         uint32_t itemIndex,  
         int64_t* value  
)  
```  
  
### Parameters  
  
*itemIndex* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

  
Index for the report item.


*value* &nbsp;&nbsp;\_Out\_  
Type: int64_t*  

  
Value of the item read from the device report buffer.  

  
### Return value  
Type: bool
  
This function is not yet implemented.

  
Once implemented, false is returned if the requested item index is out of range.  

## Remarks  

Valid indexes for report items are based on the *itemCount* member of [GameInputRawDeviceReportInfo](../../../structs/gameinputrawdevicereportinfo.md)  
  
Rarely, reports may contain items that are large byte arrays (indicated by the GameInputBufferedItem flag in the item’s GameInputRawDeviceReportItemInfo structure). These items are not supported by the GetItemValue and SetItemValue methods, and can only be accessed via the full report buffer by using the GetRawData and SetRawData methods. Attempting to get or set the value of such items using the GetItemValue and SetItemValue methods results in false being returned.  
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
[IGameInputRawDeviceReport](../igameinputrawdevicereport.md)  
  
  