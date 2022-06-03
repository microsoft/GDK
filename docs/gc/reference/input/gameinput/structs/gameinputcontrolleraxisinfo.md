---
author: M-Stahl
title: GameInputControllerAxisInfo
description: Describes an axis on an input device.
kindex: GameInputControllerAxisInfo
ms.author: angillie
ms.topic: reference
edited: '08/28/2020'
security: public
---

# GameInputControllerAxisInfo  

Describes an axis on an input device.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputControllerAxisInfo {  
    GameInputKind mappedInputKinds;  
    GameInputLabel label;  
    bool isContinuous;  
    bool isNonlinear;  
    bool isQuantized;  
    bool hasRestValue;  
    float restValue;  
    uint64_t resolution;  
    uint16_t legacyDInputIndex;  
    uint16_t legacyHidIndex;  
    uint32_t rawReportIndex;  
    GameInputRawDeviceReportInfo const * inputReport;  
    GameInputRawDeviceReportItemInfo const * inputReportItem;  
} GameInputControllerAxisInfo  
```
  
<a id="membersSection"></a>

### Members  
  
*mappedInputKinds*  
Type: [GameInputKind](../enums/gameinputkind.md)  
  
The kinds of input state, if any, to which this axis contributes.  
  
*label*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for the axis.  
  
*isContinuous*  
Type: bool  
  
Indicates whether the axis is continuous; that is, the axis can increase to its maximum and then "wrap around" to its minimum value (and vice versa). An example is a dial that spins freely in both directions with no stops.  
  
*isNonlinear*  
Type: bool  
  
Indicates whether the axis is nonlinear.  
  
*isQuantized*  
Type: bool  
  
Indicates whether the axis is quantized. Quantized input indicates the device can produce higher resolution changes than can be represented with a 32-bit float value. For full precision, parse the raw payload data. 
  
*hasRestValue*  
Type: bool  
  
Indicates whether the axis has a rest value. Axes that have physical "home" positions (such as the center position of a thumbstick or the "released" position of a brake pedal) have rest values. Axes that do not have home positions (such as a throttle on a flight stick) do not have rest values.  
  
*restValue*  
Type: float  
  
The rest value of the axis (when *hasRestValue* is true).  
  
*resolution*  
Type: uint64_t  
  
The number of unique values that can be represented by the axis.  
  
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
  