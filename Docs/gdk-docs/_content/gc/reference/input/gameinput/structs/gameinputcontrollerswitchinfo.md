---
author: M-Stahl
title: GameInputControllerSwitchInfo
description: Describes a switch on an input device.
kindex: GameInputControllerSwitchInfo
ms.author: angillie
ms.topic: reference
edited: '08/28/2020'
security: public
---

# GameInputControllerSwitchInfo  

Describes a switch on an input device.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputControllerSwitchInfo {  
    GameInputKind mappedInputKinds;  
    GameInputLabel label;  
    GameInputLabel positionLabels[9];  
    GameInputSwitchKind kind;  
    uint16_t legacyDInputIndex;  
    uint16_t legacyHidIndex;  
    uint32_t rawReportIndex;  
    GameInputRawDeviceReportInfo const * inputReport;  
    GameInputRawDeviceReportItemInfo const * inputReportItem;  
} GameInputControllerSwitchInfo  
```
  
<a id="membersSection"></a>

### Members  
  
*mappedInputKinds*  
Type: [GameInputKind](../enums/gameinputkind.md)  
  
The kinds of input state, if any, to which this switch contributes.  
  
*label*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for the switch.  
  
*positionLabels*  
Type: [GameInputLabel](../enums/gameinputlabel.md)[9]  
  
Physical labels for up to nine possible positions of the switch.  
  
*kind*  
Type: [GameInputSwitchKind](../enums/gameinputswitchkind.md)  
  
The type of the switch.  
  
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
  