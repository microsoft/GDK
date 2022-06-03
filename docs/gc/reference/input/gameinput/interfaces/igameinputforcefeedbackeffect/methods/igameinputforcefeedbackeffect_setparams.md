---
author: M-Stahl
title: IGameInputForceFeedbackEffect::SetParams
description: Sets new parameters on a force feedback effect.
kindex: IGameInputForceFeedbackEffect::SetParams
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
security: public
---

# IGameInputForceFeedbackEffect::SetParams  

Sets new parameters on a force-feedback effect.  

## Syntax  
  
```cpp
bool SetParams(  
         const GameInputForceFeedbackParams* params  
)  
```  
  
### Parameters  
  
*params* &nbsp;&nbsp;\_In\_  
Type: [GameInputForceFeedbackParams*](../../../structs/gameinputforcefeedbackparams.md)  
  
The new force-feedback parameters to be set.  
  
  
### Return value  

Type: bool
  
The results of setting the new parameters. If the function succeeds, it returns true.  
  
## Remarks  
  
When setting new parameters for a force feedback effect, the motor will attempt to continue the effect uninterrupted. You may only set new parameters on a force feedback effect if the new parameters and the old parameters share the same [GameInputForceFeedbackEffectKind](../../../enums/gameinputforcefeedbackeffectkind.md) enumeration. For more information, see [Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md).  
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[GameInputForceFeedbackParams](../../../structs/gameinputforcefeedbackparams.md)  
[IGameInputForceFeedbackEffect](../igameinputforcefeedbackeffect.md) 