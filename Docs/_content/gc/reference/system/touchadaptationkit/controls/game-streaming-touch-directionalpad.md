---
author: arikcohen
title: Directional pad
description: Directional pad control
kindex: Touch Adaptation Kit controls, directional pad
edited: 00/00/0000
ms.author: migonz
ms.topic: reference
ms.prod: gaming
ms.date: '09/24/2020'
security: public
---

# Directional Pad

A directional pad control that always maps the gamepad directional pad.

## Properties

`type` - _"directionalPad"_. Specifies the control type.

`scale` - _number_, _optional_. Default is 1. Size multiplier, useful since directional pads are placed like buttons and don't scale like joysticks automatically.

`deadzone` - _number_, _optional_. A value between 0 and 1 that specifies the size of the deadzone as a percentage of the control. Note that unlike [deadzone](../types/game-streaming-touch-deadzone.md) for joysticks, directional pad deadzones are always axial (square).

`enabled` - _boolean_, _optional_. Defaults to `true`. Sets the visual state of the control to enabled/disabled. A disabled control will still receive input from the player, but NOT change the visual style based on the input.

`visible` - _boolean_, _optional_. Defaults to `true`. Determines whether the control is displayed to the player to interact with. To change during game play see [Changing touch layouts using game state](../../../../system/overviews/game-streaming/building-touch-layouts/game-streaming-touch-changing-layouts-game-state.md#change_state).

`styles` - _object_, _optional_. Customization of the visual representation of the control. The styles are represented as an object per state that can be styled.

`interaction` - _object_, _optional_. Property definitions that can alter the interaction mechanisms of the user with the control

**Interaction**

`activationType` - _string_, _optional_. Defines the type of activation that is allowed for any given direction on the directional pad interaction. Defaults to `allowNeighboring`. When set to `exclusive`, only a single direction can be activated on the directional pad at a time (i.e., only one of 'Up', 'Right', 'Down', or 'Left'). When set to `allowNeighboring`, a direction and either of its neighboring directions can be simultaneously activated by tapping between them (i.e., the user can activate 'Up+Right', 'Right+Down', 'Down+Left', or 'Left+Up' by tapping between each of them, in addition to the ability to activate each individual direction).

**States and Styling properties**

The directional pad control can have the following states styled:

- `default` - The base style.
- `disabled` - The style when the control is disabled. If not specfied, then when the control is disabled, a transformation will be applied to the default style to make it appear disabled.
- `idle` - Applied when the player is NOT interacting with the control.
- `activated` - Applied when the player is touching the button.

The following properties can be used to style the directional pad control:

`opacity` - _number_, _optional_. The opacity to be applied to the control. Default to 1.0 for all states but `disabled`.

`fill` - _object_, _optional_. An object with a color defined for the gradient to be used when the direction pad is activated.

`gradient` - _object_, _optional_. An object with a color defined for the gradient to be used when the direction pad is activated.

`background` - _object_, _optional_. Can either be a [color](../types/game-streaming-touch-color.md) or [image asset](../types/game-streaming-touch-asset.md).

`stroke` - _object_, _optional_. Color to be used on the outline of the directional pad. Must be a [stroke](../types/game-streaming-touch-stroke.md) object.

**Asset dimensions**

For each of the style objects that accept image assets, they must be provided in five resolutions.

| Object     | @1.0x | @1.5x | @2.0x   | @3.0x   | @4.0x   |
| :--------- | :---- | :---- | :------ | :------ | :------ |
| background | 60x60 | 90x90 | 120x120 | 180x180 | 240x240 |

## Remarks

The directional pad is used to provide an experience similar to the directional pad on the physical controller.

If this is being used as the primary movement mechanism for the player (normally in the `left` `inner` slot), it is recommended to use a scale of 2.

**Styling remarks**

If using a custom image asset for the `background`, the dimensions referenced are for scale=1.0. If using a different scale, apply that scale to the image assets including in the touch adaptation bundle.

> [!WARNING]
> When streaming via the Windows version of the Content Test Application, not all styling will display correctly.

## Samples

#### Example 1: Default directional pad

**Figure 1. Directional Pad**
![User interacting with a directional pad](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/touch-control-images/game-streaming-touch-control-images-directional-pad.gif)

```
{
    "type": "directionalPad",
    "scale": 1.0
}
```

#### Example 2: Larger directional pad with customized colors.

**Figure 1. Customized Directional Pad**
![User interacting with a customized directional pad](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/touch-control-images/game-streaming-touch-control-images-directional-pad-2.gif)

```
{
    "type": "directionalPad" ,
    "scale": 2.0,
    "styles" : {
        "default" : {
            "fill" : "#0e7a0d10",
            "gradient" : {
                "color": "#0e7a0d10"
            },
            "stroke" : {
                "type": "solid",
                "color" : "#0e7a0dff"
            }
        }
    }
}
```

## Requirements

**Layout Version:** 1.0+, (Styling support in 3.0+, Interaction support in 3.4+).
