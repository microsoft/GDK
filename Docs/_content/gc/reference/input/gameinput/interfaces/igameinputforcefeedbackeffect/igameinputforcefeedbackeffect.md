---
author: M-Stahl
title: IGameInputForceFeedbackEffect (Interface contents)
description: Describes and tracks a force feedback effect on a supporting input device.
kindex: IGameInputForceFeedbackEffect
ms.author: angillie
ms.topic: navigation
edited: 06/05/2019
security: public
---

# IGameInputForceFeedbackEffect  

Describes and tracks a force feedback effect on a supporting input device.

## Syntax  
  
```cpp  
class IGameInputForceFeedbackEffect : public IUnknown  
```  
  
  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [GetDevice](methods/igameinputforcefeedbackeffect_getdevice.md) | Retrieves the device associated with the force feedback effect. |  
| [IGameInputForceFeedbackEffect::GetGain](methods/igameinputforcefeedbackeffect_getgain.md) | Retrieves the gain set on a force feedback effect. |  
| [GetMotorIndex](methods/igameinputforcefeedbackeffect_getmotorindex.md) | Retrieves the motor index associated with the force feedback effect. |  
| [GetParams](methods/igameinputforcefeedbackeffect_getparams.md) | Retrieves the parameters that define the force feedback effect. |  
| [IGameInputForceFeedbackEffect::GetState](methods/igameinputforcefeedbackeffect_getstate.md) | Retrieves the current state for a force feedback effect. |  
| [IGameInputForceFeedbackEffect::SetGain](methods/igameinputforcefeedbackeffect_setgain.md) | Sets the gain on a force feedback effect. |  
| [IGameInputForceFeedbackEffect::SetParams](methods/igameinputforcefeedbackeffect_setparams.md) | Sets new parameters on a force feedback effect. |  
| [IGameInputForceFeedbackEffect::SetState](methods/igameinputforcefeedbackeffect_setstate.md) | Sets the state for a force feedback effect. |  
  

  
## Remarks  
  
If the tracked device is disconnected before the feedback effect finishes it's lifetime the feedback effect is orphaned and will always report its state as "stopped" until the resources are released.  
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../input/overviews/input-overview.md)  
[GameInput](../../gameinput_members.md)