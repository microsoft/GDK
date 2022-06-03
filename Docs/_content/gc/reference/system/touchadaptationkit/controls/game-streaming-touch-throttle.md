---
author: arikcohen
title: Throttle
description: throttle control
kindex: Touch Adaptation Kit controls, throttle
edited: 00/00/0000
ms.author: arikc
ms.topic: reference
ms.prod: gaming
ms.date: 12/20/2020
security: public
---

# Throttle

A specialized version of a Y-axis only joystick. Designed for driving games.

## Properties

`type` - "throttle"

`axisUp` - _string_. Which trigger the upper part of the control maps to. Must be either `"leftTrigger"` or `"rightTrigger"`.

`axisDown` - _string_. Which trigger the lower part of the control maps to. Must be either `"leftTrigger"` or `"rightTrigger"`.

`relative` - _boolean_, _optional_. Controls how the throttle calculates its value. If `true`, the value will be based on where the user's initial touch was located. If `false`, the value will be based on the center point of the control. Defaults to `true`.

`sticky` - _boolean_, _optional_. Controls what happens when the user stops touching the control. If `true`, the throttle will stay at the last value. If `false`, it will reset to 0. Defaults to `false`.

`enabled` - _boolean_, _optional_. Defaults to `true`. Sets the visual state of the control to enabled/disabled. A disabled control will still receive input from the player, but NOT change the visual style based on the input.

`visible` - _boolean_, _optional_. Defaults to `true`. Determines whether the control is displayed to the player to interact with. To change during game play see [Changing touch layouts using game state](../../../../system/overviews/game-streaming/building-touch-layouts/game-streaming-touch-changing-layouts-game-state.md#change_state).

`styles` - _object_, _optional_. Customization of the visual representation of the control. The styles are represented as an object per state that can be styled.

The throttle control can have the following states styled:

- `default` - The base style.
- `activated` - Applied when the player is touching the knob and it exactly at the 0 value along the axis.
- `activatedDown` - Applied when the player is touching the knob and has moved the knob such that it is in the negative (lower) section of the throttle axis.
- `activatedUp` - Applied when the player is touching the knob and has moved the knob such that it is in the positive (upper) section of the throttle axis.
- `idle` - Applied when the player is NOT interacting with the control and the knob is also not `sticky` in the upper section of the axis.
- `idleUp` - Applied when the player is NOT interacting with the control and the knob has been moved to the upper section and `sticky` has been set to `true`.

**Styling properties per state**

`opacity` - _number_, _optional_. The opacity to be applied to the control. Default to 1.0 for all states but `disabled`.

[`axisUp`](../types/game-streaming-touch-throttle-axis.md) - _object_, _optional_. An [`axis`](../types/game-streaming-touch-throttle-axis.md) object that specifies the styling for the positive (upper) portion of the throttle.

[`axisDown`](../types/game-streaming-touch-throttle-axis.md) - _object_, _optional_. An [`axis`](../types/game-streaming-touch-throttle-axis.md) object that specifies the styling for the negative (lower) portion of the throttle.

[`knob`](../types/game-streaming-touch-knob.md) - _object_, _optional_. The [knob](../types/game-streaming-touch-knob.md) object specifies the styling of the knob portion of the throttle.

`indicator` - _object_, _optional_. A [stroke](../types/game-streaming-touch-stroke.md) that specifies the styling to apply ot the component connecting the knob to the current position on the axis.

**Asset dimensions**

For each of the style objects that accept image assets, they must be provided in five resolutions.

| Object          | @1.0x | @1.5x | @2.0x   | @3.0x   | @4.0x   |
| :-------------- | :---- | :---- | :------ | :------ | :------ |
| knob.faceImage  | 28x28 | 42x42 | 56x56   | 84x84   | 112x112 |
| knob.background | 60x60 | 90x90 | 120x120 | 180x180 | 240x240 |

## Remarks

The `throttle` control allows for the player to provide the variable pressure of a trigger using a touch control.

The `throttle` control is designed to be placed in the center spot of the wheel -- and to be the only control between that spot and the side of the screen.

Set `sticky` to true if the player will likely want to have a constant pressure applied to the trigger to allow them to set the value and then use their fingers for different actions.

**Styling remarks**

> [!WARNING]
> When streaming via the Windows version of the Content Test Application, not all styling will display correctly.

## Sample

#### Example 1: Basic throttle

**Figure 1. Throttle Control**
![User interacting with a throttle](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/touch-control-images/game-streaming-touch-control-images-throttle.gif)

This uses the default styling.

```JSON
{
    "type": "throttle",
    "axisUp": "rightTrigger",
    "axisDown": "leftTrigger",
    "sticky": true
}
```

#### Example 2: Throttle with styled outline and explicity defined icons

**Figure 1. Customized Throttle Control**
![User interacting with a customized throttle](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/touch-control-images/game-streaming-touch-control-images-throttle-customized.gif)

```JSON
{
    "type": "throttle",
    "axisUp": "rightTrigger",
    "axisDown": "leftTrigger",
    "sticky": true,
    "styles": {
        "default": {
            "knob" : {
                "faceImage" : {
                    "type": "icon",
                    "value": "gasPedal"
                }
            },
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
            "axisDown": {
                "stroke" : {
                    "type": "solid",
                    "color":  "#ff0000"
                },
                "cap" : {
                    "type": "color",
                    "value": "#ff0000"
                }
            }
        },
        "idleUp" : {
            "knob" : {
                "stroke" : {
                    "type": "solid",
                    "color":  "#107C10"
                }
            },
            "indicator" : {
                "type": "solid",
                "color":  "#107C10"
            }
        },
        "activatedUp" : {
            "indicator" : {
                "type": "solid",
                "color":  "#107C10"
            }
        },
        "activatedDown": {
            "knob" : {
                "faceImage" : {
                    "type": "icon",
                    "value": "brakePedal"
                }
            },
            "indicator" : {
                "type": "solid",
                "color":  "#ff0000"
            }
        }
    }
}
```

## Requirements

**Layout Version:** 1.0+ (Styling available from layout version 3.2+)
