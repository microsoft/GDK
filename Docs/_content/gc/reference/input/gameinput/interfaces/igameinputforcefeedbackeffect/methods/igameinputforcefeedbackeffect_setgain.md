---
author: M-Stahl
title: IGameInputForceFeedbackEffect::SetGain
description: Sets the gain on a force feedback effect.
kindex: IGameInputForceFeedbackEffect::SetGain
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
security: public
---

# IGameInputForceFeedbackEffect::SetGain  

Sets the gain on a force-feedback effect.  

## Syntax  
  
```cpp
void SetGain(  
         float gain  
)  
```  
  
### Parameters  
  
*gain* &nbsp;&nbsp;\_In\_  
Type: float  
  
The new gain applied to a force feedback effect.  
  
  
### Return value  

Type: void
  
No return.  
  
## Remarks  
  
The gain on a force feedback motor can have a value between 0.0 and 1.0.  

Two types of gain can affect the intensity of the force feedback effect. There is the gain that is set on a  motor by [IGameInputDevice::SetForceFeedbackMotorGain](../../igameinputdevice/methods/igameinputdevice_setforcefeedbackmotorgain.md) and the gain on the effect itself set by this function.  

The effect of the two gains is multiplied. If the effect gain is set to 0.5 and the master gain of the motor is set to 0.5, then the effect will be played at 0.25 intensity. For more information, see [Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md).  
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Overview of GameInput](../../../../../../input/overviews/input-overview.md)   
[IGameInputForceFeedbackEffect::GetGain](igameinputforcefeedbackeffect_getgain.md)  
[IGameInputDevice::SetForceFeedbackMotorGain](../../igameinputdevice/methods/igameinputdevice_setforcefeedbackmotorgain.md)  
[IGameInputForceFeedbackEffect](../igameinputforcefeedbackeffect.md) 
  
  