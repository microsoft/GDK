---
title: Touch Adaption Kit - Touch Adaptation Bundle
description: Touch Adaption Kit - Touch Adaptation Bundle.
author: arikcohen
kindex: Touch Adaptation Bundle
edited: 00/00/0000
ms.author: arikc
ms.prod: gaming
ms.date: 1/11/2021
ms.topic: conceptual
security: public
---

# Touch Adaption Kit - Touch Adaptation Bundle

A touch adaptation bundle, or TAB for short, is a self-contained set of content, used to play the game in a variety of regions across a variety of devices and form factors.

The bundle consists of:

- [Layouts](#layouts): JSON representations of a touch control layout that can be presented to the player.
- [Assets](#assets): PNG images that can be used to customize the look of the touch controls.
- [Context and state](#context): Shared context that can be utilized across layouts and affect the presentation of a particular layout.
- [Configuration](#configuration): Set of metadata around the bundle including versioning and default layouts.

<a id="layouts"></a>

## Layouts

Each TAB contains all the layouts necessary to play the game with touch controls. A layouts directory includes each of the individual layouts that the game may reference. The layout name to use in [XGameStreaming layout related APIs](../../../reference/system/xgamestreaming/xgamestreaming_members.md#TouchAdaptation) is determined by the file name of the layout without its extension.

Each [layout](../../../reference/system/touchadaptationkit/layout/game-streaming-touch-layout.md) is a JSON representation of a specific set of touch controls that can be displayed to the player.

Layout files are selected for using the algorithm described in Localization Support.

**Example 1: Same layouts in all locales**  
In this example there are two layouts that are available in all locales.

```
/
layouts/
    neutral/
        menu.json
        driving.json
```

**Example 2: Some layouts customized in a specific locale**  
In this example there are two layouts: driving and menu. The menu layout is common for all languages, but the driving layout is custom for United Kingdom.

```
/
layouts/
    en/
        en-GB/
            driving.json
    neutral/
        menu.json
        driving.json
```

<a id="assets"></a>

## Assets

Assets are a set of PNG images that can be utilized to customize the look of individual touch controls. Images are provided at different resolutions to enable the best experience on the player's specific device.

For each image, it must be provided at the following multiples of resolution: 1.0, 1.5, 2.0, 3.0, 4.0.

The dimensions required of each image is based on where it is used and can be found in the styling remarks of each control.

Layout files are selected for using the algorithm described in Localization Support.

For example, if you have two custom images that are available for all locales:

```
/
assets/
    neutral/
        @1.0x/
            customImage1.png
            customImage2.png
        @1.5x/
            customImage1.png
            customImage2.png
        @2.0x/
            customImage1.png
            customImage2.png
        @3.0x/
            customImage1.png
            customImage2.png
        @4.0x/
            customImage1.png
            customImage2.png
```

### Asset Optimization

By default, when using [tak.exe](game-streaming-tak-command-line.md) to `pack` or `serve` a set of assets, the assets will be optimized to reduce size of the assets that will be distributed to the players' device.

If you do NOT want asset optimization, please use the `--no-asset-optimization` option to preserve the PNG images without modification.

<a id="context"></a>

## Context and state

A `context` JSON file can be included in a bundle that includes:

- `definitions`: Definitions of static variables that can be utilized in all layouts in the bundle.
- `state`: Definition of state variables (and initial state) that can be utilized in all layouts in the bundle. The state variables can have their data changed dynamically at runtime by the game.
- `allowedStateValues`: Contains allowed state values for a given state, such as allowed asset names for a given asset.

A sample `context.json` file that has definitions for defaultDeadzone, named action mappings and state for enabled state for various elements and a set of allowed asset values for the weapons.

```JSON
{
    "$schema": "https://raw.githubusercontent.com/microsoft/xbox-game-streaming-tools/master/touch-adaptation-kit/schemas/context/v3.0/context.json",
    "definitions": {
        "defaultMovementDeadzone": 0.1,
        "jumpAction": "gamepadA",
        "fireAction": "rightTrigger",
        "reloadAction": "leftBumper"
    },
    "state": {
        "enableReload": false,
        "switchWeaponVisible": false,
        "fireWeaponImage": "defaultWeapon"
    },
    "allowedStateValues": {
        "fireWeaponImage": [
            "defaultWeapon",
            "fist",
            "knife",
            "bow",
            "grenade"
        ]
    }
}
```

## Configuration

There are a set of configuration options for the bundle that can be set using [tak.exe](game-streaming-tak-command-line.md) when you `pack` or `serve` your bundle:

- Default layout: The layout that should be presented to the player at the start of their session if the [game has not changed the layout](building-touch-layouts/game-streaming-touch-changing-layouts-game-state.md#change_layout) via API call.
- Version: The content version of the bundle (Example: 1.0.0.0). Each version that is submitted to the xCloud service must be a unique content version.
- Version name: The name of the content version of the bundle (Example: DLC1). The version name can be used to group multiple versions that have the same semantic meaning for the game.

<a id="localization"></a>

## Localization Support

Since a game may support multiple languages, the content of the TAB is subdivided into directories using the IETF language tag for the content in that directory. All bundles **MUST** have neutral layouts, which go into a directory named neutral. The language that is used for loading TAB contents is determined based on user's region configured on Xbox Live.

When probing for files within the TAB, the application look for the most specific language and fall back to less specific directories until a matching file is found. For example:

```
/
layouts/
    en/
        en-GB/
            driving.json
        driving.json
    neutral/
        menu.json
        driving.json
```

In this structure, when looking for an en-GB set of content, the following layouts are selected:

```
en/en-GB/driving.json
neutral/menu.json
```

Similarly, en-US will select:

```
en/driving.json
neutral/menu.json
```

And a language such as fr-CA would select all layouts from the neutral directory.
