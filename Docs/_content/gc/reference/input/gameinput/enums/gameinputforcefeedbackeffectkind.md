---
author: M-Stahl
title: GameInputForceFeedbackEffectKind
description: numeration of the types of magnitude over time effects that can be applied to a force feedback effect.
kindex: GameInputForceFeedbackEffectKind
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# GameInputForceFeedbackEffectKind  

Enumeration of the types of magnitude over time effects that can be applied to a force feedback effect.  

## Syntax  
  
```cpp
typedef enum GameInputForceFeedbackEffectKind  
{  
    GameInputForceFeedbackConstant = 0,  
    GameInputForceFeedbackRamp = 1,  
    GameInputForceFeedbackSineWave = 2,  
    GameInputForceFeedbackSquareWave = 3,  
    GameInputForceFeedbackTriangleWave = 4,  
    GameInputForceFeedbackSawtoothUpWave = 5,  
    GameInputForceFeedbackSawtoothDownWave = 6,  
    GameInputForceFeedbackSpring = 7,  
    GameInputForceFeedbackFriction = 8,  
    GameInputForceFeedbackDamper = 9,  
    GameInputForceFeedbackInertia = 10  
} GameInputForceFeedbackEffectKind  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputForceFeedbackConstant | Represents a constant force feedback. |  
| GameInputForceFeedbackRamp | Represents a ramping feedback effect. |  
| GameInputForceFeedbackSineWave | Represents a sine wave force feedback effect |  
| GameInputForceFeedbackSquareWave | Represents a square wave force feedback effect |  
| GameInputForceFeedbackTriangleWave | Represents a triangle wave force feedback effect |  
| GameInputForceFeedbackSawtoothUpWave | Represents an upward sawtooth wave force feedback effect |  
| GameInputForceFeedbackSawtoothDownWave | Represents a downward sawtooth wave force feedback effect |  
| GameInputForceFeedbackSpring | Represents a spring like force feedback effect |  
| GameInputForceFeedbackFriction | Represents a friction force feedback effect |  
| GameInputForceFeedbackDamper | Represents a damper force feedback effect |  
| GameInputForceFeedbackInertia | Represents an Intertia force feedback effect |  
  
## Remarks  
  
Not all FeedbackEffectKinds are supported by every device. Using an unsupported feedback kind on an unsupported device will cause a return error when calling CreateForceFeedbackEffect.  
Member of [GameInputForceFeedbackParams](../structs/gameinputforcefeedbackparams.md).  
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
[GameInputForceFeedbackParams](../structs/gameinputforcefeedbackparams.md)