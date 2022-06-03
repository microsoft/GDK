---
author: M-Stahl
title: GameInputHapticWaveformInfo
description: Describes characteristics of a haptic feedback effect.
kindex: GameInputHapticWaveformInfo
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputHapticWaveformInfo  

Describes characteristics of a haptic feedback effect.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputHapticWaveformInfo {  
    GameInputUsage usage;  
    bool isDurationSupported;  
    bool isIntensitySupported;  
    bool isRepeatSupported;  
    bool isRepeatDelaySupported;  
    uint64_t defaultDuration;  
} GameInputHapticWaveformInfo  
```
  
<a id="membersSection"></a>

### Members  
  
*usage*  
Type: [GameInputUsage](gameinputusage.md)  
  
ID of the HID usage for the haptic waveform. 
  
*isDurationSupported*  
Type: bool  
  
If true, the duration of the effect can be specified.  
  
*isIntensitySupported*  
Type: bool  
  
If true, the intensity level of the effect can be specified.  
  
*isRepeatSupported*  
Type: bool  
  
If true, the effect can be repeated.  
  
*isRepeatDelaySupported*  
Type: bool  
  
If true, a delay between repetitions of the effect can be specified.  
  
*defaultDuration*  
Type: uint64_t  
  
The default duration of the effect.  
  
<a id="remarksSection"></a>

## Remarks  

This structure is used in the [GameInputHapticFeedbackMotorInfo](gameinputhapticfeedbackmotorinfo.md) structure. `GameInputHapticFeedbackMotorInfo` is used in the [GameInputDeviceInfo](gameinputdeviceinfo.md) structure; for more information, see [GetDeviceInfo](../interfaces/igameinputdevice/methods/igameinputdevice_getdeviceinfo.md). 

To send a waveform to a haptic feedback motor, use [IGameInputDevice::SetHapticMotorState](../interfaces/igameinputdevice/methods/igameinputdevice_sethapticmotorstate.md). 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  