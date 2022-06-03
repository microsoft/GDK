---
author: M-Stahl
title: GameInputGamepadButtons
description: Enumerates gamepad buttons, including the directional pad (D-pad).
kindex: GameInputGamepadButtons
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputGamepadButtons  

Enumerates gamepad buttons, including the directional pad (D-pad).  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputGamepadButtons  
{  
    GameInputGamepadNone = 0x00000000,  
    GameInputGamepadMenu = 0x00000001,  
    GameInputGamepadView = 0x00000002,  
    GameInputGamepadA = 0x00000004,  
    GameInputGamepadB = 0x00000008,  
    GameInputGamepadX = 0x00000010,  
    GameInputGamepadY = 0x00000020,  
    GameInputGamepadDPadUp = 0x00000040,  
    GameInputGamepadDPadDown = 0x00000080,  
    GameInputGamepadDPadLeft = 0x00000100,  
    GameInputGamepadDPadRight = 0x00000200,  
    GameInputGamepadLeftShoulder = 0x00000400,  
    GameInputGamepadRightShoulder = 0x00000800,  
    GameInputGamepadLeftThumbstick = 0x00001000,  
    GameInputGamepadRightThumbstick = 0x00002000  
} GameInputGamepadButtons  
```  
  
<a id="constantsSection"></a>

## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputGamepadNone | No button pressed. |  
| GameInputGamepadMenu | Menu button pressed. |  
| GameInputGamepadView | View button pressed. |  
| GameInputGamepadA | A button pressed. |  
| GameInputGamepadB | B button pressed. |  
| GameInputGamepadX | X button pressed. |  
| GameInputGamepadY | Y button pressed. |  
| GameInputGamepadDPadUp | Top portion of D-pad pressed. |  
| GameInputGamepadDPadDown | Bottom portion of D-pad pressed. |  
| GameInputGamepadDPadLeft | Left portion of D-pad pressed. |  
| GameInputGamepadDPadRight | Right portion of D-pad pressed. |  
| GameInputGamepadLeftShoulder | Left shoulder button pressed. |  
| GameInputGamepadRightShoulder | Right shoulder button pressed. |  
| GameInputGamepadLeftThumbstick | Left thumbstick pressed. |  
| GameInputGamepadRightThumbstick | Right thumbstick pressed. |  
  
<a id="remarksSection"></a>

## Remarks  
  
This enumeration is used in the [GameInputGamePadState](../structs/gameinputgamepadstate.md) structure. You can combine values to read multiple buttons simultaneously. 

For more information, see the [Getting data from readings](../../../../input/overviews/input-readings.md#gettingStateSection) section of [GameInput readings](../../../../input/overviews/input-readings.md).  
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  