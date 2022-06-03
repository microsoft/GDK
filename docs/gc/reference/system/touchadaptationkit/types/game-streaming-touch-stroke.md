---
title: Stroke
description: Outline
author: arikcohen
kindex: Touch Adaptation Kit types, Stroke
edited: 00/00/0000
ms.author: arikc
ms.prod: gaming
ms.topic: reference
ms.date: 12/20/2020
security: public
---

# Stroke

The styling attributes for outline of the object being referenced.

## Properties

`type` - _string_. The type of stroke to be drawn. Only available value is "solid"

`color` - _string_. The [color](game-streaming-touch-hexcolor.md) to be referenced.

`opactity` - _number_. The opacity that should be applied. Defaults to 1.0.

## Sample

```JSON
{
    "type": "solid",
    "color": "#0e7a0d",
    "opacity": 1.0
}
```

## Remarks

The stroke applies to the outline of the object that is being referenced.

## Related Controls

[Directional Pad](../controls/game-streaming-touch-directionalpad.md)  
[Joystick](../controls/game-streaming-touch-joystick.md)  
[Throttle](../controls/game-streaming-touch-throttle.md)

## See also

[Touch Adaptation Kit Reference](../../../../system/overviews/game-streaming/game-streaming-touch-touch-adaptation-kit-overview.md)
