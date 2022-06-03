---
author: M-Stahl
title: GameInputGamepadInfo
description: Describes the properties of a gamepad.
kindex: GameInputGamepadInfo
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputGamepadInfo  

Describes the properties of a gamepad. 

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputGamepadInfo {  
    GameInputLabel menuButtonLabel;  
    GameInputLabel viewButtonLabel;  
    GameInputLabel aButtonLabel;  
    GameInputLabel bButtonLabel;  
    GameInputLabel xButtonLabel;  
    GameInputLabel yButtonLabel;  
    GameInputLabel dpadUpLabel;  
    GameInputLabel dpadDownLabel;  
    GameInputLabel dpadLeftLabel;  
    GameInputLabel dpadRightLabel;  
    GameInputLabel leftShoulderButtonLabel;  
    GameInputLabel rightShoulderButtonLabel;  
    GameInputLabel leftThumbstickButtonLabel;  
    GameInputLabel rightThumbstickButtonLabel;  
} GameInputGamepadInfo  
```
  
<a id="membersSection"></a>

### Members  

*menuButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for Menu button.  
  
*viewButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for View button.  
  
*aButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for **A** button.  
  
*bButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for **B** button.  
  
*xButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for **X** button.  
  
*yButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for **Y** button.  
  
*dpadUpLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for D-pad up.  
  
*dpadDownLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for D-pad down.  
  
*dpadLeftLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for D-pad left.  
  
*dpadRightLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for D-Pad right.  
  
*leftShoulderButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for left shoulder button.  
  
*rightShoulderButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for right shoulder button.  
  
*leftThumbstickButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for left thumbstick.  
  
*rightThumbstickButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for right thumbstick.  
  
<a id="remarksSection"></a>

## Remarks  

This structure is used in the [GameInputDeviceInfo](gameinputdeviceinfo.md) structure. `GameInputDeviceInfo` is used by the [IGameInputDevice::GetDeviceInfo](../interfaces/igameinputdevice/methods/igameinputdevice_getdeviceinfo.md) method.  

For more information, see [GameInput devices](../../../../input/overviews/input-devices.md). 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  