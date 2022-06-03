---
title: Getting started with sample layouts
description: Where to get sample layouts.
kindex:
- Getting started with sample layouts
- sample layouts, getting started
author: arikcohen
ms.author: arikc
ms.prod: gaming
ms.topic: conceptual
ms.date: 1/12/2021
security: public
---

# Getting Started With Sample Layouts

When starting to build a set of touch layouts for your game, you may want to start from a known set of sample layouts.

## Getting Sample Touch Adaptation Bundles

Download the [sample-layouts.takx](https://github.com/microsoft/xbox-game-streaming-tools/raw/master/touch-adaptation-kit/samples/sample-layouts/sample-layouts.takx) bundle from the [xbox-game-streaming-tools](https://github.com/microsoft/xbox-game-streaming-tools) repository.

This bundle includes layouts for common game patterns:

- [Full Xbox control layout](game-streaming-touch-tak-sample-full-layout.md)
- [Layouts for 2D platformer games](game-streaming-touch-tak-sample-platformer.md)
- [Driving control layout](game-streaming-touch-tak-sample-driving.md)
- [Fighting arcade control layout](game-streaming-touch-tak-sample-fighter.md)
- [First person shooter control layout](game-streaming-touch-tak-sample-first-person.md)

## Unpacking A Touch Adaptation Bundle

After downloading layouts, you'll want to use the Touch adaptation Kit command line tool (tak.exe) to [unpack](../../game-streaming-tak-command-line.md#unpack-command) the bundle into the associated layouts that can be modified for your game.

```
C:\Program Files (x86)\Microsoft GDK\bin>tak unpack --tab-file C:\Downloads\sample-layouts.takx --output-path C:\MyGame
Writing touch adaptation bundle contents to 'C:\MyGame'.

```

## See the layouts

You now have a set of layouts to use when [deploying your touch control layouts](../game-streaming-touch-deploying-touch-layout.md).
