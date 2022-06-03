---
title: Knob
description: The button like knob element
author: arikcohen
kindex: Touch Adaptation Kit types, Knob
edited: 00/00/0000
ms.author: arikc
ms.prod: gaming
ms.topic: reference
ms.date: 12/20/2020
security: public
---

# Knob

The styling attributes for a button like component that can be interacted with by the player.

## Properties

`background` - _object_, _optional_. Can either be a [color](game-streaming-touch-color.md) or [image asset](game-streaming-touch-asset.md).

`faceImage` - _object_, _optional_. Can either be an [icon](game-streaming-touch-icon.md) or [image asset](game-streaming-touch-asset.md).

`opacity` - _number_, _optional_. The opacity to be applied to the component. Default to 1.0 for all states but `disabled`.

[`stroke`](game-streaming-touch-stroke.md) - _object_, _optional_. Styling instructions for [stroke](game-streaming-touch-stroke.md) to be used on the outline of the component.

## Sample

```JSON
{
    "knob": {
        "background" : {
            "type": "color",
            "value":  "#107C10"
        },
        "faceImage" : {
            "type": "icon",
            "value": "run"
        }
    },
}
```

## Remarks

The `knob` is a component of a more complex control (e.g., [joystick](../controls/game-streaming-touch-joystick.md),
[throttle](../controls/game-streaming-touch-throttle.md))
that can be interacted with by the player.

The default visual style of the `knob` is different per control.

## Related Controls

[Joystick](../controls/game-streaming-touch-joystick.md)  
[Throttle](../controls/game-streaming-touch-throttle.md)

## See also

[Touch Adaptation Kit Reference](../../../../system/overviews/game-streaming/game-streaming-touch-touch-adaptation-kit-overview.md)
