---
author: M-Stahl
title: GameInputForceFeedbackConstantParams
description: Defines a constant physical aspect of a force-feedback effect.
kindex: GameInputForceFeedbackConstantParams
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
security: public
---

# GameInputForceFeedbackConstantParams  

Defines a constant physical aspect of a force-feedback effect.  

## Syntax  
  
```cpp
typedef struct GameInputForceFeedbackConstantParams {  
    GameInputForceFeedbackEnvelope envelope;  
    GameInputForceFeedbackMagnitude magnitude;  
} GameInputForceFeedbackConstantParams  
```
  
### Members  
  
*envelope*  
Type: [GameInputForceFeedbackEnvelope](gameinputforcefeedbackenvelope.md)  
  
The modifying envelope on a force-feedback effect.  
  
*magnitude*  
Type: [GameInputForceFeedbackMagnitude](gameinputforcefeedbackmagnitude.md)  
  
The amount of force being applied by a force-feedback effect.  
  
## Remarks  

``GameInputForceFeedbackConstantParams`` is a member of the [GameInputForceFeedbackParams](gameinputforcefeedbackparams.md) structure. 

The ``CreateForceFeedbackEffect`` method allocates hardware resources in the motor for a new force feedback-effect with a specified set of parameters and returns an ``IGameInputForceFeedbackEffect`` instance to track those resources.  A ``HRESULT`` error is returned if there are insufficient hardware resources to create the effect or if the requested effect is not supported by the hardware. Force-feedback effects are defined by their parameters and are stored in the ``GameInputForceFeedbackParams`` structure.
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Advanced GameInput topics](../../../../input/advanced/input-advanced-topics.md)   
[Overview of GameInput](../../../../input/overviews/input-overview.md)     
[GameInput](../gameinput_members.md)    
  