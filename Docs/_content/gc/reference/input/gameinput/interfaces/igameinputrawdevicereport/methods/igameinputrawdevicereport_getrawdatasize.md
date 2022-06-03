---
author: M-Stahl
title: GetRawDataSize
description: Returns the size of the raw report buffer in bytes.
kindex: GetRawDataSize
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
security: public
---

# IGameInputRawDeviceReport::GetRawDataSize  
> [!NOTE]
> This function is not yet implemented.

Returns the size of the raw report buffer in bytes.

## Syntax  
  
```cpp
size_t GetRawDataSize(  
)  
```  
  
### Parameters  

This method has no parameters.  
  
### Return value  

Type: size_t


Returns 0.
  
After this method gets implemented, it will return the size of the raw data buffer.  
  
## Remarks  
  
The ``IGameInputRawDeviceReport::GetRawDataSize`` method returns the size of the raw report buffer in bytes.  For all device types like Human Interface Device (HID) devices, this value does not include the report ID byte or any other header data. This is tracked separately by the ``IGameInputRawDeviceReport`` instance and is added to the payload that gets sent to the device as appropriate.

For intermediate and advanced use-cases of the GameInput API, see [Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md).

  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Overview of GameInput](../../../../../../input/overviews/input-overview.md)    
[IGameInputRawDeviceReport](../igameinputrawdevicereport.md)  
  
  