---
author: M-Stahl
title: IGameInputRawDeviceReport::GetReportInfo
description: Returns a pointer to a raw device report.
kindex: IGameInputRawDeviceReport::GetReportInfo
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
security: public
---

# IGameInputRawDeviceReport::GetReportInfo  
> [!NOTE]
> This function is not yet implemented.

Returns a pointer to a raw device report.  

## Syntax  
  
```cpp
GameInputRawDeviceReportInfo* GetReportInfo(  
)  
```  
  
### Parameters  
  
This method has no parameters.    
  
### Return value 
 
Type: GameInputRawDeviceReportInfo*
  
Returns ``nullptr``.  

After this method gets implemented, it will return a value that defines a report form of a raw input device.  
  
## Remarks 

The ``IGameInputRawDeviceReport::GetReportInfo`` method returns a value that defines a report form to the input stream of a raw input device. The [IGameInputRawDeviceReport](../igameinputrawdevicereport.md) interface encapsulates the raw byte buffers for device input, output, and feature reports. This allows the GameInput implementation to control ownership of the memory buffers, track which device the raw report is associated with, and account for any differences in headers and formatting between the various supported device protocols. The process to acquire a raw device report depends on the type of report.

Input reports can only be retrieved from the [GetRawReport](../../igameinputreading/methods/igameinputreading_getrawreport.md) method on the ``IGameInputReading`` interface (never directly created).  These reports contain the raw data that is used to generate the rudimentary and fixed-format state available from the ``IGameInputReading`` interface.  Applications can examine the raw data in an input reading, but they may not modify the raw data.

Output and feature reports are created using the [CreateRawDeviceReport](../../igameinputdevice/methods/igameinputdevice_createrawdevicereport.md) method or are received from a successful call to the ``GetRawDeviceFeature`` method that are both on the ``IGameInputDevice`` interface. Applications are free to read or modify the contents of output and feature reports. Both types of reports can be passed as many times as desired into the [SendRawDeviceOutput](../../igameinputdevice/methods/igameinputdevice_sendrawdeviceoutput.md) and [SetRawDeviceFeature](../../igameinputdevice/methods/igameinputdevice_setrawdevicefeature.md) methods of the ``IGameInputDevice`` interface. This allows applications to prepare a template report once, and send it to the device repeatedly (possibly modifying certain data items each time).

When a new output or feature report is created using the ``CreateRawDeviceReport`` method, the report's buffer contents are initialized such that all of the data elements are set to neutral or "rest" values.
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md)  
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInputRawDeviceReport](../igameinputrawdevicereport.md)

  
  