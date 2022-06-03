---
title: Joystick
description: The outline and directional indicator of a joystick
author: arikcohen
kindex: Touch Adaptation Kit types, Joystick
edited: 00/00/0000
ms.author: arikc
ms.prod: gaming
ms.topic: reference
ms.date: 12/20/2020
security: public
---

# Joystick Outline and Directional Indicator

The styling attributes for the outer ring of a joystick controls.

## Properties

`opacity` - _number_, _optional_. The opacity to be applied to the component.

[`stroke`](game-streaming-touch-stroke.md) - _object_, _optional_. Styling instructions for [stroke](game-streaming-touch-stroke.md) to be used on the outline of the [joystick's](../controls/game-streaming-touch-joystick.md) interactable area.

[`indicator`](game-streaming-touch-color.md) - _object_, _optional_. A [color](game-streaming-touch-color.md) object that includes the styling instructions for the directional indicator that is displayed while a player is interacting with a `joystick` control.

## Sample

```JSON
{
    "outline": {
        "stroke" : {
            "type": "solid",
            "color":  "#107C10"
        },
        "indicator" : {
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
