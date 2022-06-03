---
author: M-Stahl
title: GameInputGamepadState
description: Describes the state of a gamepad input device.
kindex: GameInputGamepadState
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputGamepadState  

Describes the state of a gamepad input device.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputGamepadState {  
    GameInputGamepadButtons buttons;  
    float leftTrigger;  
    float rightTrigger;  
    float leftThumbstickX;  
    float leftThumbstickY;  
    float rightThumbstickX;  
    float rightThumbstickY;  
} GameInputGamepadState  
```
  
<a id="membersSection"></a>

### Members  
  
*buttons*  
Type: [GameInputGamepadButtons](../enums/gameinputgamepadbuttons.md)  
  
The gamepad buttons that are pressed.  
  
*leftTrigger*  
Type: float  
  
Position of left trigger, normalized as a value in the range [0.0, 1.0].  
  
*rightTrigger*  
Type: float  
  
Position of right trigger, normalized as a value in the range [0.0, 1.0].  
  
*leftThumbstickX*  
Type: float  
  
Horizontal position of the left thumbstick, normalized as a value in the range [–1.0, 1.0].  
  
*leftThumbstickY*  
Type: float  
  
Vertical position of the left thumbstick, normalized as a value in the range [–1.0, 1.0].  
  
*rightThumbstickX*  
Type: float  
  
Horizontal position of the right thumbstick, normalized as a value in the range [–1.0, 1.0].  
  
*rightThumbstickY*  
Type: float  
  
Vertical position of the right thumbstick, normalized as a value in the range [–1.0, 1.0].  
  
<a id="remarksSection"></a>

## Remarks  

Used by the [IGameInputReading:GetGamePadState](../interfaces/igameinputreading/methods/igameinputreading_getgamepadstate.md) method.  

For more information, see the [Getting data from readings](../../../../input/overviews/input-readings.md#gettingStateSection) section of [GameInput readings](../../../../input/overviews/input-readings.md). For a code example, see [A simple gamepad input loop](../../../../input/overviews/input-readings.md#sampleSection).  
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  