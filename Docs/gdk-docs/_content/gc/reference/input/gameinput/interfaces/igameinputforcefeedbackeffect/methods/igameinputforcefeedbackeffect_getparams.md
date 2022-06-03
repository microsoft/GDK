---
author: M-Stahl
title: GetParams
description: Retrieves the parameters that define the force feedback effect.
kindex: GetParams
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
security: public
---

# IGameInputForceFeedbackEffect::GetParams  

Retrieves the parameters that define the force feedback effect.  

## Syntax  
  
```cpp
void GetParams(  
         GameInputForceFeedbackParams* params  
)  
```  
  
### Parameters  
  
*params* &nbsp;&nbsp;\_Out\_  
Type: [GameInputForceFeedbackParams*](../../../structs/gameinputforcefeedbackparams.md)  

  
The parameters that define the force feedback effect.  

  
### Return value 

Type: void
 
No return. 
  
## Remarks  
  

Every ``IGameInputForceFeedbackEffect`` instance retrieves a common set of information about the effect. The assigned parameters for the effect is done with the ``GetParams`` method. For more information, see [Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md).  
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
 
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInputForceFeedbackEffect](../igameinputforcefeedbackeffect.md)  
  
  