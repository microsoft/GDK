---
author: shawnfa
title: Custom assets for Touch Adaptation Layouts
description: Customizing the look of your touch adaptation layouts by providing custom art for the touch controls
kindex: Touch Adaptation Kit custom assets
ms.author: shawnfa
ms.prod: xbox
ms.technology: gdk
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# Custom assets for Touch Adaptation Layouts

Providing semantic icons on the controls in your touch adaptation layouts is an effective way to communicate to players of your game what each of the controls are meant to do. While players familiar with an Xbox controller will quickly understand the common A, B, X, Y buttons, other players may find it easier to understand your touch controls if they show the actions that those controls will trigger. For instance, instead of having a button with the Xbox A on it, a button with an image of a person jumping can help players understand what action each control will perform.

While you can select from a built-in set of [icons](../../../../reference/system/touchadaptationkit/types/game-streaming-touch-icon.md) for your controls, you can also customize them with artwork that matches the visual aesthetic of your game. Doing this allows your game’s touch controls to feel like a much more integral part of your game, and therefore makes the experience of playing your game feel more native to mobile.

For example, here is a layout which was built using standard icons:

![Touch layout using semantic icons](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/game-streaming-tak-custom-assets-icons.png)

And here is the same layout using custom artwork:

![Touch layout with custom art](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/game-streaming-tak-custom-assets-assets.png)

When this layout is loaded over its game, the custom artwork helps to tie the visual style of the touch controls to the visual style of the game.

![Touch layout with custom art in-game](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/game-streaming-tak-custom-assets-game.png)

<a id="asset-files"></a>

## Asset Files

Assets are PNG files, which are required to be provided at a base resolution and at 1.5x, 2.0x, 3.0x, and 4.0x scales of that base resolution. This allows the game streaming app to select the best version of your asset to display based upon the DPI of the device that the game is being streamed on. The base resolution for each asset type is listed [below](#custom-asset-sizes).

The touch adaptation kit supports [localization of assets](../game-streaming-tak-localization.md), which enables you to provide different assets depending upon the language of the device that your game is being streamed to. Each localized version of an asset must include all the required resolutions.

<a id="directory-structure"></a>

When laying out your assets on disk, the file structure is organized first by [language](../game-streaming-tak-localization.md) and then by asset scale. So for example, your file structure might look something like this:

```
assets/
    neutral/
        @1.0x/
            JoystickBackground.png
            JoystickKnobBackground.png
            JoystickKnobForeground.png
        @1.5x/
            JoystickBackground.png
            JoystickKnobBackground.png
            JoystickKnobForeground.png
        @2.0x/
            JoystickBackground.png
            JoystickKnobBackground.png
            JoystickKnobForeground.png
        @3.0x/
            JoystickBackground.png
            JoystickKnobBackground.png
            JoystickKnobForeground.png
        @4.0x/
            JoystickBackground.png
            JoystickKnobBackground.png
            JoystickKnobForeground.png
    fr/
        fr-CA/
            @1.0x/
                JoystickKnobForeground.png
            @1.5x/
                JoystickKnobForeground.png
            @2.0x/
                JoystickKnobForeground.png
            @3.0x/
                JoystickKnobForeground.png
            @4.0x/
                JoystickKnobForeground.png
        @1.0x/
            JoystickKnobBackground.png
        @1.5x/
            JoystickKnobBackground.png
        @2.0x/
            JoystickKnobBackground.png
        @3.0x/
            JoystickKnobBackground.png
        @4.0x/
            JoystickKnobBackground.png
```

In this setup, Canadian French would use a `fr-CA` `JoystickKnobForeground` asset, the `fr` `JoystickKnobBackground` asset, and the `netural` `JoystickBackground` asset. France French would use the `fr` asset for both `JoystickKnobForeground` and `JoystickKnobBackground`, and the `neutral` asset for `JoystickBackground`. All other languages would use `neutral` assets for everything.

<a id="referencing-assets-from-layouts"></a>

## Referencing Assets From Layouts

Assets are referenced from within the style section of the control that the asset is being applied to. In order to reference the asset, the type of the item being styled should be “asset” and the value should be the name of the asset file without the PNG extension. For example, a joystick styled with the assets from above might be configured like this:

```json
{
  "type": "joystick",
  "styles": {
    "default": {
      "background": {
        "type": "asset",
        "value": "JoystickBackground"
      },
      "knob": {
        "faceImage": {
          "type": "asset",
          "value": "JoystickKnobForeground"
        },
        "background": {
          "type": "asset",
          "value": "JoystickKnobBackground"
        }
      }
    }
  }
}
```

Given this style, for each of the three assets being used for the joystick, the touch adaptation kit will use the language and DPI of the player’s device to find the best matching asset for the layout to use. Therefore, the layout does not specify either a language or an asset scale to use, as the touch adaptation kit will automatically find the best matching asset.

<a id="using-assets-with-variable-replacement">

### Using Assets with Variable Replacement

It is also possible to change the asset being used by a layout at runtime using the [XGameStreamingUpdateTouchControlsStateOnClient](../../../../reference/system/xgamestreaming/functions/xgamestreamingupdatetouchcontrolsstateonclient.md) API. In order to do this, the list of potential assets for the control must be defined in the `context.json` file for your touch adaptation bundle.

context.json:

```json
{
    "$schema": "https://raw.githubusercontent.com/microsoft/xbox-game-streaming-tools/master/touch-adaptation-kit/schemas/context/v3.3/context.json",
    "definitions": {
      "potionButtonImages": [
        "Empty",
        "Healing",
        "Invisibility",
        "Mana"
      ]
    },
    "state": {
      "potionButtonFaceImage": "Empty"
    },
    "allowedStateValues": {
      "potionButtonFaceImage": {
        "$ref": "#/definitions/potionButtonImages"
      }
    }
  }
}
```

This sets up the context for the bundle to allow any of `Empty.png`, `Healing.png`, `Invisibility.png`, or `Mana.png` to be used for the potion button image in a layout. The currently selected image is stored in the state variable `potionButtonFaceImage`. The button itself would be configured with a reference to this context:

layout.json:

```json
{
  "type": "button",
  "styles": {
    "default": {
      "faceImage": {
        "type": "asset",
        "value": {
          "$ref": "../../context.json#/state/potionButtonFaceImage"
        }
      }
    }
  }
}
```

This tells the button to use whatever asset is currently stored in the context’s potionButtonFaceImage state variable as its face image.

Finally, when the game wants to change which image is currently displayed on this button, it would use code such as:

```c++
HRESULT ChangePotion(XGameStreamingClientId client, const char* potionName)
{
    XGameStreamingTouchControlsStateOperation updateOperations[1] = {};
    updateOperations[0].operationKind = XGameStreamingTouchControlsStateOperationKind::Replace;
    updateOperations[0].path = "/potionButtonFaceImage";
    updateOperations[0].value.valueKind = XGameStreamingTouchControlsStateValueKind::String;

    // potionName is one of "Empty", "Healing", "Invisibility", "Mana"
    updateOperations[0].value.stringValue = potionName;

    return XGameStreamingUpdateTouchControlsStateOnClient(client, _countof(updateOperations), updateOperations);
}
```

This code changes the name of the asset stored in the potionButtonFaceImage state variable, which will then cause the newly selected asset to appear in any layout which is referencing this state in its styles.

<a id="custom-asset-sizes"></a>

## Custom Asset Sizes

The following table summarizes the elements on each control which can have a custom asset applied, and what the pixel sizes are for the 1.0x scale of each asset.

| **Control**    | **Styleable Element** | **@1.0x Pixel Size** |
| -------------- | --------------------- | -------------------- |
| ArcadeButton   | background            | 60 x 60              |
|                | faceImage             | 28 x 28              |
| Button         | background            | 60 x 60              |
|                | faceImage             | 28 x 28              |
| DirectionalPad | background            | 60 x 60              |
| Joystick       | background            | 120 x 120            |
|                | knob/background       | 60 x 60              |
|                | knob/faceImage        | 28 x 28              |
| Throttle       | knob/background       | 60 x 60              |
|                | knob/faceImage        | 28 x 28              |


Pixel sizes for ArcadeButton faceImage, Button faceImage, Joystick knob faceImage, and Throttle knob faceImage assets are:

| **Scale** | **Pixel Size**   |
| --------- | ---------------- |
| @1.0x     | 28 x 28          |
| @1.5x     | 42 x 42          |
| @2.0x     | 56 x 56          |
| @3.0x     | 84 x 84          |
| @4.0x     | 112 x 112        |

Pixel sizes for ArcadeButton background, Button background, DirectonalPad background, Joystick knob background, and Throttle knob background assets are:

| **Scale** | **Pixel Size**   |
| --------- | ---------------- |
| @1.0x     | 60 x 60          |
| @1.5x     | 90 x 90          |
| @2.0x     | 120 x 120        |
| @3.0x     | 180 x 180        |
| @4.0x     | 240 x 240        |

Pixel sizes for Joysitck background assets are:

| **Scale** | **Pixel Size**   |
| --------- | ---------------- |
| @1.0x     | 120 x 120        |
| @1.5x     | 180 x 180        |
| @2.0x     | 240 x 240        |
| @3.0x     | 360 x 360        |
| @4.0x     | 480 x 480        |

<a id="image-quantization"></a>

## Image Quantization

When building a touch adaptation bundle, the [TAK CLI](../game-streaming-tak-command-line.md) will perform quantization on the provided PNGs in order to reduce the size of the produced .takx file. While the quantization should not affect the appearance of the assets, it is still a good idea to verify that the assets as they appear in a touch layout match what you believed they would look like when creating the images.

If the quantization process is affecting the way your images are rendering, it may be disabled by passing the `--no-asset-optimization ` option to the TAK CLI when building your bundle.
