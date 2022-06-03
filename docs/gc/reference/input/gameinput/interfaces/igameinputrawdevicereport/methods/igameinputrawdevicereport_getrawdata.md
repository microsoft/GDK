---
author: M-Stahl
title: GetRawData
description: Retrieves the report buffer contents in raw byte form.
kindex: GetRawData
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
security: public
---

# IGameInputRawDeviceReport::GetRawData  
> [!NOTE]
> This function is not yet implemented.

Retrieves the report buffer contents in raw byte form.  

## Syntax  
  
```cpp
size_t GetRawData(  
         size_t bufferSize,  
         void* buffer  
)  
```  
  
### Parameters  
  
*bufferSize* &nbsp;&nbsp;\_In\_  
Type: size_t  

  
Size of the buffer passed into ``GetRawData``.  


*buffer* &nbsp;&nbsp;\_Out\_writes\_(bufferSize)  
Type: void*  

User-created buffer returned with raw data.
  
### Return value  

Type: size_t
  
Returns 0.  

After this method gets implemented, it will return the number of bytes written to the caller's buffer. 
  
## Remarks  
  
The ``IGameInputRawDeviceReport::GetRawData`` method allows applications to read the report buffer contents in raw byte form. The caller typically passes in a buffer whose size matches the value returned from the [GetRawDataSize](igameinputrawdevicereport_getrawdatasize.md) method. However, the ``GetRawData`` method accepts any size buffer. If the buffer is too small, the output is simply truncated. The return value from the ``GetRawData`` method indicates how many bytes were written to the caller’s buffer. This differs only from the value of the ``bufferSize`` parameter when a buffer is provided that is larger than required. 
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md)  
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)    
[IGameInputRawDeviceReport](../igameinputrawdevicereport.md)  
  
  