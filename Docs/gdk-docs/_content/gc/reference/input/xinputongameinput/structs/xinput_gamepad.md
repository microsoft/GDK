---
author: M-Stahl
title: XINPUT_GAMEPAD
description: XINPUT_GAMEPAD API reference
kindex: XINPUT_GAMEPAD
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
quality: good
security: public
---

# XINPUT_GAMEPAD  

Describes the current state of the Xbox Controller.  

## Syntax  
  
```cpp
typedef struct XINPUT_GAMEPAD {  
    WORD wButtons;  
    BYTE bLeftTrigger;  
    BYTE bRightTrigger;  
    SHORT sThumbLX;  
    SHORT sThumbLY;  
    SHORT sThumbRX;  
    SHORT sThumbRY;  
} XINPUT_GAMEPAD  
```
  
### Members  
  
*wButtons*  
Type: WORD  
  
Bitmask of the device's digital buttons. A set bit indicates that the corresponding button is pressed.  


|Device button  |Bitmask  |
|---------|---------|
|XINPUT_GAMEPAD_DPAD_UP           |0x0001         |
|XINPUT_GAMEPAD_DPAD_DOWN         |0x0002         |
|XINPUT_GAMEPAD_DPAD_LEFT         |0x0004         |
|XINPUT_GAMEPAD_DPAD_RIGHT        |0x0008         |
|XINPUT_GAMEPAD_START             |0x0010         |
|XINPUT_GAMEPAD_BACK              |0x0020         |
|XINPUT_GAMEPAD_LEFT_THUMB        |0x0040         |
|XINPUT_GAMEPAD_RIGHT_THUMB       |0x0080         |
|XINPUT_GAMEPAD_LEFT_SHOULDER     |0x0100         |
|XINPUT_GAMEPAD_RIGHT_SHOULDER    |0x0200         |
|XINPUT_GAMEPAD_A       |0x1000         |
|XINPUT_GAMEPAD_B       |0x2000         |
|XINPUT_GAMEPAD_X       |0x4000         |
|XINPUT_GAMEPAD_Y       |0x8000         |

Bits that are set but not defined above are reserved, and their state is undefined.  

*bLeftTrigger*  
Type: BYTE  
  
The current value of the Left Trigger's analog control. The value is between 0 and 255.  
  
*bRightTrigger*  
Type: BYTE  
  
The current value of the Right Trigger's analog control. The value is between 0 and 255.  
  
*sThumbLX*  
Type: SHORT  
  
Left thumbstick's x-axis value. Each thumbstick axis member is a signed value that is between -32768 and 32767 and describes the position of the thumbstick. A value of 0 is centered, negative values signify down or to the left, and positive values signify up or to the right. The constants XINPUT_GAMEPAD_LEFT_THUMB_DEADZONE and XINPUT_GAMEPAD_RIGHT_THUMB_DEADZONE can be used as positive and negative values for filtering a thumbstick input.  
  
*sThumbLY*  
Type: SHORT  
  
Left thumbstick's y-axis value, which is between -32768 and 32767.  
  
*sThumbRX*  
Type: SHORT  
  
Right thumbstick's x-axis value, which is between -32768 and 32767.  
  
*sThumbRY*  
Type: SHORT  
  
Right thumbstick's y-axis value, which is between -32768 and 32767.  
  
  
## Remarks
  
This structure is used by the [XINPUT_STATE](xinput_state.md) structure during the polling for changes in the state of the controller.

The specific mapping of a button to a game function varies according to the game type.

The constant XINPUT_GAMEPAD_TRIGGER_THRESHOLD may be used as the value that *bLeftTrigger* and *bRightTrigger* must be greater than to register as pressed. This is optional but often desirable. Xbox 360 Controller buttons do not manifest crosstalk.
  
## Requirements  
  
**Header:** XInputOnGameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also 
[Port XInput to GameInput](../../../../input/porting/input-porting-xinput.md)  
[XInputOnGameInput](../xinputongameinput_members.md)  
  
  