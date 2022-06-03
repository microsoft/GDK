---
title: Layout
description: The representation of a full touch layout for a game.
author: arikcohen
kindex: Touch Adaptation Kit layout, overview
edited: 00/00/0000
ms.author: arikc
ms.prod: gaming
ms.date: 12/20/2020
ms.topic: reference
security: public
---

# Layout

The representation of a full touch layout for a game.

## Properties

`center` - _object_, _optional_. [Wheel](game-streaming-touch-wheel.md) of controls that is displayed in the center of the screen.

`layers` - _object_, _optional_. A set of [layer](game-streaming-touch-layer.md) definitions that allow a set of controls to be displayed based on a [layer action](game-streaming-touch-layer-action.md).

`left` - _object_, _optional_. [Wheel](game-streaming-touch-wheel.md) of controls that is by default displayed under the player's left hand/thumb.

`lower` - _object_, _optional_. An object that lets you place controls in any of the three `leftCenter`, `center` or `rightCenter` slots in the lower row of controls.

`orientation` - _string_, _optional_. [Orientation](game-streaming-touch-layout-orientation.md) of the touch layout. Default is "landscape".

`right` - _object_, _optional_. [Wheel](game-streaming-touch-wheel.md) of controls that is by default displayed under the player's right hand/thumb.

`sensors` - _array_, _optional_. A list of [sensor controls](game-streaming-touch-touch-adaptation-kit-overview#sensor-controls) that should be enabled on this layout.

`upper` - _object_, _optional_. An object that lets you place an array of controls in `right` slots in the upper row of controls.

## Remarks

The available location for controls on a layout are:
![available sockets on a layout](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/touch-control-images/game-streaming-touch-control-images-layout.png)

The three slots in the top left corner are reserved for system use.

By convention, the `left` wheel is primarily used for movement and the `right` wheel for the most common actions.

![wheel locations](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/touch-control-images/game-streaming-touch-control-images-wheel.png)

Consider placing infrequently used tasks in the `upperRight` or the `lower` slots.

![locations for infrequent tasks](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/touch-control-images/game-streaming-touch-control-images-layout-infrequent-tasks.png)

> [!NOTE]
> The `center` wheel slot is not positioned well ergonomically for landscape usage. Should only be used when `orientation` is portrait for phones.
>
> The `orientation` only affects the touch layouts being displayed. Using something other than the default of `landscape` should only be done if the game is making an explicit change in rendering to match the layout's orientation.

## Samples

## Requirements

The version of the layout is specified by the `$schema` attribute in the layout json file. This specifies the specific set of controls and capabilities that are available in the layout.

The properties described here are valid for layout versions 3.0-3.2.

## See Also

[Touch Adaptation Kit Reference](../../../../system/overviews/game-streaming/game-streaming-touch-touch-adaptation-kit-overview.md)  
[Getting started with sample layouts](../../../../system/overviews/game-streaming/building-touch-layouts/samples/game-streaming-touch-getting-started-with-sample-layouts.md)
