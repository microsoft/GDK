---
author: M-Stahl
title: GetDevice
description: Retrieves the device associated with the force feedback effect.
kindex: GetDevice
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
security: public
---

# IGameInputForceFeedbackEffect::GetDevice  

Retrieves the device associated with the force feedback effect.  

## Syntax  
  
```cpp
void GetDevice(  
         IGameInputDevice** device  
)  
```  
  
### Parameters  
  
*device* &nbsp;&nbsp;\_Outptr\_  
Type: IGameInputDevice**  

Sets the device output device parameter to ``nullptr``. This method returns the device associated with the force feedback effect.  
  
### Return value  

Type: void

No return. 
  
## Remarks  

The ``IGameInputForceFeedbackEffect::GetDevice`` method retrieves the device associated with the force feedback effect. The [IGameInputDevice](../../igameinputdevice/igameinputdevice.md) object represents an input device. The methods in the ``IGameInputDevice`` interface allow you to identify and interact with a game input device. You can query information about the device such as its type, abilities, and battery state. You can also activate device specific hardware like haptic and force feedback. For more information, see [Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md).
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
 
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInputForceFeedbackEffect](../igameinputforcefeedbackeffect.md)  
  
  