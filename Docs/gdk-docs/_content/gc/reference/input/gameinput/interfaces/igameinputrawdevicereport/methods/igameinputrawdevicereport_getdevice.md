---
author: M-Stahl
title: GetDevice
description: Retrieves the device associated with the raw device report.
kindex: GetDevice
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
security: public
---

# IGameInputRawDeviceReport::GetDevice  
> [!NOTE]
> This function is not yet implemented.

Retrieves the device associated with the raw device report.  

## Syntax  
  
```cpp
void GetDevice(  
         IGameInputDevice** device  
)  
```  
  
### Parameters  
  
*device* &nbsp;&nbsp;\_Outptr\_  
Type: IGameInputDevice**  
  
The device associated with the raw device report.  

  
### Return value  

Type: void
  
## Remarks  
  
The ``IGameInputRawDeviceReport::GetDevice`` method currently sets the output device to ``nullptr``. The ``IGameInputRawDeviceReport`` interface encapsulates the raw byte buffers for device input, output, and feature reports. This allows the GameInput implementation to control ownership of the memory buffers, track which device the raw report is associated with, and account for any differences in the headers and formatting between the various supported device protocols. The process to acquire a raw device report depends on the type of report.


  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md)  
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)   
[IGameInputRawDeviceReport](../igameinputrawdevicereport.md)  
  
  