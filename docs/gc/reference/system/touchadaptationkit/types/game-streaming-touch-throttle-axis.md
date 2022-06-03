---
title: ThrottleAxis
description: The styling of a throttle axis controls.
author: arikcohen
kindex: Touch Adaptation Kit types, ThrottleAxis
edited: 00/00/0000
ms.author: arikc
ms.prod: gaming
ms.topic: reference
ms.date: 12/20/2020
security: public
---

# Throttle axis styling component

The styling attributes for an axes of a throttle control.

## Properties

`opacity` - _number_, _optional_. The opacity to be applied to the component.

[`stroke`](game-streaming-touch-stroke.md) - _object_, _optional_. Styling instructions for [stroke](game-streaming-touch-stroke.md) to be used on the outline of the [joystick's](../controls/game-streaming-touch-joystick.md) interactable area.

[`cap`](game-streaming-touch-color.md) - _object_, _optional_. A [color](game-streaming-touch-color.md) object representing the styling instructions for the cap that is sits on the end of the axis.

## Sample

```JSON
{
    "axisUp": {
        "stroke" : {
            "type": "solid",
            "color":  "#107C10"
        },
        "cap" : {
            "type": "color",
            "value": "#107C10"
        }
    },
}
```

## Remarks

The `outline` is a component of the [joystick](../controls/game-streaming-touch-joystick.md) control that represents the outline of the circular interactable area and the directional indicator.

## Related Controls

[Joystick](../controls/game-streaming-touch-joystick.md)

## See also

[Touch Adaptation Kit Reference](../../../../system/overviews/game-streaming/game-streaming-touch-touch-adaptation-kit-overview.md)
