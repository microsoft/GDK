---
author: M-Stahl
title: XINPUT_KEYSTROKE
description: Describes keystroke data returned by the XInputGetKeystroke function.
kindex: XINPUT_KEYSTROKE
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# XINPUT_KEYSTROKE  

Describes keystroke data returned by the XInputGetKeystroke function.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct XINPUT_KEYSTROKE {  
    WORD VirtualKey;  
    WCHAR Unicode;  
    WORD Flags;  
    BYTE UserIndex;  
    BYTE HidCode;  
} XINPUT_KEYSTROKE  
```
  
<a id="membersSection"></a>

### Members  
  
*VirtualKey*  
Type: WORD  
  
Virtual-key code of the key, button, or stick movement.   
  
*Unicode*  
Type: WCHAR  
  
This member is not used, and its value is zero.  
  
*Flags*  
Type: WORD  
  
Flags that indicate the keyboard state at the time of the input event. This member can be any combination of the following flags:  

| Value | Description | 
| --- | --- | 
| XINPUT_KEYSTROKE_KEYDOWN | The key was pressed. | 
| XINPUT_KEYSTROKE_KEYUP | The key was released. | 
| XINPUT_KEYSTROKE_REPEAT | A repeat of a held key. | 
  
*UserIndex*  
Type: BYTE  
  
Index of the gamer associated with the headset; a value in the range of 0 to `XUSER_MAX_COUNT – 1`.  
  
*HidCode*  
Type: BYTE  
  
Human Interface Device (HID) code that corresponds to the input. If there's no corresponding HID code, this value is zero.  
  
<a id="remarksSection"></a>

## Remarks
  
This structure is used by the [XInputGetKeystroke](../functions/xinputgetkeystroke.md) function. 

Future devices might return HID codes and virtual-key values that are not supported on current devices and are not defined at this time. Applications should ignore these unexpected values.  

A virtual-key code is a byte value that represents a particular physical key on the keyboard, not the character or characters (possibly none) that the key can be mapped to according to the keyboard state. The keyboard state at the time a virtual key is pressed modifies the character reported. For example, `VK_4` might represent "4" or "$", depending on the state of the Shift key.  

A reported keyboard event includes the virtual key that caused the event, whether the key was pressed or released (or is repeating), and the state of the keyboard at the time of the event. The keyboard state indicates whether any Ctrl, Alt, or Shift keys are pressed. 

The valid virtual-key codes (VK_xxx) are defined in XInput.h. In addition to codes that indicate key presses, the following codes indicate controller input:   

| Value | Description |
| --- | --- |
| VK_PAD_A | **A** button | 
| VK_PAD_B | **B** button | 
| VK_PAD_X | **X** button | 
| VK_PAD_Y | **Y** button | 
| VK_PAD_RSHOULDER | Right shoulder button  | 
| VK_PAD_LSHOULDER | Left shoulder button | 
| VK_PAD_LTRIGGER | Left trigger | 
| VK_PAD_RTRIGGER | Right trigger | 
| VK_PAD_DPAD_UP | Directional pad up | 
| VK_PAD_DPAD_DOWN | Directional pad down | 
| VK_PAD_DPAD_LEFT | Directional pad left | 
| VK_PAD_DPAD_RIGHT | Directional pad right | 
| VK_PAD_START | Start button | 
| VK_PAD_BACK | Back button | 
| VK_PAD_LTHUMB_PRESS | Left thumbstick click | 
| VK_PAD_RTHUMB_PRESS | Right thumbstick click | 
| VK_PAD_LTHUMB_UP | Left thumbstick up | 
| VK_PAD_LTHUMB_DOWN | Left thumbstick down | 
| VK_PAD_LTHUMB_RIGHT | Left thumbstick right | 
| VK_PAD_LTHUMB_LEFT | Left thumbstick left | 
| VK_PAD_LTHUMB_UPLEFT | Left thumbstick up and left | 
| VK_PAD_LTHUMB_UPRIGHT | Left thumbstick up and right | 
| VK_PAD_LTHUMB_DOWNRIGHT | Left thumbstick down and right | 
| VK_PAD_LTHUMB_DOWNLEFT | Left thumbstick down and left | 
| VK_PAD_RTHUMB_UP | Right thumbstick up | 
| VK_PAD_RTHUMB_DOWN | Right thumbstick down | 
| VK_PAD_RTHUMB_RIGHT | Right thumbstick right | 
| VK_PAD_RTHUMB_LEFT | Right thumbstick left | 
| VK_PAD_RTHUMB_UPLEFT | Right thumbstick up and left | 
| VK_PAD_RTHUMB_UPRIGHT | Right thumbstick up and right | 
| VK_PAD_RTHUMB_DOWNRIGHT | Right thumbstick down and right | 
| VK_PAD_RTHUMB_DOWNLEFT | Right thumbstick down and left | 

For more information, see [The XInputOnGameInput wrapper](../../../../input/porting/input-porting-xinput.md#xinputWrapperSection). 

<a id="requirementsSection"></a>

## Requirements  
  
**Header:** XInputOnGameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also 

[Porting from XInput to GameInput](../../../../input/porting/input-porting-xinput.md)  
[XInputOnGameInput](../xinputongameinput_members.md)  
  