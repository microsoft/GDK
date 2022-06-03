---
author: arikcohen
title: Button
description: Button control
kindex: Touch Adaptation Kit controls, button
edited: 00/00/0000
ms.author: arikc
ms.topic: reference
ms.prod: gaming
ms.date: 12/20/2020
security: public
---

# Button

A basic control that can respond to player touch input. Can be styled to have custom artwork for both the background & face image.

## Properties

`type` - _"button"_. Specifies the control type.

`action` - _string_. [Action(s)](../types/game-streaming-touch-action.md) to be invoked when a player touches the button.

`enabled` - _boolean_, _optional_. Defaults to `true`. Sets the visual state of the control to enabled/disabled. A disabled control will still receive input from the player, but NOT change the visual style based on the input.

`pullAction` - _string_. [Action(s)](../types/game-streaming-touch-action.md) to be invoked when a player pulls the button during a touch.

`toggle` - _boolean_, _optional_. Defaults to `false`.

- If `false`, input for the button will be sent when pressed and not when not pressed.
- If `true`, each press of the button will switch whether input is being sent or not for the correspondinging action(s) .

`visible` - _boolean_, _optional_. Defaults to `true`. Determines whether the control is displayed to the player to interact with. To change during game play see [Changing touch layouts using game state](../../../../system/overviews/game-streaming/building-touch-layouts/game-streaming-touch-changing-layouts-game-state.md#change_state).

`styles` - _object_, _optional_. Customization of the visual representation of the control. The styles are represented as an object per state that can be styled.

The button control can have the following states styled:

- `default` - The base style.
- `disabled` - The style when the control is disabled. If not specfied, then when the control is disabled, a transformation will be applied to the default style to make it appear disabled.
- `idle` - Applied when the player is NOT interacting with the control.
- `activated` - Applied when the player is touching the button.
- `pulled` - Applied when the player is touching and pulling a button.
- `toggled` - Applied when the button is in a toggled state and the player is not touching the button.

**Styling properties per state**

`opacity` - _number_, _optional_. The opacity to be applied to the control. Default to 1.0 for all states but `disabled`.

`faceImage` - _object_, _optional_. Can either be an [icon](../types/game-streaming-touch-icon.md) or [image asset](../types/game-streaming-touch-asset.md).

`background` - _object_, _optional_. Can either be a [color](../types/game-streaming-touch-color.md) or [image asset](../types/game-streaming-touch-asset.md). Is not visible in idle and disabled states.

**Asset dimensions**

For each of the style objects that accept image assets, they must be provided in five resolutions.

| Object     | @1.0x | @1.5x | @2.0x   | @3.0x   | @4.0x   |
| :--------- | :---- | :---- | :------ | :------ | :------ |
| faceImage  | 28x28 | 42x42 | 56x56   | 84x84   | 112x112 |
| background | 60x60 | 90x90 | 120x120 | 180x180 | 240x240 |

## Remarks

Buttons are commonly used to allow the player to perform actions that would normally be done by one or more physical buttons on their physical controller.

Utilize multiple actions to enable the player to easily replicate combination actions (e.g. press the left and right bumper simultaneously).

**Styling remarks**

When in the `activated` state, the `faceImage` is displayed 25% smaller.

There are labels and default styling for the background color for buttons that do not use custom assets and have a single action of `gamepadX`, `gamepadY`, `gamepadA`, or `gamepadB`.

## Samples

#### Example 1: Jump button mapped to the A button

![User pressing a button](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/touch-control-images/game-streaming-touch-control-images-button.gif)

```JSON
{
    "type": "button",
    "action": "gamepadA",
    "styles": {
        "default": {
            "faceImage": {
                "type": "icon",
                "value": "jump"
            }
        }
    }
}
```

#### Example 2: Crouch button mapped to pressing the left and right bumpers simultaneously

![User pressing a button mapped to two actions](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/touch-control-images/game-streaming-touch-control-images-button-2.gif)

```JSON
{
    "type": "button",
    "action": [ "leftBumper", "rightBumper"] ,
    "styles": {
        "default": {
            "faceImage": {
                "type": "icon",
                "value": "crouch"
            }
        }
    }
}
```

#### Example 3: Button with custom faceImage and background image

![User pressing a button with a custom asset](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/touch-control-images/game-streaming-touch-control-images-button-3.gif)

```JSON
{
    "type": "button",
    "action": "gamepadA",
    "enabled" : true,
    "styles": {
        "default": {
            "background": {
                "type": "asset",
                "value": "hex_background"
            },
            "faceImage": {
                "type": "asset",
                "value": "one"
            }
        },
        "activated": {
            "background": {
                "type": "asset",
                "value": "hex_background_glow"
            }
        }
    }
}
```

## Requirements

**Minimum Layout Version:** 1.0+ (Styling support in 2.0+).

## See also

[Touch Adaptation Kit Reference](../../../../system/overviews/game-streaming/game-streaming-touch-touch-adaptation-kit-overview.md)
