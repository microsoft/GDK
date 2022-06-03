---
author: M-Stahl
title: GameInputForceFeedbackConditionParams
description: Defines some physical aspect of a force-feedback effect.
kindex: GameInputForceFeedbackConditionParams
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
security: public
---

# GameInputForceFeedbackConditionParams  

Defines some physical aspect of a force-feedback effect.  

## Syntax  
  
```cpp
typedef struct GameInputForceFeedbackConditionParams {  
    GameInputForceFeedbackMagnitude magnitude;  
    float positiveCoefficient;  
    float negativeCoefficient;  
    float maxPositiveMagnitude;  
    float maxNegativeMagnitude;  
    float deadZone;  
    float bias;  
} GameInputForceFeedbackConditionParams  
```
  
### Members  
  
*magnitude*  
Type: [GameInputForceFeedbackMagnitude](gameinputforcefeedbackmagnitude.md)  
  
Magnitude of the force-feedback effect.  
  
*positiveCoefficient*  
Type: float  
  
Positive multiplier on the force-feedback effect.  
  
*negativeCoefficient*  
Type: float  
  
Negative multiplier on the force-feedback effect.  
  
*maxPositiveMagnitude*  
Type: float  
  
The maximum amount of force the effect can produce in a positive direction.  
  
*maxNegativeMagnitude*  
Type: float  
  
The maximum amount of force the effect can produce in a negative direction.
  
*deadZone*  
Type: float  
  
The area the force-feedback effects do not respond.
  
*bias*  
Type: float  
  
The offset applied to the force-feedback effect.  
  
## Remarks  

``GameInputForceFeedbackConditionParams`` is a member of the [GameInputForceFeedbackParams](gameinputforcefeedbackparams.md) structure. 

The ``CreateForceFeedbackEffect`` method allocates hardware resources in the motor for a new force-feedback effect with a specified set of parameters. It returns an ``IGameInputForceFeedbackEffect`` instance to track these resources. A ``HRESULT`` error is returned if there are insufficient hardware resources to create the effect or if the requested effect is not supported by the hardware. Force-feedback effects are defined by their parameters and are stored in the ``GameInputForceFeedbackParams`` structure.
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Advanced GameInput topics](../../../../input/advanced/input-advanced-topics.md)   
[Overview of GameInput](../../../../input/overviews/input-overview.md)      
[GameInput](../gameinput_members.md)
  