---
author: M-Stahl
title: GameInputRawDeviceReportInfo
description: Describes a report of the raw stream from an input device.
kindex: GameInputRawDeviceReportInfo
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputRawDeviceReportInfo  

Describes a report of the raw stream from an input device.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputRawDeviceReportInfo {  
    GameInputRawDeviceReportKind kind;  
    uint32_t id;  
    uint32_t size;  
    uint32_t itemCount;  
    GameInputRawDeviceReportItemInfo const * items;  
} GameInputRawDeviceReportInfo  
```
  
<a id="membersSection"></a>

### Members  
  
*kind*  
Type: [GameInputRawDeviceReportKind](../enums/gameinputrawdevicereportkind.md)  
  
The type of this report.  
  
*id*  
Type: uint32_t  
  
The ID of this report.
  
*size*  
Type: uint32_t  
  
The size of this report.  
  
*itemCount*  
Type: uint32_t  
  
The number of items in this report.  
  
*items*  
Type: [GameInputRawDeviceReportItemInfo](gameinputrawdevicereportiteminfo.md) const *  
  
A pointer to the information in this report.  
  
<a id="remarksSection"></a>

## Remarks  

This structure is used in the following structures: 

- [GameInputDeviceInfo](gameinputdeviceinfo.md) 
- [GameInputControllerAxisInfo](gameinputcontrolleraxisinfo.md) 
- [GameInputControllerButtonInfo](gameinputcontrollerbuttoninfo.md) 
- [GameInputControllerSwitchInfo](gameinputcontrollerswitchinfo.md) 

For more information, see the [GetDeviceInfo](../interfaces/igameinputdevice/methods/igameinputdevice_getdeviceinfo.md) method of [IGameInputDevice](../interfaces/igameinputdevice/igameinputdevice.md). 

For intermediate and advanced use cases of the GameInput API, see [Advanced GameInput](../../../../input/advanced/input-advanced-topics.md) topics. 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  