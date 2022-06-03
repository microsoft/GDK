---
author: M-Stahl
title: GetRawReport
description: Retrieves the raw data from the device input.
kindex: GetRawReport
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
security: public
---

# IGameInputReading::GetRawReport  
> [!NOTE]
> This function is not yet implemented.

Retrieves the raw data from the device input.  

## Syntax  
  
```cpp
bool GetRawReport(  
         IGameInputRawDeviceReport** report  
)  
```  
  
### Parameters  
  
*report* &nbsp;&nbsp;\_Outptr\_result\_maybenull\_  
Type: IGameInputRawDeviceReport**  

Raw data device input.  


### Return value  

Type: bool


Returns false.
  
After this method gets implemented, it will return true if raw data is retrieved successfully.  
  
## Remarks  

Input reports can only be retrieved from the ``GetRawReport`` method on the ``IGameInputReading`` interface. They are never directly created. These reports contain the raw data that is used to generate the rudimentary and fixed-format state available from the ``IGameInputReading`` interface. Applications can analyze the raw data in an input reading. They cannot modify the raw data. For intermediate and advanced use-cases of the GameInput API, see [Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md).
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Overview of GameInput](../../../../../../input/overviews/input-overview.md)    
[IGameInputReading](../igameinputreading.md)  
  
  