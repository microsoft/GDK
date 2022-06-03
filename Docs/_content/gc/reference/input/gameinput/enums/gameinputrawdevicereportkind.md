---
author: M-Stahl
title: GameInputRawDeviceReportKind
description: Enumerates types of raw device reports.
kindex: GameInputRawDeviceReportKind
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputRawDeviceReportKind  

Enumerates types of raw device reports.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputRawDeviceReportKind  
{  
    GameInputRawInputReport = 0,  
    GameInputRawOutputReport = 1,  
    GameInputRawFeatureReport = 2  
} GameInputRawDeviceReportKind  
```  
  
<a id="constantsSection"></a>

## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputRawInputReport | Input report. |  
| GameInputRawOutputReport | Output report. |  
| GameInputRawFeatureReport | Feature report. |  
  
<a id="remarksSection"></a>

## Remarks  

This enumeration is used in the [GameInputRawDeviceReportInfo](../structs/gameinputrawdevicereportinfo.md) structure. It is also used by the [IGameInputDevice::CreateRawDeviceReport](../interfaces/igameinputdevice/methods/igameinputdevice_createrawdevicereport.md) method. 

For intermediate and advanced use cases of the GameInput API, see [Advanced GameInput](../../../../input/advanced/input-advanced-topics.md) topics. 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  