---
author: M-Stahl
title: GameInputFeedbackEffectState
description: Enumerates states of a force feedback effect.
kindex: GameInputFeedbackEffectState
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputFeedbackEffectState  

Enumerates states of a force feedback effect.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputFeedbackEffectState    
{  
    GameInputFeedbackStopped = 0,  
    GameInputFeedbackRunning = 1,  
    GameInputFeedbackPaused = 2  
} GameInputFeedbackEffectState  
```  
  
<a id="constantsSection"></a>

## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputFeedbackStopped | Stopped. |  
| GameInputFeedbackRunning | Running. |  
| GameInputFeedbackPaused | Paused. |  
  
<a id="remarksSection"></a>

## Remarks  

This enumeration is used by the [IGameInputForceFeedbackEffect::SetState](../interfaces/igameinputforcefeedbackeffect/methods/igameinputforcefeedbackeffect_setstate.md) and [IGameInputForceFeedbackEffect::GetState](../interfaces/igameinputforcefeedbackeffect/methods/igameinputforcefeedbackeffect_getstate.md) methods. If a device is disconnected, `GetState` always returns `GameInputFeedbackStopped`. 

For more information, see the "Applying and updating force feedback effects" section of [Force feedback on GameInput](../../../../input/advanced/input-forcefeedback.md). 
    
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  