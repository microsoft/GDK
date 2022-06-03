---
author: M-Stahl
title: SetForceFeedbackMotorGain
description: Applies a global attenuation factor to all loaded effects on a motor.
kindex: SetForceFeedbackMotorGain
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
security: public
---

# IGameInputDevice::SetForceFeedbackMotorGain  

Applies a global attenuation factor to all loaded effects on a motor.  

## Syntax  
  
```cpp
void SetForceFeedbackMotorGain(  
         uint32_t motorIndex,  
         float masterGain  
)  
```  
  
### Parameters  
  
*motorIndex* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
Index of the motor to be changed.    
  
*masterGain* &nbsp;&nbsp;\_In\_  
Type: float  
  
Global attenuation factor to all loaded effects on the motor between 0.0 and 0.1. 
    
### Return value   

None.
  
## Remarks  

This method applies a global attenuation factor to all loaded effects on the motor. The ``masterGain`` pointer accepts values between 0.0 and 0.1. This is used by the application’s forced feedback strength settings. For more information, see [Overview of GameInput](../../../../../../input/overviews/input-overview.md).

## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[GameInput](../../../gameinput_members.md)  
[IGameInputDevice](../igameinputdevice.md)

  
  