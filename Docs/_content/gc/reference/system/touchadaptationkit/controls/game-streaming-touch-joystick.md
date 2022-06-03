---
author: arikcohen
title: Joystick
description: Joystick control
kindex: Touch Adaptation Kit controls, joystick
edited: 00/00/0000
ms.author: arikc
ms.topic: reference
ms.prod: gaming
ms.date: 12/20/2020
security: public
---

# Joystick

An analog control that behaves like a joystick.

## Properties

`type` - "joystick"

`axis` - _object_ or _array_. A single [axis](../types/game-streaming-touch-axis.md) or array of [axes](../types/game-streaming-touch-axis.md) that describe the mapping of this joystick control.

`action` - _object_, _optional_. An [action(s)](../types/game-streaming-touch-action.md) to invoke in addition to the axis mapping.

`actionThreshold` - _number_, _optional_.Normalized minimum joystick value (radial) required to invoke the action. Default value of 0.

`enabled` - _boolean_, _optional_. Defaults to `true`. Sets the visual state of the control to enabled/disabled. A disabled control will still receive input from the player, but NOT change the visual style based on the input.

`expand` - _boolean_, _optional_. Default value of `true`. Expand joystick range to match user ergonomic preferences when placed in a center control socket. Set to false to use a standardized fixed joystick size.

`relative` - _boolean_, _optional_.
By default (`true`), the joystick will calculate its value using a relative calculation based on user's initial touch. Setting this value to `false` will instead calculate its value based on the center point of the control.

`visible` - _boolean_, _optional_. Defaults to `true`. Determines whether the control is displayed to the player to interact with. To change during game play see [Changing touch layouts using game state](../../../../system/overviews/game-streaming/building-touch-layouts/game-streaming-touch-changing-layouts-game-state.md#change_state).

`styles` - _object_, _optional_. Customization of the visual representation of the control. The styles are represented as an object per state that can be styled.

The button control can have the following states styled:

- `default` - The base style.
- `disabled` - The style when the control is disabled. If not specfied, then when the control is disabled, a transformation will be applied to the default style to make it appear disabled.
- `idle` - Applied when the player is NOT interacting with the control.
- `moving` - Applied when the when the joystick knob is being interacted withregardless of the deadzone defined.
- `activated` - Applied when an `action` is defined and the knob is moved outside the threshold to execute the action.

**Styling properties per state**

`opacity` - _number_, _optional_. The opacity to be applied to the control. Default to 1.0 for all states but `disabled`.

`background` - _object_, _optional_. Can either be a [color](../types/game-streaming-touch-color.md) or [image asset](../types/game-streaming-touch-asset.md).

[`knob`](../types/game-streaming-touch-knob.md) - _object_, _optional_. The [knob](../types/game-streaming-touch-knob.md) object specifies the styling for the button-like portion of the joystick that can be interacted with by the player.

[`outline`](../types/game-streaming-touch-joystick-outline.md) - _object_, _optional_. The [outline](../types/game-streaming-touch-joystick-outline.md) object specifies the styling of the outline and indicator that are presented when the joystick is being interacted with.

**Asset dimensions**

For each of the style objects that accept image assets, they must be provided in five resolutions.

| Object          | @1.0x   | @1.5x | @2.0x   | @3.0x   | @4.0x   |
| :-------------- | :------ | :---- | :------ | :------ | :------ |
| background      | 120x120 | 90x90 | 240x240 | 360x360 | 480x480 |
| knob.faceImage  | 28x28   | 42x42 | 56x56   | 84x84   | 112x112 |
| knob.background | 60x60   | 90x90 | 120x120 | 180x180 | 240x240 |

## Remarks

The `joystick` control can be used to provide analog control that maps to the different physical controller joysticks.

If the `joystick` is the main method of movement, it is recommended to play in the left center slot and set `expand` to true to provide the best experience for the player.

Consider customizing the `faceImage` to provide a hint to the player around what the joystick will control (this is especially important if your game utilizes more than one joystick).

For motions that only rely on 1 axis, utilize a single axis joystick to maximize playability.

**Styling remarks**

If using a `background` asset and `expand` is true, the `background` asset will NOT be scaled to the full center socket size.

By default, the `outline` is only displayed while the player is interacting with the control.

If using a custom `background` asset and `expand` is set to `true`, note that the asset will NOT expand with the player's control customization.

> [!WARNING]
> When streaming via the Windows version of the Content Test Application, not all styling will display correctly.

## Samples

#### Example 1: Simple joystick

A basic 1:1 mapping to a joystick with a slight deadzone. Thumbsticks on the physical controller calculate their value via rotation.

**Figure 1. Joystick Control**
![User interacting with a joystick](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/touch-control-images/game-streaming-touch-control-images-joystick.gif)

```JSON
{

    "type": "joystick",
    "axis": {
        "input": "axisXY",
        "output": "leftJoystick",
        "deadzone": {
            "threshold": 0.05,
            "radial": true
        }
    }
}
```

#### Example 2: Joystick that switches from walk to sprint when threshold is passed.

When the threshold (0.75) is passed, the leftTrigger will be sent along with the joystick movement. The icon will change from the 'walk' to 'sprint'

**Figure 1. Joystick Control with Action Threshold**
![User interacting with a joystick that has an action threshold](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/touch-control-images/game-streaming-touch-control-images-joystick-with-threshold-action.gif)

```JSON
{
    "type": "joystick",
    "action": "leftTrigger",
    "actionThreshold":0.75,
    "axis": {
        "input": "axisXY",
        "output": "leftJoystick",
        "deadzone": {
            "threshold": 0.05,
            "radial": true
        }
    },
    "styles": {
        "default": {
            "knob": {
                "faceImage": {
                    "type": "icon",
                    "value": "walk"
                }
            }
        },
        "activated": {
            "knob": {
                "faceImage": {
                    "type": "icon",
                    "value": "sprint"
                },
                "background" : {
                    "type": "color",
                    "value": "#0e7a0d"
                }
            }
        }
    }
}

```

#### Example 3: Single-axis (horizontal) joystick that looks like a steering wheel

**Figure 1. Horizontal Steering Wheel Joystick Control**
![User interacting with a horizontal steering wheel joystick](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/touch-control-images/game-streaming-touch-control-images-joystick-driving.gif)

```JSON
{
    "type": "joystick",
    "axis": {
        "input": "axisX",
        "output": "leftJoystickX",
        "deadzone": {
            "threshold": 0.35
        }
    },
    "relative": false,
    "styles": {
        "default": {
            "knob": {
                "faceImage": {
                    "type": "icon",
                    "value": "steering"
                }
            }
        }
    }
}
```

#### Example 4: Joystick with customized colors

**Figure 1. Customized Joystick Control**
![User interacting with a joystick](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/touch-control-images/game-streaming-touch-control-images-joystick-customized-colors.gif)

```JSON
{

    "type": "joystick",
    "axis": {
        "input": "axisXY",
        "output": "leftJoystick",
        "deadzone": {
            "threshold": 0.05,
            "radial": true
        }
    },
    "styles": {
        "default": {
            "outline" : {
                "stroke" : {
                    "type": "solid",
                    "color": "#107C10"
                }
            }
        }
    }
}
```

## Requirements

**Layout Version:** 1.0+ (Styling capabilities from layout version 3.0+)

## See also

[Touch Adaptation Kit Reference](../../../../system/overviews/game-streaming/game-streaming-touch-touch-adaptation-kit-overview.md)
