---
author: M-Stahl
title: IGameInputForceFeedbackEffect::GetGain
description: Retrieves the gain set on a force feedback effect.
kindex: IGameInputForceFeedbackEffect::GetGain
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
security: public
---

# IGameInputForceFeedbackEffect::GetGain  

Retrieves the gain set on a force feedback effect.  

## Syntax  
  
```cpp
float GetGain(  
)  
```  
  
### Parameters  

This method has no parameters.  
  
### Return value 
 
Type: float
  
The gain set on a force-feedback motor device.  
  
## Remarks  
  
The ``IGameInputForceFeedbackEffect::GetGain`` method retrieves the gain on a force feedback motor. The gain can have a value between 0.0 and 1.0. For more information, see [Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md). 
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
 
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInputForceFeedbackEffect::SetGain](igameinputforcefeedbackeffect_setgain.md)    
[IGameInputDevice::SetForceFeedbackMotorGain](../../igameinputdevice/methods/igameinputdevice_setforcefeedbackmotorgain.md)    
[IGameInputForceFeedbackEffect](../igameinputforcefeedbackeffect.md)    
  