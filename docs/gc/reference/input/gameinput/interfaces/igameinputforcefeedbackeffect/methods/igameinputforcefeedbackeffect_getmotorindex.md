---
author: M-Stahl
title: GetMotorIndex
description: Retrieves the motor index associated with the force feedback effect.
kindex: GetMotorIndex
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
security: public
---

# IGameInputForceFeedbackEffect::GetMotorIndex  

Retrieves the motor index associated with the force feedback effect.  

## Syntax  
  
```cpp
uint32_t GetMotorIndex(  
)  
```  
  
### Parameters  

This method has no parameters.
  
  
### Return value  

Type: uint32_t

Currently returns 0. When this method is implemented, it will return the index of the associated motor.  
  
## Remarks  

Every ``IGameInputForceFeedbackEffect`` instance retrieves a common set of information about the effect. The specific motor where the effect is loaded on the devices is done with the ``GetMotorIndex`` method. For more information, see [Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md).
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
 
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInputForceFeedbackEffect](../igameinputforcefeedbackeffect.md)  
  
  