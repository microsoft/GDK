---
author: aablackm
title: GAMEPAD_REPORT structure
description: A snapshot of the state of a controller.
ms.assetid: T:Windows.Xbox.xtfinput.GAMEPAD_REPORT
kindex: GAMEPAD_REPORT structure
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# GAMEPAD_REPORT structure
A snapshot of the state of a controller.
<a id="syntaxSection"></a>



## Syntax  
```cpp
typedef struct GAMEPAD_REPORT {
    UINT16 Buttons;
    UINT16 LeftTrigger;
    UINT16 RightTrigger;
    INT16 LeftThumbstickX;
    INT16 LeftThumbstickY;
    INT16 RightThumbstickX;
    INT16 RightThumbstickY;
} GAMEPAD_REPORT, *PGAMEPAD_REPORT;  
```

<a id="ID4EG"></a>



##### Members  

**Buttons**  
A combination of [GAMEPAD_BUTTONS](../enumerations/GAMEPAD_BUTTONS-typedef---xtfinput-xbox-windows-t.md) flag values that represent the state of the buttons on the controller.


**LeftTrigger**  
Value between 0 and 1023 that indicates how far the left trigger is pulled.


**RightTrigger**  
Value between 0 and 1023 that indicates how far the right trigger is pulled.


**LeftThumbstickX**  
Value between -32768 and 32767 that indicates the position of the left thumbstick on the x-axis.


**LeftThumbstickY**  
Value between -32768 and 32767 that indicates the position of the left thumbstick on the y-axis.


**RightThumbstickX**  
Value between -32768 and 32767 that indicates the position of the right thumbstick on the x-axis.


**RightThumbstickY**  
Value between -32768 and 32767 that indicates the position of the right thumbstick on the y-axis.

<a id="requirements"></a>

## Remarks

**GAMEPAD_REPORT** is used to send the desired state of a simulated controller to a development console. You will send individual states of the controller to the console using [IXtfInputClient::SendGamepadReport](../classes/IXtfInputClient/methods/sendgamepadreport-ixtfinputclient-xtfinput-xbox-windows-m.md). By doing this repeatedly you will be able to simulate a sequence of controller input on the development console. You will need to send game reports to a virtual controller created by [IXtfInputClient::ConnectGamepad](../classes/IXtfInputClient/methods/connectgamepad-ixtfinputclient-xtfinput-xbox-windows-m.md).

## Requirements  

**Header:** xtfinput.h  

**Library:** xtfinput.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also
[XtfInput](../xtfinput-xbox-microsoft-n.md)  
[IXtfInputClient::SendGamepadReport](../classes/IXtfInputClient/methods/sendgamepadreport-ixtfinputclient-xtfinput-xbox-windows-m.md)  
[IXtfInputClient::ConnectGamepad](../classes/IXtfInputClient/methods/connectgamepad-ixtfinputclient-xtfinput-xbox-windows-m.md)  