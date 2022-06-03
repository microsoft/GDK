---
author: M-Stahl
title: SetRumbleState
description: Sets the desired intensities of the four rumble motors on the device.
kindex: SetRumbleState
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# SetRumbleState  

Sets the desired intensities of the four rumble motors on the device.   

## Syntax  
  
```cpp
void SetRumbleState(  
         const GameInputRumbleParams* params,  
         uint64_t timestamp  
)  
```  
  
### Parameters  
  
*params* &nbsp;&nbsp;\_In\_opt\_  
Type: [GameInputRumbleParams*](../../../structs/gameinputrumbleparams.md)  
  
Structure containing the desired intensities for each rumble motor. Rumble motor intensity ranges from 0.0 to 1.0.  

*timestamp* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
Specifies the time at which the new rumble state should be applied. A value of zero (or any value in the past) causes the state to be applied immediately.  
  
### Return value  
Type: void

## Remarks

The ``SetRumbleState`` method sets the desired intensities of the four rumble motors on the device. Like other types of feedback, this can be called by an application at any time, but it will only be applied to the device while the application is in focus.

To keep things as simple as possible, applications are not required to check which rumble motors a device supports and might specify an intensity for all four motors. If the device lacks any of the four motors, the GameInput implementation will attempt to adapt by adding additional intensity to the other motor(s), so that some amount of feedback is still felt by the user. For example, trigger vibration values are emulated on Xbox 360 gamepads by adding a small amount of additional vibration intensity to the high-frequency vibration motor.  

On devices that have been disconnected, or devices with no rumble motors, calling the ``SetRumbleState`` method has no effect. Motor intensity values are in the range of [0.0, 1.0]. Any values supplied outside of this range are clamped to the nearest valid value.  
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

 [Overview of GameInput](../../../../../../input/overviews/input-overview.md)    
 [GameInputRumbleParams](../../../structs/gameinputrumbleparams.md)  
 [IGameInputDevice](../igameinputdevice.md)   
  