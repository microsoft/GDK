---
author: aablackm
title: GAMEPAD_BUTTONS Enumeration
description: Controller button identifier flags.
ms.assetid: T:Windows.Xbox.xtfinput.GAMEPAD_BUTTONS
kindex: GAMEPAD_BUTTONS enumeration
ms.author: stevenpr
ms.topic: reference
edited: 00/00/0000
security: public
---

# GAMEPAD_BUTTONS Enumeration
Controller button identifier flags.   

 **GAMEPAD_BUTTONS** values are used in a [GAMEPAD_REPORT](../structures/GAMEPAD_REPORT-xtfinput-xbox-windows-t.md) to indicate which buttons are currently pressed.   

<a id="syntaxSection"></a>



## Syntax  
```cpp
typedef enum GAMEPAD_BUTTONS
{
    RIGHT_THUMBSTICK = 0x8000,
    LEFT_THUMBSTICK = 0x4000,
    RIGHT_SHOULDER = 0x2000,
    LEFT_SHOULDER = 0x1000,
    DPAD_RIGHT = 0x800,
    DPAD_LEFT = 0x400,
    DPAD_DOWN = 0x200,
    DPAD_UP = 0x100,
    Y = 0x80,
    X = 0x40,
    B = 0x20,
    A = 0x10,
    VIEW = 0x8,
    MENU = 0x4,
    NEXUS = 0x2,
    ENROLL = 0x1,
    NONE = 0
} GAMEPAD_BUTTONS, *PGAMEPAD_BUTTONS;  
```

<a id="ID4E6C"></a>



## Constants  

| Constant| Description|
| --- | --- |
| RIGHT_THUMBSTICK| The right thumbstick|
| LEFT_THUMBSTICK| The left thumbstick|
| RIGHT_SHOULDER| The right shoulder button|
| LEFT_SHOULDER| The left shoulder button|
| DPAD_RIGHT| The direction pad right button|
| DPAD_LEFT| The direction pad left button|
| DPAD_DOWN| The direction pad down button|
| DPAD_UP| The direciton pad up button.|
| Y| The Y button|
| X| The X button|
| B| The B button|
| A| The A button|
| VIEW| The View button|
| MENU| The Menu button|
| NEXUS| The Nexus button|
| ENROLL| The Enroll button|
| NONE| Value that indicates no buttons are currently pressed.|


<a id="requirements"></a>

## Remarks

**GAMEPAD_BUTTONS** is a flag enumeration so the values may be combined into a single value which represents multiple buttons being pressed. **GAMEPAD_BUTTONS** is a member of the [GAMEPAD_REPORT](../structures/GAMEPAD_REPORT-xtfinput-xbox-windows-t.md) struct. It is combined with additional information about non-button inputs like the triggers and stick values to represent the state of a gamepad input device. These states are sent to a console using the [IXtfInputClient](../classes/IXtfInputClient/ixtfinputclient-xtfinput-xbox-windows-t.md).

## Requirements  

**Header:** xtfinput.h  

**Library:** xtfinput.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also
[XtfInput](../xtfinput-xbox-microsoft-n.md)  
[GAMEPAD_REPORT](../structures/GAMEPAD_REPORT-xtfinput-xbox-windows-t.md)  
[IXtfInputClient](../classes/IXtfInputClient/ixtfinputclient-xtfinput-xbox-windows-t.md)  