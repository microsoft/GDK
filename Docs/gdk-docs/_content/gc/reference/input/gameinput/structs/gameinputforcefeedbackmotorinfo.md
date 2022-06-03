---
author: M-Stahl
title: GameInputForceFeedbackMotorInfo
description: Defines the force-feedback motor information.
kindex: GameInputForceFeedbackMotorInfo
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
security: public
---

# GameInputForceFeedbackMotorInfo  

Defines the force-feedback motor information.  

## Syntax  
  
```cpp
typedef struct GameInputForceFeedbackMotorInfo {  
    GameInputFeedbackAxes supportedAxes;  
    GameInputLocation location;  
    uint32_t locationId;  
    uint32_t maxSimultaneousEffects;  
    bool isConstantEffectSupported;  
    bool isRampEffectSupported;  
    bool isSineWaveEffectSupported;  
    bool isSquareWaveEffectSupported;  
    bool isTriangleWaveEffectSupported;  
    bool isSawtoothUpWaveEffectSupported;  
    bool isSawtoothDownWaveEffectSupported;  
    bool isSpringEffectSupported;  
    bool isFrictionEffectSupported;  
    bool isDamperEffectSupported;  
    bool isInertiaEffectSupported;  
} GameInputForceFeedbackMotorInfo  
```
  
### Members  
  
*supportedAxes*  
Type: [GameInputFeedbackAxes](../enums/gameinputfeedbackaxes.md)  
  
Supported axes that the force-feedback motor can apply force.  
  
*location*  
Type: [GameInputLocation](../enums/gameinputlocation.md)  
  
Location of the force-feedback motor.  
  
*locationId*  
Type: uint32_t  
  
ID indicating the location of the force-feedback motor.  
  
*maxSimultaneousEffects*  
Type: uint32_t  
  
Maximum number of simultaneous effects supported by a force-feedback motor.  
  
*isConstantEffectSupported*  
Type: bool  
  
Denotes whether a constant force-feedback effect is supported.  
  
*isRampEffectSupported*  
Type: bool  
  
Denotes whether a ramp force-feedback effect is supported.  
  
*isSineWaveEffectSupported*  
Type: bool  
  
Denotes whether a sine wave force-feedback effect is supported.  
  
*isSquareWaveEffectSupported*  
Type: bool  
  
Denotes whether a square wave force-feedback effect is supported.  
  
*isTriangleWaveEffectSupported*  
Type: bool  
  
Denotes whether a triangle wave force feedback-effect is supported.  
  
*isSawtoothUpWaveEffectSupported*  
Type: bool  
  
Denotes whether a sawtooth up wave force-feedback effect is supported.  
  
*isSawtoothDownWaveEffectSupported*  
Type: bool  
  
Denotes whether a saw tooth down wave force-feedback effect is supported.  
  
*isSpringEffectSupported*  
Type: bool  
  
Denotes whether a spring force-feedback effect is supported.  
  
*isFrictionEffectSupported*  
Type: bool  
  
Denotes whether a friction force-feedback effect is supported.  
  
*isDamperEffectSupported*  
Type: bool  
  
Denotes whether a damper force feedback-effect is supported.  
  
*isInertiaEffectSupported*  
Type: bool  
  
Denotes whether an inertia force-feedback effect is supported.  
  
## Remarks  

The ``GameInputForceFeedbackMotorInfo`` structure is a member of [GameInputDeviceInfo](gameinputdeviceinfo.md). It defines the information about a force-feedback motor and uses a pointer to the [GameInputFeedbackAxes](../enums/gameinputfeedbackaxes.md) enumeration.

On modern devices, force feedback is typically used on racing wheels with one single-axis motor connected to the steering wheel itself. However, the GameInput API supports devices with any number of force-feedback motors and assigns a unique index number to each motor on a device. The "normal" axis is used for special cases where the applied force is dimensionless, such as a pressure suit for a flight simulator. 
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also 
 
[Advanced GameInput topics](../../../../input/advanced/input-advanced-topics.md)  
[Overview of GameInput](../../../../input/overviews/input-overview.md)   
[GameInputDeviceInfo](gameinputdeviceinfo.md)  
[GameInput](../gameinput_members.md) 
  