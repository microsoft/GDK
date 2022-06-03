---
title: Simulating latency while testing your game
description: Describes how to simulate latency while testing your game by using the `xbstress` tool.
author: M-Stahl
ms.author: arikc
ms.topic: conceptual
kindex: Simulating latency while testing your game
edited: 12/31/2020
security: public
---

# Simulating latency while testing your game

The [xbstress tool (NDA topic)](../../../tools-console/xbox-tools-and-apis/commandlinetools/xbstress.md) makes it easy for you to simulate different network conditions for your users by adding additional latency.

## Prerequisites

* An Xbox Development Kit, connected to the internet,  that has been [set up for streaming](game-streaming-setup-xbox-developer-kit.md).

* A mobile device (Android 6.0 or later) that can connect to your Xbox Development Kit.

* A development PC with the Xbox development tools installed on it that can connect to your Xbox Development Kit.

## Simulating latency 

The following code example demonstrates the command to use to start applying average latency of Xbox Game Streaming users.

```shell
XBSTRESS simulate network=gamestreaming-avg
```

The following code example demonstrates how to stop applying additional latency.

```shell
XBSTRESS stop
```

## See also
[Stress (xbstress.exe) (NDA topic)](../../../tools-console/xbox-tools-and-apis/commandlinetools/xbstress.md)  