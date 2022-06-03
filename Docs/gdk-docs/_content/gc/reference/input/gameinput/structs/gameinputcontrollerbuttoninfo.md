---
author: M-Stahl
title: GameInputControllerButtonInfo
description: Describes a button on an input device.
kindex: GameInputControllerButtonInfo
ms.author: angillie
ms.topic: reference
edited: '08/28/2020'
security: public
---

# GameInputControllerButtonInfo  

Describes a button on an input device.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputControllerButtonInfo {  
    GameInputKind mappedInputKinds;  
    GameInputLabel label;  
    uint16_t legacyDInputIndex;  
    uint16_t legacyHidIndex;  
    uint32_t rawReportIndex;  
    GameInputRawDeviceReportInfo const * inputReport;  
    GameInputRawDeviceReportItemInfo const * inputReportItem;  
} GameInputControllerButtonInfo  
```
  
<a id="membersSection"></a>

### Members  
  
*mappedInputKinds*  
Type: [GameInputKind](../enums/gameinputkind.md)  
  
The kinds of input state, if any, to which this button contributes.  
  
*label*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for the button.  
  
*legacyDInputIndex*  
Type: uint16_t  
  
Legacy DirectInput index. 
  
*legacyHidIndex*  
Type: uint16_t  
  
Legacy HID index.  
  
*rawReportIndex*  
Type: uint32_t  
  
Index for the raw report.  
  
*inputReport*  
Type: [GameInputRawDeviceReportInfo](gameinputrawdevicereportinfo.md) const \*  
  
Pointer to the raw device report.  
  
*inputReportItem*  
Type: [GameInputRawDeviceReportItemInfo](gameinputrawdevicereportiteminfo.md) const \*  
  
Pointer to the raw device-report item.  
  
<a id="remarksSection"></a>

## Remarks  

This structure is used in the [GameInputDeviceInfo](gameinputdeviceinfo.md) structure. `GameInputDeviceInfo` is used by the [IGameInputDevice::GetDeviceInfo](../interfaces/igameinputdevice/methods/igameinputdevice_getdeviceinfo.md) method. 

For more information, see [GameInput devices](../../../../input/overviews/input-devices.md). 
  
<a id="requirementsSection"></a>
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)
  