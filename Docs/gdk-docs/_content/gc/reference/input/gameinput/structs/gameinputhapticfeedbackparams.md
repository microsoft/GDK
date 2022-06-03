---
author: M-Stahl
title: GameInputHapticFeedbackParams
description: Describes a haptic feedback effect for an input device.
kindex: GameInputHapticFeedbackParams
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputHapticFeedbackParams  

Describes a haptic feedback effect for an input device.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputHapticFeedbackParams {  
    uint32_t waveformIndex;  
    uint64_t duration;  
    float intensity;  
    uint32_t playCount;  
    uint64_t repeatDelay;  
} GameInputHapticFeedbackParams  
```
  
<a id="membersSection"></a>

### Members  
  
*waveformIndex*  
Type: uint32_t  
  
Index of the waveform for the effect. (See the *waveformInfo* member of [GameInputHapticFeedbackMotorInfo](gameinputhapticfeedbackmotorinfo.md).) 
  
*duration*  
Type: uint64_t  
  
Duration, in microseconds, of the effect.  
  
*intensity*  
Type: float  
  
Intensity of the effect as a normalized value in the range of [0.0, 1.0].  
  
*playCount*  
Type: uint32_t  
  
Number of times the effect will be played.  
  
*repeatDelay*  
Type: uint64_t  
  
Time, in microseconds, to delay before repeating the effect.  
  
<a id="remarksSection"></a>

## Remarks 

This structure is used by the [IGameInputDevice::SetHapticMotorState](../interfaces/igameinputdevice/methods/igameinputdevice_sethapticmotorstate.md) method. 

For information about a haptic feedback motor, examine [GameInputHapticFeedbackMotorInfo](gameinputhapticfeedbackmotorinfo.md). The *waveformInfo* member contains descriptions ([GameInputHapticWaveformInfo](gameinputhapticwaveforminfo.md)) of the available waveforms. 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  