---
title: ResponseCurve
description: Type for repsonse curve
author: arikcohen
kindex: Touch Adaptation Kit types, ResponseCurve
edited: 00/00/0000
ms.author: arikc
ms.prod: gaming
ms.topic: reference
ms.date: 12/20/2020
security: public
---

# Response Curve

Definition of the curve range for mapping input mapped to output.

## Properties

`type` - _string_. The type of the response curve. Valid values are:

- `circular`. A response curve shape that widens input resolution near the lower ranges (0) and condenses input resolution near the higher ranges (1)
- `circular-inverse`. A response curve shape that condenses input resolution near the lower ranges (0) and widens input resolution near the higher ranges (1)

`range` - _array_ of _numbers_. An array of two numbers between 0 and 1 the start and end values for the input curve range.

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
[Axis](game-streaming-touch-axis.md)
