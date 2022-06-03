---
author: arikcohen
title: Accelerometer
description: Accelerometer control
kindex: Touch Adaptation Kit controls, accelerometer
edited: 00/00/0000
ms.author: arikc
ms.topic: reference
ms.prod: gaming
ms.date: 12/20/2020
security: public
---

# Accelerometer (Experimental)

A sensor control that maps the devices accelerometer of the client device (if available) to a specfied set of axes.

> [!WARNING]
> The accelerometer control is currently available for use in experimental form and may change behavior based on early adopter feedback.

## Properties

`type` - "accelerometer"

`axis` - _object_ or _array_. A single [axis](../types/game-streaming-touch-axis.md) or array of [axes](../types/game-streaming-touch-axis.md) that describe the mapping of this touchpad control.

## Remarks

> [!WARNING]
> The accelerometer control may not be available on all devices that support touch layouts.

The `accelerometer` control can be used to provide an optimized experience on devices that can provide accelerometer support.

## Samples

```JSON
Map the acceleration of the device to the right joystick's Y axis, using a specified sensitivity.
{
    "type": "gyroscope",
    "axis": {
        "input": "axisY",
        "output": "rightJoystick",
        "sensitivity": 3.5
    },
}
```

## Requirements

**Layout Version:** 1.0+
