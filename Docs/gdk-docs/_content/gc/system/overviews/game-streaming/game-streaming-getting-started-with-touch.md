---
title: Getting started with touch
description: Describes the basic steps for getting started with touch.
author: M-Stahl
ms.author: arikc
kindex: Getting started with touch
ms.topic: conceptual
edited: 12/31/2020
security: public
---

# Getting started with touch

This topic covers how to configure touchscreen controls for your Xbox Game Streaming title.

You can make your game playable without an attached controller. Touchscreen controls increase the number of users who are playing your game, increase engagement for mobile users, and provides users an intuitive experience for their device.

There are two avenues for bringing touch input to your game:

- **Touch adapted controls**. The streaming client can overlay touch controls over the game. You can provide custom layouts that optimize the controls for your game and change to different layouts for different parts of the game.
- **Native touch**. You can support touch directly for areas of your game that would respond to standard touch interactions more naturally than controller interactions. Examples where this is commonly desired include menus, inventory management and map interactions.

By default, touch input is _only_ enabled for users using compatible devices that stream your game via the Content Test Application (CTA). Contact your Microsoft account manager to enable touch input for your retail game.

For more information about the CTA, see [Windows PC Content Test Application (CTA)](game-streaming-windows-pc-content-test-application.md) and [Android Content Test Application (CTA)](game-streaming-android-content-test-application.md).

## Touch-adapted layouts

You can take the following actions by using the [Touch Adaptation Kit (TAK)](game-streaming-touch-touch-adaptation-kit-overview.md).

- [Create](building-touch-layouts/game-streaming-touch-building-touch-layout.md) custom touch-adapted layouts.
- [Deploy](building-touch-layouts/game-streaming-touch-publishing-layouts.md) custom touch-adapted layouts to your device.
- Use the [Cloud Aware touch adaptation APIs](../../../reference/system/xgamestreaming/xgamestreaming_members.md#TouchAdaptation) to control the display of your control layouts.

The touch-adapted layouts are _only_ visible to users that aren't using a physical controller. When a controller is connected to the client device, the touch controls are hidden.

Your game can have a similar touch-adapted layout as shown in the following screenshot.

![Screenshot of touchscreen controls in a 2D platformer title](../../../../../resources/gamecore/secure/images/en-us/game-streaming/game-streaming-tak-layout-platformer.png)

## Support native touch

Supporting native touch is similar to supporting mouse or other input in your game. Touch events will be represented [IGameInputReading](../../../reference/input/gameinput/interfaces/igameinputreading/igameinputreading.md) with an [XInputKind](../../../reference/input/gameinput/enums/gameinputkind.md) that has the value of `GameInputKindTouch`.

## See also

[Introduction to Xbox Game Streaming](game-streaming-overview.md)
