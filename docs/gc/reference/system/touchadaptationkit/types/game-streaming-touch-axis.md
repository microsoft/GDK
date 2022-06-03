---
title: Axis
description: Definition of the mapping of touch controls to the physical analog control equivalent
author: arikcohen
kindex: Touch Adaptation Kit types, Axis
edited: 00/00/0000
ms.author: arikc
ms.prod: gaming
ms.topic: reference
ms.date: 12/20/2020
security: public
---

# Axis

Definition of the mapping of touch controls to the physical analog control equivalent.

## Properties

[`input`- _string_](#inputs). The type of touch [input](#inputs) that this control accepts.  
[`output` - _string_](#outputs). The gamepad axes, axis, or polar joystick action this control maps to.  
[`deadzone`](game-streaming-touch-deadzone.md) - [_object_](game-streaming-touch-deadzone.md), _optional_. The size and shape, of the area where no input will be read or mapped.  
`sensitivity` - _number_, _optional_. Multiplier applied after response curve calculation.  
[`responseCurve` - _object_](game-streaming-touch-responsecurve.md), _optional_. Shape of the [response curve](game-streaming-touch-responsecurve.md).

<a id="inputs"></a>

### Input values

| Constant  | Description                                         |
| :-------- | :-------------------------------------------------- |
| axisXY    | Full 2D input, reads both X-axis and Y-axis values. |
| axisX     | 1D input, only reads X-axis values.                 |
| axisY     | 1D input, only reads Y-axis values.                 |
| axisUp    | Polar input.                                        |
| axisDown  | Polar input.                                        |
| axisLeft  | Polar input.                                        |
| axisRight | Polar input.                                        |

<a id="outputs"></a>

### Output values

| Constant           | Description                                          |
| :----------------- | :--------------------------------------------------- |
| leftJoystick       | 2D output to the left joystick.                      |
| rightJoystick      | 2D output to the right joystick.                     |
| leftJoystickX      | 1D ouptut to the left joystick X-axis.               |
| leftJoystickY      | 1D ouptut to the left joystick Y-axis.               |
| rightJoystickX     | 1D ouptut to the right joystick X-axis.              |
| rightJoystickY     | 1D ouptut to the left joystick Y-axis.               |
| leftJoystickLeft   | Polar output to the left joystick, left direction.   |
| leftJoystickRight  | Polar output to the left joystick, right direction.  |
| leftJoystickUp     | Polar output to the left joystick, up direction.     |
| leftJoystickDown   | Polar output to the left joystick, down direction.   |
| rightJoystickLeft  | Polar output to the right joystick, left direction.  |
| rightJoystickRight | Polar output to the right joystick, right direction. |
| rightJoystickUp    | Polar output to the right joystick, up direction.    |
| rightJoystickDown  | Polar output to the right joystick, down direction.  |
| relativeMouse      | 2D output to the mouse.                              |
| relativeMouseX     | 1D output to the mouse X-axis.                       |
| relativeMouseY     | 2D output to the mouse Y-axis.                       |
| relativeMouseLeft  | Polar output to the mouse, left direction.           |
| relativeMouseRight | Polar output to the mouse right direction.           |
| relativeMouseUp    | Polar output to the mouse, up direction.             |
| relativeMouseDown  | Polar output to the mouse, down direction.           |

## Remarks

A 2D input must map to a 2D output, similarly a 1D input must map to a 1D output, and a single direction must map to a polar output.

## Related Controls

[Accelerometer](../sensor-controls/game-streaming-touch-accelerometer.md)  
[Gyroscope](../sensor-controls/game-streaming-touch-gyroscope.md)  
[Joystick](../controls/game-streaming-touch-joystick.md)  
[Throttle](../controls/game-streaming-touch-throttle.md)
[Touchpad](../controls/game-streaming-touch-touchpad.md)

## See Also

[Touch Adaptation Kit Reference](../../../../system/overviews/game-streaming/game-streaming-touch-touch-adaptation-kit-overview.md)  
[Deadzone](game-streaming-touch-deadzone.md)  
[Response Curve](game-streaming-touch-responsecurve.md)
