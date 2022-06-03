---
author: M-Stahl
title: IGameInputForceFeedbackEffect::SetState
description: Sets the state for a force feedback effect.
kindex: IGameInputForceFeedbackEffect::SetState
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
security: public
---

# IGameInputForceFeedbackEffect::SetState  

Sets the state for a force-feedback effect.  

## Syntax  
  
```cpp
void SetState(  
         GameInputFeedbackEffectState state  
)  
```  
  
### Parameters  
  
*state* &nbsp;&nbsp;\_In\_  
Type: [GameInputFeedbackEffectState](../../../enums/gameinputfeedbackeffectstate.md)  
  
The new state set for a force feedback effect.  
  
  
### Return value 

Type: void
  
No return.  
  
## Remarks  
  
The ``IGameInputForceFeedbackEffect::SetState`` method sets the state for a force feedback effect. The set state of the force feedback effect may be running, stopped, or paused. For more information, see [Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md).  
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Overview of GameInput](../../../../../../input/overviews/input-overview.md)   
[IGameInputForceFeedbackEffect::GetState](igameinputforcefeedbackeffect_getstate.md)  
[GameInputFeedbackEffectState](../../../enums/gameinputfeedbackeffectstate.md)  
[IGameInputForceFeedbackEffect](../igameinputforcefeedbackeffect.md)   