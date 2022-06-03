---
author: M-Stahl
title: XINPUT_VIBRATION
description: Describes motor speeds for the vibration capability of an Xbox 360 controller.
kindex: XINPUT_VIBRATION
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# XINPUT_VIBRATION  

Describes motor speeds for the vibration capability of an Xbox 360 controller.  

<a id="syntaxSection"></a> 

## Syntax  
  
```cpp
typedef struct XINPUT_VIBRATION {  
    WORD wLeftMotorSpeed;  
    WORD wRightMotorSpeed;  
} XINPUT_VIBRATION  
```
  
<a id="membersSection"></a>

### Members  
  
*wLeftMotorSpeed*  
Type: WORD  
  
Speed of the left motor. Valid values range from 0 through 65535. Zero signifies that the motor is not used at all, and 65535 signifies that the motor is used at 100 percent.  
  
*wRightMotorSpeed*  
Type: WORD  
  
Speed of the right motor. Valid values range from 0 through 65535. Zero signifies that the motor is not used at all, and 65535 signifies that the motor is used at 100 percent.  
  
<a id="remarksSection"></a> 

## Remarks  

The left motor is the low-frequency rumble motor. The right motor is the high-frequency rumble motor. The two motors are not the same, and they create different vibration effects. 

This structure is used by the [XInputSetState](../functions/xinputsetstate.md) function. 

For more information, see [The XInputOnGameInput wrapper](../../../../input/porting/input-porting-xinput.md#xinputWrapperSection). 

<a id="requirementsSection"></a> 

## Requirements  
  
**Header:** XInputOnGameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a> 

## See also  

[XInputSetStateEx](../functions/xinputsetstateex.md)  
[Porting from XInput to GameInput](../../../../input/porting/input-porting-xinput.md)  
[XInputOnGameInput](../xinputongameinput_members.md)  
  