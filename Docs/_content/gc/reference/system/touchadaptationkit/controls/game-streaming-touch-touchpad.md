---
author: arikcohen
title: Touchpad
description: Touchpad control
kindex: Touch Adaptation Kit controls, touchpad
edited: 00/00/0000
ms.author: arikc
ms.topic: reference
ms.prod: gaming
ms.date: 12/20/2020
security: public
---

# Touchpad

Analog control that enables the player to interact similar to a laptop touchpad.

## Properties

`type` - "touchpad"

`axis` - _object_ or _array_. A single [axis](../types/game-streaming-touch-axis.md) or array of [axes](../types/game-streaming-touch-axis.md) that describe the mapping of this touchpad control.

`action` - _object_, _optional_. An [action](../types/game-streaming-touch-action.md) to invoked on touch in addition to the axis mapping.

`renderAsButton` - _boolean_, _optional_. Default to `false`. Set to `true` to render the touchpad visually as a button.

`enabled` - _boolean_, _optional_. Defaults to `true`. Sets the visual state of the control to enabled/disabled. A disabled control will still receive input from the player, but NOT change the visual style based on the input.

`visible` - _boolean_, _optional_. Defaults to `true`. Determines whether the control is displayed to the player to interact with. To change during game play see [Changing touch layouts using game state](../../../../system/overviews/game-streaming/building-touch-layouts/game-streaming-touch-changing-layouts-game-state.md#change_state).

`styles` - _object_, _optional_. Customization of the visual representation of the control. The styles are represented as an object per state that can be styled.

The button control can have the following states styled:

- `default` - The base style.
- `disabled` - The style when the control is disabled. If not specfied, then when the control is disabled, a transformation will be applied to the default style to make it appear disabled.
- `idle` - Applied when the player is NOT interacting with the control.
- `moving` - Applied when the when the player is touching the control and no `action` is defined.
- `activated` - Applied when the when the player is touching the control and an `action` is defined.

**Styling properties per state**

`opacity` - _number_, _optional_. The opacity to be applied to the control. Default to 1.0 for all states but `disabled`.

`background` - _object_, _optional_. Can either be a [color](../types/game-streaming-touch-color.md) or [image asset](../types/game-streaming-touch-asset.md).

`faceImage` - _object_, _optional_. Can either be an [icon](../types/game-streaming-touch-icon.md) or [image asset](../types/game-streaming-touch-asset.md).

**Asset dimensions**

For each of the style objects that accept image assets, they must be provided in five resolutions.

| Object                              | @1.0x   | @1.5x | @2.0x   | @3.0x   | @4.0x   |
| :---------------------------------- | :------ | :---- | :------ | :------ | :------ |
| faceImage                           | 28x28   | 42x42 | 56x56   | 84x84   | 112x112 |
| background (renderAsButton = true)  | 60x60   | 90x90 | 120x120 | 180x180 | 240x240 |
| background (renderAsButton = false) | 120x120 | 90x90 | 240x240 | 360x360 | 480x480 |

## Remarks

The `touchpad` is best used for non-sticky, no-deadzone output — typically the look camera in a first/third-person perspective game.

For games that support mouse input, the `touchpad` can be used with relative mouse to provide a more tuned look camera experience.

**Styling remarks**

When `renderAsButton` is `true`:

- When in the `activated` state, the `faceImage` is displayed 25% smaller.
- There are labels and default styling for the background color for buttons that do not use custom assets and have a single action of `gamepadX`, `gamepadY`, `gamepadA`, or `gamepadB`.

## Samples

#### Example 1: Touchpad with a look icon

**Figure 1. Touchpad Control**
![User interacting with a touchpad](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/touch-control-images/game-streaming-touch-control-images-touchpad.gif)

```JSON
{
    "type": "touchpad",
    "axis": {
        "input": "axisXY",
        "output": "rightJoystick",
        "sensitivity": 3
    },
    "styles": {
        "default" : {
            "faceImage" : {
                "type": "icon",
                "value": "look"
            }
        }
    }
}
```

#### Example 2: Touchpad with a look icon that is rendered as a button

**Figure 1. Button Touchpad Control**
![User interacting with a touchpad as a butto](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/touch-control-images/game-streaming-touch-control-images-touchpad-renderAsbutton.gif)

```JSON
{
    "type": "touchpad",
    "renderAsButton": true,
    "axis": {
        "input": "axisXY",
        "output": "rightJoystick",
        "sensitivity": 3
    },
    "styles": {
        "default" : {
            "faceImage" : {
                "type": "icon",
                "value": "look"
            }
        }
    }
}
```

## Requirements

**Layout Version:** 1.0+ (Styling available from layout version 3.0+)
