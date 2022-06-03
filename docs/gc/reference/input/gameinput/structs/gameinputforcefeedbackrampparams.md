---
author: M-Stahl
title: GameInputForceFeedbackRampParams
description: Defines the parameters for a ramp force-feedback effect.
kindex: GameInputForceFeedbackRampParams
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputForceFeedbackRampParams  

Defines the parameters for a ramp force-feedback effect.  

## Syntax  
  
```cpp
typedef struct GameInputForceFeedbackRampParams {  
    GameInputForceFeedbackEnvelope envelope;  
    GameInputForceFeedbackMagnitude startMagnitude;  
    GameInputForceFeedbackMagnitude endMagnitude;  
} GameInputForceFeedbackRampParams  
```
  
### Members  
  
*envelope*  
Type: [GameInputForceFeedbackEnvelope](gameinputforcefeedbackenvelope.md)  
  
The envelope that modifies a force-feedback effect.  
  
*startMagnitude*  
Type: [GameInputForceFeedbackMagnitude](gameinputforcefeedbackmagnitude.md)  
  
The starting magnitude of the force-feedback effect.  
  
*endMagnitude*  
Type: [GameInputForceFeedbackMagnitude](gameinputforcefeedbackmagnitude.md)  
  
The ending magnitude of the force-feedback effect.  
  
## Remarks

The ``GameInputForceFeedbackRampParams`` structure is a member of  [GameInputForceFeedbackParams](gameinputforcefeedbackparams.md). Forced-feedback effects are defined by their parameters. These effects are stored in the ``GameInputForceFeedbackParams`` structure. The actual parameters for each type of force feedback effect vary slightly. The parameters for all kinds of effects define the magnitude of the effect along the motor’s supported axes, and most allow for an envelope that affects the strength of the effect over time.  
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Advanced GameInput topics](../../../../input/advanced/input-advanced-topics.md)  
[Overview of GameInput](../../../../input/overviews/input-overview.md)    
[GameInputForceFeedbackParams](gameinputforcefeedbackparams.md)  
[GameInput](../gameinput_members.md)