---
author: M-Stahl
title: GameInputUsage
description: Describes a specific HID usage.
kindex: GameInputUsage
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputUsage  

Describes a specific HID usage.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputUsage {  
    uint16_t page;  
    uint16_t id;  
} GameInputUsage  
```
  
<a id="membersSection"></a>

### Members  
  
*page*  
Type: uint16_t  
  
A page that designates a group of HID usages. 
  
*id*  
Type: uint16_t  
  
ID of the specific HID usage within *page*.  
  
<a id="remarksSection"></a>

## Remarks  

A Human Interface Device (HID) usage is indexed by page and ID in the current HID Usage Tables document. 

This structure is used in the [GameInputRawDeviceItemCollectionKind](../enums/gameinputrawdeviceitemcollectionkind.md) enumeration. It is also used in the following structures: 

- [GameInputDeviceInfo](gameinputdeviceinfo.md) 
- [GameInputHapticWaveFormInfo](gameinputhapticwaveforminfo.md) 
- [GameInputRawDeviceItemCollectionInfo](gameinputrawdeviceitemcollectioninfo.md) 
- [GameInputRawDeviceReportItemInfo](gameinputrawdevicereportiteminfo.md) 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Human Interface Device (HID) Information](https://www.usb.org/hid)  
[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  