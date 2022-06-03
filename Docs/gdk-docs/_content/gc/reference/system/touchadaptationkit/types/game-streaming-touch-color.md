---
title: Color
description: Reference to a color
author: arikcohen
kindex: Touch Adaptation Kit types, Color
edited: 00/00/0000
ms.author: arikc
ms.prod: gaming
ms.topic: reference
ms.date: 12/20/2020
security: public
---

# Color

Reference to a color.

## Properties

`opacity` - _number_, _optional_. The opacity to be applied to the color.

`type` - _string_. "color"

`value` - _string_. [Hexadecimal representation](game-streaming-touch-hexcolor.md) of RGBA color value to be referenced.

## Sample

```JSON
{
    "type": "color",
    "value": "#0e7a0d"
}
```

## Remarks

Colors are specified in RGBA format.

All of the following color representations would be equivalent:

- #0099ff
- #0099ffaa
- #09f,
- #09fa

## Related Controls

[Arcade Buttons](../controls/game-streaming-touch-arcadebuttons.md)  
[Button](../controls/game-streaming-touch-button.md)  
[Directional Pad](../controls/game-streaming-touch-directionalpad.md)  
[Joystick](../controls/game-streaming-touch-joystick.md)  
[Throttle](../controls/game-streaming-touch-throttle.md)  
[Touchpad](../controls/game-streaming-touch-touchpad.md)

## See also

[Touch Adaptation Kit Reference](../../../../system/overviews/game-streaming/game-streaming-touch-touch-adaptation-kit-overview.md)
