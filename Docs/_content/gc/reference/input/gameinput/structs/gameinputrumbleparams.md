---
author: M-Stahl
title: GameInputRumbleParams
description: Describes a rumble effect produced by a standard controller.
kindex: GameInputRumbleParams
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputRumbleParams  

Describes a rumble effect produced by a standard controller.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputRumbleParams {  
    float lowFrequency;  
    float highFrequency;  
    float leftTrigger;  
    float rightTrigger;  
} GameInputRumbleParams  
```
  
<a id="membersSection"></a>

### Members  
  
*lowFrequency*  
Type: float  
  
Intensity of the low-frequency rumble motor as a normalized value in the range of [0.0, 1.0].  
  
*highFrequency*  
Type: float  
  
Intensity of the high-frequency rumble motor as a normalized value in the range of [0.0, 1.0].  
  
*leftTrigger*  
Type: float  
  
Intensity of the left trigger rumble motor as a normalized value in the range of [0.0, 1.0].  
  
*rightTrigger*  
Type: float  
  
Intensity of the right trigger rumble motor as a normalized value in the range of [0.0, 1.0].  
  
<a id="remarksSection"></a>

## Remarks  

This structure is used by the [SetRumbleState](../interfaces/igameinputdevice/methods/igameinputdevice_setrumblestate.md) method. The structure is modeled on the rumble motors present in an Xbox controller, which has four motors. However, the structure is also usable on controllers that don't have all four motors, such as controllers used for PC gaming. 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  