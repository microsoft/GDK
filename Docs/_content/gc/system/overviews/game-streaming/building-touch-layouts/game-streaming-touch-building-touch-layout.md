---
title: Building touch control layouts
description: Steps for creating initial touch control layouts.
kindex: Building touch control layouts
author: arikcohen
ms.author: arikc
ms.prod: gaming
ms.topic: conceptual
ms.date: 1/05/2021
security: public
---

# Building Touch Control Layouts

Building your touch control layouts consists of creating a [touch adaptation bundle](../game-streaming-touch-touch-adaptation-bundle.md) that includes:

- Layouts that are the JSON representation of the controls that you want available to your players
- Any custom images that are referenced by those layouts

<a id="SampleLayouts"></a>

## Sample Control Layouts

The [xbox-game-streaming-tools](https://github.com/microsoft/xbox-game-streaming-tools/tree/master/touch-adaptation-kit/touch-adaptation-bundles) repository has a set of sample layouts that can help you get started.

The [sample-layouts.takx](https://github.com/microsoft/xbox-game-streaming-tools/blob/master/touch-adaptation-kit/touch-adaptation-bundles/sample-layouts.takx) bundle includes layouts for common game patterns:

- [Full Xbox control layout](samples/game-streaming-touch-tak-sample-full-layout.md)
- [Layouts for 2D platformer games](samples/game-streaming-touch-tak-sample-platformer.md)
- [Driving control layout](samples/game-streaming-touch-tak-sample-driving.md)
- [Fighting arcade control layout](samples/game-streaming-touch-tak-sample-fighter.md)
- [First person shooter control layout](samples/game-streaming-touch-tak-sample-first-person.md)
