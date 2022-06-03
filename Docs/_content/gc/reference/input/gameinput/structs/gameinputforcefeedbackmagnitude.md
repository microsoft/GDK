---
author: M-Stahl
title: GameInputForceFeedbackMagnitude
description: Defines the magnitude of the force exhibited by a force-feedback effect.
kindex: GameInputForceFeedbackMagnitude
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# GameInputForceFeedbackMagnitude  

Defines the magnitude of the force exhibited by a force-feedback effect.  

## Syntax  
  
```cpp
typedef struct GameInputForceFeedbackMagnitude {  
    float linearX;  
    float linearY;  
    float linearZ;  
    float angularX;  
    float angularY;  
    float angularZ;  
    float normal;  
} GameInputForceFeedbackMagnitude  
```
  
### Members  
  
*linearX*  
Type: float  
  
Magnitude of the force-feedback effect in the linear-X direction.  
  
*linearY*  
Type: float  
  
Magnitude of the force-feedback effect in the linear-Y direction.  
  
*linearZ*  
Type: float  
  
Magnitude of the force-feedback effect in the linear-Z direction.  
  
*angularX*  
Type: float  
  
Magnitude of the force-feedback effect in the angular-X direction.  
  
*angularY*  
Type: float  
  
Magnitude of the force-feedback effect in the angular-Y direction.  
  
*angularZ*  
Type: float  
  
Magnitude of the force-feedback effect in the angular-Z direction.  
  
*normal*  
Type: float  
  
Magnitude for the force-feedback effect of a directionless force-feedback effect.  
  
## Remarks  

``GameInputForceFeedbackMagnitude`` defines the magnitude of force exhibited by a force-feedback effect. It is a member of the ``GameInputForceFeedbackConditionParams``, ``GameInputForceFeedbackConstantParams``, ``GameInputForceFeedbackPeriodicParams``, and  
``GameInputForceFeedbackRampParams`` structures. For more information, see [Advanced GameInput topics](../../../../input/advanced/input-advanced-topics.md).
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInputForceFeedbackConditionParams](gameinputforcefeedbackconditionparams.md)  
[GameInputForceFeedbackConstantParams](gameinputforcefeedbackconstantparams.md)    
[GameInputForceFeedbackPeriodicParams](gameinputforcefeedbackperiodicparams.md)    
[GameInputForceFeedbackRampParams](gameinputforcefeedbackrampparams.md)  
[GameInput](../gameinput_members.md) 