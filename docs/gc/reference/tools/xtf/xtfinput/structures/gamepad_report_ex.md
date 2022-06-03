---
author: aablackm
title: GAMEPAD_REPORT_EX
description: A snapshot of the state of a controller with extended information.
kindex: GAMEPAD_REPORT_EX
ms.author: stevenpr
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
---

# GAMEPAD_REPORT_EX  

A snapshot of the state of a controller with extended information.     

## Syntax  
  
```cpp
typedef struct GAMEPAD_REPORT_EX {  
    UINT16 Buttons;  
    UINT16 LeftTrigger;  
    UINT16 RightTrigger;  
    INT16 LeftThumbstickX;  
    INT16 LeftThumbstickY;  
    INT16 RightThumbstickX;  
    INT16 RightThumbstickY;  
    UINT32 MoreButtons;  
} GAMEPAD_REPORT_EX  
```
  
### Members  
  
*Buttons*  
Type: UINT16  
  
A combination of [GAMEPAD_BUTTONS](../enumerations/GAMEPAD_BUTTONS-typedef---xtfinput-xbox-windows-t.md) flag values that represent the state of the buttons on the controller.
  
*LeftTrigger*  
Type: UINT16  
  
Value between 0 and 1023 that indicates how far the left trigger is pulled.
  
*RightTrigger*  
Type: UINT16  
  
Value between 0 and 1023 that indicates how far the right trigger is pulled.
  
*LeftThumbstickX*  
Type: INT16  
  
Value between -32768 and 32767 that indicates the position of the left thumbstick on the x-axis.
  
*LeftThumbstickY*  
Type: INT16  
  
Value between -32768 and 32767 that indicates the position of the left thumbstick on the y-axis.
  
*RightThumbstickX*  
Type: INT16  
  
Value between -32768 and 32767 that indicates the position of the right thumbstick on the x-axis.
  
*RightThumbstickY*  
Type: INT16  
  
Value between -32768 and 32767 that indicates the position of the right thumbstick on the y-axis.
  
*MoreButtons*  
Type: UINT32  
  
Buttons that are only present on the Xbox Series controllers. Use values from GAMEPAD_MORE_BUTTONS as a mask to specify the state of these buttons.
  
  
## Requirements  
  
**Header:** XtfInput.h
**Library:** xtfinput.lib  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also  
[XtfInput](../xtfinput-xbox-microsoft-n.md)  
[SendGamepadReportEx](../classes/IXtfInputClient/methods/ixtfinputclient_sendgamepadreportex.md)  
[IXtfInputClient::ConnectGamepad](../classes/IXtfInputClient/methods/connectgamepad-ixtfinputclient-xtfinput-xbox-windows-m.md)  
  