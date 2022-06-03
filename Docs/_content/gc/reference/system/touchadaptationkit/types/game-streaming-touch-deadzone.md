---
title: Deadzone
description: Definition for the amount of player interaction that should not be registered as input
author: arikcohen
kindex: Touch Adaptation Kit types, DeadZone
edited: 00/00/0000
ms.author: arikc
ms.prod: gaming
ms.topic: reference
ms.date: 12/20/2020
security: public
---

# Deadzone

Definition for the amount of player interaction that should not be registered as input

## Properties

`threshold` - _number_. A value between 0 and 1 that specifies the size of the deadzone as a percentage of the control.  
`radial` - _boolean_. If, and only if, the input is | `axisXY`, then this property must be specified. If `true`, the deadzone will be radial (circular), and if `false` it will be axial (square).

## Remarks

Every deadzone has a size, and depending on the type of input, may have a shape.

## Related Controls

[Accelerometer](../sensor-controls/game-streaming-touch-accelerometer.md)  
[Gyroscope](../sensor-controls/game-streaming-touch-gyroscope.md)  
[Joystick](../controls/game-streaming-touch-joystick.md)  
[Throttle](../controls/game-streaming-touch-throttle.md)  
[Touchpad](../controls/game-streaming-touch-touchpad.md)

## See Also

[Touch Adaptation Kit Reference](../../../../system/overviews/game-streaming/game-streaming-touch-touch-adaptation-kit-overview.md)
