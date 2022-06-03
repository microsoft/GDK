---
author: M-Stahl
title: GameInputHapticFeedbackMotorInfo
description: Describes a haptic feedback motor in an input device.
kindex: GameInputHapticFeedbackMotorInfo
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputHapticFeedbackMotorInfo  

Describes a haptic feedback motor in an input device.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputHapticFeedbackMotorInfo {  
    GameInputRumbleMotors mappedRumbleMotor;  
    GameInputLocation location;  
    uint32_t locationId;  
    uint32_t waveformCount;  
    GameInputHapticWaveformInfo const * waveformInfo;  
} GameInputHapticFeedbackMotorInfo  
```
  
<a id="membersSection"></a>

### Members  
  
*mappedRumbleMotor*  
Type: [GameInputRumbleMotors](../enums/gameinputrumblemotors.md)  
  
The rumble motors that are mapped to the haptic feedback motor. If a device does not have rumble motors and a title calls [IGameInputDevice::SetRumbleState](../interfaces/igameinputdevice/methods/igameinputdevice_setrumblestate.md), GameInput can attempt to apply the rumble-motor intensities to the haptic feedback motor. 
  
*location*  
Type: [GameInputLocation](../enums/gameinputlocation.md)  
  
Location of the haptic feedback motor.  
  
*locationId*  
Type: uint32_t  
  
ID of the location of the haptic feedback motor.  
  
*waveformCount*  
Type: uint32_t  
  
Count of waveforms for the haptic feedback motor.  
  
*waveformInfo*  
Type: [GameInputHapticWaveformInfo](gameinputhapticwaveforminfo.md) const *  
  
Pointer to array of waveform descriptions. 
  
<a id="remarksSection"></a>

## Remarks  

This structure is used in the [GameInputDeviceInfo](gameinputdeviceinfo.md) structure. For more information, see [GetDeviceInfo](../interfaces/igameinputdevice/methods/igameinputdevice_getdeviceinfo.md). 

To send a waveform to a haptic feedback motor, use [IGameInputDevice::SetHapticMotorState](../interfaces/igameinputdevice/methods/igameinputdevice_sethapticmotorstate.md). 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  