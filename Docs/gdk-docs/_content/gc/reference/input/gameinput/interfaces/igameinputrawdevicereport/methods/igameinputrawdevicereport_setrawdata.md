---
author: M-Stahl
title: SetRawData
description: Sets the contents of the report buffer.
kindex: SetRawData
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
security: public
---

# IGameInputRawDeviceReport::SetRawData  
> [!NOTE]
> This function is not yet implemented.

Sets the contents of the report buffer.  

## Syntax  
  
```cpp
bool SetRawData(  
         size_t bufferSize,  
         const void* buffer  
)  
```  
  
### Parameters  
  
*bufferSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Size of the raw data buffer to be set.  


*buffer* &nbsp;&nbsp;\_In\_reads\_(bufferSize)  
Type: void*  
  
Buffer to be written to.  

### Return value  

Type: bool  
  
Returns true on success; returns false otherwise.  

  
## Remarks  
  
The ``IGameInputRawDeviceReport::SetRawData`` method allows applications to set the report buffer contents directly. The caller must pass a source buffer whose size matches the value returned from the [GetRawDataSize](igameinputrawdevicereport_getrawdatasize.md) method. Setting the report buffer contents is  allowed only for output and feature reports.   
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  


[Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md)  
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInputRawDeviceReport](../igameinputrawdevicereport.md)  
  
  