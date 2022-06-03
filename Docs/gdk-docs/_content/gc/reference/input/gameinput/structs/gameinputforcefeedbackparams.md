---
author: M-Stahl
title: GameInputForceFeedbackParams
description: Defines the API-supported attributes of a force-feedback effect.
kindex: GameInputForceFeedbackParams
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputForceFeedbackParams  

Defines the API-supported attributes of a force-feedback effect.  

## Syntax  
  
```cpp
typedef struct GameInputForceFeedbackParams {  
    GameInputForceFeedbackEffectKind kind;  
    union  
    {  
        GameInputForceFeedbackConstantParams constant;  
        GameInputForceFeedbackRampParams ramp;  
        GameInputForceFeedbackPeriodicParams sineWave;  
        GameInputForceFeedbackPeriodicParams squareWave;  
        GameInputForceFeedbackPeriodicParams triangleWave;  
        GameInputForceFeedbackPeriodicParams sawtoothUpWave;  
        GameInputForceFeedbackPeriodicParams sawtoothDownWave;  
        GameInputForceFeedbackConditionParams spring;  
        GameInputForceFeedbackConditionParams friction;  
        GameInputForceFeedbackConditionParams damper;  
        GameInputForceFeedbackConditionParams inertia;  
    };  
} GameInputForceFeedbackParams  
```
  
### Members  
  
*kind*  
Type: [GameInputForceFeedbackEffectKind](../enums/gameinputforcefeedbackeffectkind.md)  
  
Defines the kind of a force-feedback effect.  
  
*constant*  
Type: [GameInputForceFeedbackConstantParams](gameinputforcefeedbackconstantparams.md)  
  
Constant force-feedback effect. Force is applied at a constant level for the duration of the effect.  
  
*ramp*  
Type: [GameInputForceFeedbackRampParams](gameinputforcefeedbackrampparams.md)  
  
Ramp force-feedback effect. Force is applied gradually by being increased or decreased over the duration of the effect.  
  
*sineWave*  
Type: [GameInputForceFeedbackPeriodicParams](gameinputforcefeedbackperiodicparams.md)  
  
Sine-wave force-feedback effect. Force is applied in a sine-wave pattern.  
  
*squareWave*  
Type: [GameInputForceFeedbackPeriodicParams](gameinputforcefeedbackperiodicparams.md)  
  
Square-wave force-feedback effect. Force is applied in a square-wave pattern.  
  
*triangleWave*  
Type: [GameInputForceFeedbackPeriodicParams](gameinputforcefeedbackperiodicparams.md)  
  
Triangle-wave force-feedback effect. Force is applied in a triangle-wave pattern.  
  
*sawtoothUpWave*  
Type: [GameInputForceFeedbackPeriodicParams](gameinputforcefeedbackperiodicparams.md)  
  
Upward-sawtooth-wave force-feedback effect. Force is applied in an upward-sawtooth-wave pattern.  
  
*sawtoothDownWave*  
Type: [GameInputForceFeedbackPeriodicParams](gameinputforcefeedbackperiodicparams.md)  
  
Downward-sawtooth-wave force-feedback effect. Force is applied in a downward-sawtooth-wave pattern.  
  
*spring*  
Type: [GameInputForceFeedbackConditionParams](gameinputforcefeedbackconditionparams.md)  
  
Spring force-feedback effect. Force is applied in opposition to a set state.  
  
*friction*  
Type: [GameInputForceFeedbackConditionParams](gameinputforcefeedbackconditionparams.md)  
  
Friction force-feedback effect. Force is applied to mimic friction.  
  
*damper*  
Type: [GameInputForceFeedbackConditionParams](gameinputforcefeedbackconditionparams.md)  
  
Damper force-feedback effect. Force is applied to mimic a damper effect.  
  
*inertia*  
Type: [GameInputForceFeedbackConditionParams](gameinputforcefeedbackconditionparams.md)  
  
Inertia force-feedback effect. Force is applied to mimic an inertia effect.  
  
## Remarks  

Forced-feedback effects are defined by their parameters. These effects are stored in the ``GameInputForceFeedbackParams`` structure. The actual parameters for each type of force-feedback effect vary slightly. The parameters for all kinds of effects define the magnitude of the effect along the motor’s supported axes, and most allow for an envelope that affects the strength of the effect over time.
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Advanced GameInput topics](../../../../input/advanced/input-advanced-topics.md)  
[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInputForceFeedbackEffectKind](../enums/gameinputforcefeedbackeffectkind.md)    
[GameInput](../gameinput_members.md)  
  
  