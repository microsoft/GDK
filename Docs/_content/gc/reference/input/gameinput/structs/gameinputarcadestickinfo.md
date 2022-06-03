---
author: M-Stahl
title: GameInputArcadeStickInfo
description: Describes the properties of an arcade stick.
kindex: GameInputArcadeStickInfo
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputArcadeStickInfo  

Describes the properties of an arcade stick.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputArcadeStickInfo {  
    GameInputLabel menuButtonLabel;  
    GameInputLabel viewButtonLabel;  
    GameInputLabel stickUpLabel;  
    GameInputLabel stickDownLabel;  
    GameInputLabel stickLeftLabel;  
    GameInputLabel stickRightLabel;  
    GameInputLabel actionButton1Label;  
    GameInputLabel actionButton2Label;  
    GameInputLabel actionButton3Label;  
    GameInputLabel actionButton4Label;  
    GameInputLabel actionButton5Label;  
    GameInputLabel actionButton6Label;  
    GameInputLabel specialButton1Label;  
    GameInputLabel specialButton2Label;  
} GameInputArcadeStickInfo  
```
  
<a id="membersSection"></a>

### Members  
  
*menuButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for Menu button.  
  
*viewButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for View button.  
  
*stickUpLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for up input from stick.  
  
*stickDownLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for down input from stick.  
  
*stickLeftLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for left input from stick.  
  
*stickRightLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for right input from stick.  
  
*actionButton1Label*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for action button 1.  
  
*actionButton2Label*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for action button 2.  
  
*actionButton3Label*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for action button 3.  
  
*actionButton4Label*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for action button 4.  
  
*actionButton5Label*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for action button 5.  
  
*actionButton6Label*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for action button 6.  
  
*specialButton1Label*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for special button 1.  
  
*specialButton2Label*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for special button 2.  
  
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
  