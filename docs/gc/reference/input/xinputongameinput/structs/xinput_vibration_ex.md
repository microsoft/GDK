---
author: M-Stahl
title: XINPUT_VIBRATION_EX
description: Describes motor speeds for the vibration capability of an Xbox One controller.
kindex: XINPUT_VIBRATION_EX
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# XINPUT_VIBRATION_EX  

Describes motor speeds for the vibration capability of an Xbox One controller.  

<a id="syntaxSection"></a> 

## Syntax  
  
```cpp
typedef struct XINPUT_VIBRATION_EX {  
    WORD wLeftMotorSpeed;  
    WORD wRightMotorSpeed;  
    WORD wLeftTriggerSpeed;  
    WORD wRightTriggerSpeed;  
} XINPUT_VIBRATION_EX  
```
  
<a id="membersSection"></a>

### Members  
  
*wLeftMotorSpeed*  
Type: WORD  
  
Speed of the left motor. Valid values range from 0 through 65535. Zero signifies that the motor is not used at all, and 65535 signifies that the motor is used at 100 percent.  
  
*wRightMotorSpeed*  
Type: WORD  
  
Speed of the right motor. Valid values range from 0 through 65535. Zero signifies that the motor is not used at all, and 65535 signifies that the motor is used at 100 percent.  
  
*wLeftTriggerSpeed*  
Type: WORD  
  
Speed of the left trigger motor. Valid values range from 0 through 65535. Zero signifies that the motor is not used at all, and 65535 signifies that the motor is used at 100 percent.  
  
*wRightTriggerSpeed*  
Type: WORD  
  
Speed of the right trigger motor. Valid values range from 0 through 65535. Zero signifies that the motor is not used at all, and 65535 signifies that the motor is used at 100 percent.  
  
<a id="remarksSection"></a> 

## Remarks  

The left motor is the low-frequency rumble motor. The right motor is the high-frequency rumble motor. The two motors are not the same, and they create different vibration effects. 

The two trigger motors provide haptic feedback through the triggers. 

This structure is used by the [XInputSetStateEx](../functions/xinputsetstateex.md) function. 

For more information, see [The XInputOnGameInput wrapper](../../../../input/porting/input-porting-xinput.md#xinputWrapperSection). 
  
<a id="requirementsSection"></a> 

## Requirements  
  
**Header:** XInputOnGameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a> 

## See also  

[XInputSetState](../functions/xinputsetstate.md)  
[Porting from XInput to GameInput](../../../../input/porting/input-porting-xinput.md)  
[XInputOnGameInput](../xinputongameinput_members.md)  
  