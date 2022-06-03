---
author: M-Stahl
title: GameInputUiNavigationInfo
description: Describes the labels of navigation buttons in the UI.
kindex: GameInputUiNavigationInfo
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputUiNavigationInfo  

Describes the labels of navigation buttons in the UI.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputUiNavigationInfo {  
    GameInputLabel menuButtonLabel;  
    GameInputLabel viewButtonLabel;  
    GameInputLabel acceptButtonLabel;  
    GameInputLabel cancelButtonLabel;  
    GameInputLabel upButtonLabel;  
    GameInputLabel downButtonLabel;  
    GameInputLabel leftButtonLabel;  
    GameInputLabel rightButtonLabel;  
    GameInputLabel contextButton1Label;  
    GameInputLabel contextButton2Label;  
    GameInputLabel contextButton3Label;  
    GameInputLabel contextButton4Label;  
    GameInputLabel pageUpButtonLabel;  
    GameInputLabel pageDownButtonLabel;  
    GameInputLabel pageLeftButtonLabel;  
    GameInputLabel pageRightButtonLabel;  
    GameInputLabel scrollUpButtonLabel;  
    GameInputLabel scrollDownButtonLabel;  
    GameInputLabel scrollLeftButtonLabel;  
    GameInputLabel scrollRightButtonLabel;  
    GameInputLabel guideButtonLabel;  
} GameInputUiNavigationInfo  
```
  
<a id="membersSection"></a>

### Members  

*menuButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Label for Menu button.  
  
*viewButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Label for View button.  
  
*acceptButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Label for Accept button.  
  
*cancelButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Label for Cancel button.  
  
*upButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Label for Up button.  
  
*downButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Label for Down button.  
  
*leftButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Label for Left button.  
  
*rightButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Label for Right button.  
  
*contextButton1Label*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Label for context button 1.  
  
*contextButton2Label*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Label for context button 2.  
  
*contextButton3Label*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Label for context button 3.  
  
*contextButton4Label*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Label for context button 4.  
  
*pageUpButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Label for Page Up button.  
  
*pageDownButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Label for Page Down button.  
  
*pageLeftButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Label for Page Left button.  
  
*pageRightButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Label for Page Right button.  
  
*scrollUpButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Label for Scroll Up button.  
  
*scrollDownButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Label for Scroll Down button.  
  
*scrollLeftButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Label for Scroll Left button.  
  
*scrollRightButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Label for Scroll Right button.  
  
*guideButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Label for Guide button.  
  
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

[Input API Overview](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  