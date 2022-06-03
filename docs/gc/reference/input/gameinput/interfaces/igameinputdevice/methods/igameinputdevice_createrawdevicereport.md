---
author: M-Stahl
title: CreateRawDeviceReport
description: Creates a new buffer represented by an IGameInputRawDeviceReport instance.
kindex: CreateRawDeviceReport
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
security: public
---

# IGameInputDevice::CreateRawDeviceReport  
> [!NOTE]
> This function is not yet implemented.

Creates a new buffer represented by an [IGameInputRawDeviceReport](../../igameinputrawdevicereport/igameinputrawdevicereport.md) instance.  

## Syntax  
  
```cpp
HRESULT CreateRawDeviceReport(  
         uint32_t reportId,  
         GameInputRawDeviceReportKind reportKind,  
         IGameInputRawDeviceReport** report  
)  
```  
  
### Parameters  
  
*reportId* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
Device-defined ID for the created [InputRawDeviceReport](../../igameinputrawdevicereport/igameinputrawdevicereport.md) interface.


*reportKind* &nbsp;&nbsp;\_In\_  
Type: [GameInputRawDeviceReportKind](../../../enums/gameinputrawdevicereportkind.md)  
  
Defines the type of raw device report to create.
The ``GameInputRawDeviceReportKind`` enumeration only accepts the values of the ``GameInputRawFeatureReport`` and ``GameInputRawOutputReport`` constants.


*report* &nbsp;&nbsp;\_COM\_Outptr\_  
Type: IGameInputRawDeviceReport**  

The resulting ``IGameInputRawDeviceReport`` instance.  


  
### Return value  

Type: HRESULT
  
Returns ``E_NOTIMPL``.  
  
## Remarks  

The ``CreateRawDeviceReport`` method creates a buffer that is used to send raw information to the device. It is represented by the ``IGameInputRawDeviceReport`` instance. For intermediate and advanced use-cases of the GameInput API, see [Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md).

![alert](../../../../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** Creating import report buffers are not supported.


## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also 


[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInputDevice](../igameinputdevice.md)  
  
  