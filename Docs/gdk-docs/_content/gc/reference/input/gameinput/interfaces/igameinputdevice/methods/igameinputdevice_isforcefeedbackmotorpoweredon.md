---
author: M-Stahl
title: IsForceFeedbackMotorPoweredOn
description: Indicates whether a specific force feedback motor is powered on.
kindex: IsForceFeedbackMotorPoweredOn
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
security: public
---

# IsForceFeedbackMotorPoweredOn  

Indicates whether a specific force feedback motor is powered on.  

## Syntax  
  
```cpp
bool IsForceFeedbackMotorPoweredOn(  
         uint32_t motorIndex  
)  
```  
  
### Parameters  
  
*motorIndex* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

  
Force feedback motor index.  

  
### Return value  
Type: bool

Returns false if the fore feedback motor is not powered on. Returns true if the force feedback motor is powered on.
    
  
## Remarks  

Force feedback motors require an external power source because a USB connection cannot provide sufficient current to drive the motor. A motor’s power state is therefore not something that is under the control of software. However, it can be reported so that an application can notify the user.  

There is no change in behavior of any *GameInput* force feedback methods when a motor has no power; thus, no effects will be played by the device. Essentially, the APIs function as though the process does not have input focus. If the effects are loaded into a force feedback motor without power, and power is later supplied to the motor. The effects will start playing as if the process gained input focus. Like the behavior for input focus, this is done to simplify the programming model.  
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[GameInput](../../../gameinput_members.md)  
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInputDevice](../igameinputdevice.md)  
  
  