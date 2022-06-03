---
author: M-Stahl
title: IGameInputForceFeedbackEffect::GetState
description: Retrieves the current state for a force feedback effect.
kindex: IGameInputForceFeedbackEffect::GetState
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
security: public
---

# IGameInputForceFeedbackEffect::GetState  

Retrieves the current state for a force feedback effect.  

## Syntax  
  
```cpp
GameInputFeedbackEffectState GetState(  
)  
```  
  
### Parameters
  
This method has no parameters.

### Return value  

Type: [GameInputFeedbackEffectState](../../../enums/gameinputfeedbackeffectstate.md)
  
The state of the force feedback effect.  
  
## Remarks  
  
The ``GetState`` method retrieves the current state of a force feedback effect. The current state may be running, stopped, or paused. For more information, see [Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md).  
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Overview of GameInput](../../../../../../input/overviews/input-overview.md)     
[IGameInputForceFeedbackEffect::SetState](igameinputforcefeedbackeffect_setstate.md)    
[IGameInputForceFeedbackEffect](../igameinputforcefeedbackeffect.md)  

  
  