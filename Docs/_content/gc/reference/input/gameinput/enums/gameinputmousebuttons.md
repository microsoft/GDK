---
author: M-Stahl
title: GameInputMouseButtons
description: Enumerates mouse buttons.
kindex: GameInputMouseButtons
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputMouseButtons  

Enumerates mouse buttons.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputMouseButtons  
{  
    GameInputMouseNone = 0x00000000,  
    GameInputMouseLeftButton = 0x00000001,  
    GameInputMouseRightButton = 0x00000002,  
    GameInputMouseMiddleButton = 0x00000004,  
    GameInputMouseButton4 = 0x00000008,  
    GameInputMouseButton5 = 0x00000010,  
    GameInputMouseWheelTiltLeft = 0x00000020,  
    GameInputMouseWheelTiltRight = 0x00000040  
} GameInputMouseButtons  
```  
  
<a id="constantsSection"></a>

## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputMouseNone | No mouse buttons. |  
| GameInputMouseLeftButton | Left mouse button. |  
| GameInputMouseRightButton | Right mouse button. |  
| GameInputMouseMiddleButton | Middle mouse button. |  
| GameInputMouseButton4 | Fourth mouse button. |  
| GameInputMouseButton5 | Fifth mouse button. |  
| GameInputMouseWheelTiltLeft | Left tilt of scroll wheel. |  
| GameInputMouseWheelTiltRight | Right tilt of scroll wheel. |  
  
<a id="remarksSection"></a>

## Remarks  

This enumeration is used in the [GameInputMouseInfo](../structs/gameinputmouseinfo.md) structure (to determine which mouse buttons are available) and in the [GameInputMouseState](../structs/gameinputmousestate.md) structure (to get device readings). 

For more information about accessing device properties, see [GameInput devices](../../../../input/overviews/input-devices.md). For more information about getting device readings, see [GameInput readings](../../../../input/overviews/input-readings.md). 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  