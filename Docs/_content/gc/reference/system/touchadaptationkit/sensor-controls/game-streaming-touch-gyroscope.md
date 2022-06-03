---
author: arikcohen
title: Gyroscope
description: Gyroscope control
kindex: Touch Adaptation Kit controls, gyroscope
edited: 00/00/0000
ms.author: arikc
ms.topic: reference
ms.prod: gaming
ms.date: 12/20/2020
security: public
---

# Gyroscope

A sensor control that maps the devices physical movement to a specified set of axes.

## Properties

`type` - "gyroscope"

`axis` - _object_ or _array_. A single [axis](../types/game-streaming-touch-axis.md) or array of [axes](../types/game-streaming-touch-axis.md) that describe the mapping of this touchpad control.

## Remarks

> [!WARNING]
> The gyroscope control may not be available on all devices that support touch layouts.

Like the [`touchpad`](../controls/game-streaming-touch-touchpad.md), the gyroscope is typically used in first/third-person perspective games to control the player look camera. With tuning using the gyroscope can bring mouse-like precision to the player's control.

## Samples

```JSON
Map the movement of the device to the right joystick, using a specified sensitivity.
{
    "type": "gyroscope",
    "axis": {
        "input": "axisXY",
        "output": "rightJoystick",
        "sensitivity": 0.3
    },
}
```

```JSON
Map the movement of the device to relative mouse movement, using a specified sensitivity.
{
    "type": "gyroscope",
    "axis": {
        "input": "axisXY",
        "output": "relativeMouse",
        "sensitivity": 6.3
    },
}
```

## Requirements

**Layout Version:** 1.0+
