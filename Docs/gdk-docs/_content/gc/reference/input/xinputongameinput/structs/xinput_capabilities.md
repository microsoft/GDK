---
author: M-Stahl
title: XINPUT_CAPABILITIES
description: XINPUT_CAPABILITIES API reference
kindex: XINPUT_CAPABILITIES
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
quality: good
security: public
---

# XINPUT_CAPABILITIES  

Describes the capabilities of a connected controller.  

## Syntax  
  
```cpp
typedef struct XINPUT_CAPABILITIES {  
    BYTE Type;  
    BYTE SubType;  
    WORD Flags;  
    XINPUT_GAMEPAD Gamepad;  
    XINPUT_VIBRATION Vibration;  
} XINPUT_CAPABILITIES  
```
  
### Members  
  
*Type*  
Type: BYTE  
  
Controller type. It must be of type XINPUT_DEVTYPE_GAMEPAD and have one of the values listed in the table below.  
  
*SubType*  
Type: BYTE  
  
Subtype of the game controller.  

Allowed subtypes:


|Subtype  |Meaning  |
|---------|---------|
|XINPUT_DEVSUBTYPE_UNKNOWN          |Unknown. The controller type is unknown.         |
|XINPUT_DEVSUBTYPE_GAMEPAD          |Gamepad controller. Includes Left and Right Sticks, Left and Right Triggers, Directional Pad, and all standard buttons: A, B, X, Y, START, BACK, LB, RB, LSB, and RSB.         |
|XINPUT_DEVSUBTYPE_WHEEL            |Racing wheel controller. Left Stick X reports the wheel rotation, Right Trigger is the acceleration pedal, and Left Trigger is the brake pedal. Directional Pad and most of the standard buttons are included: A, B, X, Y, START, BACK, LB, and RB. LSB and RSB are optional.         |
|XINPUT_DEVSUBTYPE_ARCADE_STICK     | Arcade stick controller. Includes a Digital Stick that reports as a DPAD (up, down, left, and right) and most of the standard buttons: A, B, X, Y, START, and BACK. The Left and Right Triggers are implemented as digital buttons and report either 0 or 0xFF. LB, LSB, RB, and RSB are optional.         |
|XINPUT_DEVSUBTYPE_FLIGHT_STICK     |Flight stick controller. Includes a pitch-and-roll stick that reports as the Left Stick, a POV Hat that reports as the Right Stick, a rudder (handle twist or rocker) that reports as the Left Trigger, and a throttle control as the Right Trigger. Includes support for a primary weapon (A), secondary weapon (B), and other standard buttons: X, Y, START, and BACK. LB, LSB, RB, and RSB are optional.         |
|XINPUT_DEVSUBTYPE_DANCE_PAD        |Dance Pad controller. Includes the Directional Pad and standard buttons (A, B, X, and Y) on the pad, as well as BACK and START.         |
|XINPUT_DEVSUBTYPE_GUITAR XINPUT_DEVSUBTYPE_GUITAR_ALTERNATE XINPUT_DEVSUBTYPE_GUITAR_BASS     |Guitar controller. The strum bar maps to DPAD (up and down), and the frets are assigned to A (green), B (red), Y (yellow), X (blue), and LB (orange). Right Stick Y is associated with a vertical orientation sensor, and Right Stick X is the whammy bar. Support for BACK, START, and DPAD (left, right) is included. Left Trigger (pickup selector), Right Trigger, RB, LSB (fret modifier), and RSB are optional. Guitar Bass is identical to Guitar, with the distinct subtype for simplifying setup. Guitar Alt supports a larger range of movement for the vertical orientation sensor.         |
|XINPUT_DEVSUBTYPE_DRUM_KIT         |Drum controller. The drum pads are assigned to buttons: A for green (Floor Tom), B for red (Snare Drum), X for blue (Low Tom), Y for yellow (High Tom), and LB for the pedal (Bass Drum). Directional-Pad, BACK, and START are included. RB, LSB, and RSB are optional.         |
|XINPUT_DEVSUBTYPE_ARCADE_PAD       | Arcade pad controller. Includes Directional Pad and most of the standard buttons: A, B, X, Y, START, BACK, LB, and RB. The Left and Right Triggers are implemented as digital buttons and report either 0 or 0xFF. Left Stick, Right Stick, LSB, and RSB are optional.         |

  
*Flags*  
Type: WORD  
  
Features of the controller.


|Value  |Description  |
|---------|---------|
|XINPUT_CAPS_VOICE_SUPPORTED   |Device has an integrated voice device.         |
|XINPUT_CAPS_FFB_SUPPORTED     |Device supports force-feedback functionality. At this time, force-feedback features other than rumble are not supported through XINPUT on Windows.         |
|XINPUT_CAPS_WIRELESS          |Device is wireless.         |
|XINPUT_CAPS_PMD_SUPPORTED     |Device supports plug-in modules. At this time, plug-in modules (such as text input device (TID)) are not supported through XINPUT on Windows.         |
|XINPUT_CAPS_NO_NAVIGATION     |Device lacks the menu-navigation buttons: START, BACK, and DPAD.         |
  
  
*Gamepad*  
Type: [XINPUT_GAMEPAD](xinput_gamepad.md)  
  
[XINPUT_GAMEPAD](xinput_gamepad.md) structure that describes available controller features and control resolutions.  
  
*Vibration*  
Type: [XINPUT_VIBRATION](xinput_vibration.md)  
  
[XINPUT_VIBRATION](xinput_vibration.md) structure that describes available vibration functionality and resolutions.  
  
  
## Remarks

[XInputGetCapabilities](../functions/xinputgetcapabilities.md) returns XINPUT_CAPABILITIES to indicate the characteristics and available functionality of a specified controller.  

[XInputGetCapabilities](../functions/xinputgetcapabilities.md) sets the structure members to indicate which inputs the device supports. For binary state controls, such as digital buttons, the corresponding bit reflects whether the control is supported by the device. For proportional controls, such as thumbsticks, the value indicates the resolution for that control. Some number of the least-significant bits may not be set, to indicate that the control does not provide resolution to that level.  

The SubType member indicates the specific subtype of the controller present. Games may detect the controller subtype and tune their handling of controller input or output according to the subtypes well suited to their game genre. For example, a game of car racing might check for the presence of a wheel controller to provide finer control of the car being driven. However, titles must not disable or ignore a device according to its subtype. A subtype not recognized by the game or for which the game is not specifically tuned should be treated as a standard Xbox 360 Controller, XINPUT_DEVSUBTYPE_GAMEPAD.  

Older XUSB Windows drivers report information about incomplete capabilities, particularly for wireless devices. The latest XUSB Windows driver provides full support for wired and wireless devices, and it provide more complete and accurate capabilities flags.
  
## Requirements  
  
**Header:** XInputOnGameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also 
[Port XInput to GameInput](../../../../input/porting/input-porting-xinput.md)  
[XInputOnGameInput](../xinputongameinput_members.md)  
  
  