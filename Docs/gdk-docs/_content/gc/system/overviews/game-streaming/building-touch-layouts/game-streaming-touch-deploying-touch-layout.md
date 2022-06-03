---
title: Deploying touch control layouts using Tak CLI
description: Deploying your touch control layouts to your device using Tak CLI
kindex: Deploying touch control layouts using Tak CLI
author: arikcohen
ms.author: arikc
ms.prod: gaming
ms.topic: conceptual
ms.date: 11/03/2019
security: public
---

# Deploying Your Touch Control Layouts

## Overview

Once you have [built your touch layouts](game-streaming-touch-building-touch-layout.md), you will want to interact with them in your game.

## Prerequisites

To deploy and view your layouts you will need to have:

- A Windows PC that has the [Touch Adaptation Kit command line tool (tak.exe)](../game-streaming-tak-command-line.md)
- A device with the [Android Content Test Application](../game-streaming-android-content-test-application.md), [Web Content Test Application](../game-streaming-web-content-test-application.md) or the [Windows PC Content Test Application](../game-streaming-windows-pc-content-test-application.md).
- A set of layouts that you would like to deploy and view

## Deploying your layouts

### 1. Serve the layouts

On the Windows PC that has the [Touch Adaptation Kit command line tool (tak.exe)](../game-streaming-tak-command-line.md) utilize the [`serve`](../game-streaming-tak-command-line.md#serve-command) command to make the layouts available to devices that request them.

```
C:\Program Files (x86)\Microsoft GDK\bin>tak serve --layout-path C:\MyGameLayouts
Verifying touch adaptation bundle 'C:\MyGameLayouts '.
Now listening on: http://0.0.0.0:9269
Application started. Press Ctrl+C to shut down.
Hosting environment: Production
Content root path: C:\MyGameLayouts
```

### 2. Configuring the Content Test Application to load

In the settings of your Content Test Application, enter the configuration for the Touch Adaptation Settings (in the Developer section).

- Make sure enable sideload is enabled
- Enter the address to the PC (including port) that is serving the layouts
- Enable auto refresh if you want changes that are made to the layouts to be immediately updated on all connected clients (otherwise updates will only happen when a new streaming connection is started).

![Developer Settings](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/game-streaming-cta-android-developer-settings.png).

### 3. Stream your game

Upon each streaming connection, the CTA will connect to the TAK server and download the latest layouts.

![Layout downloaded](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/game-streaming-cta-android-layout-download.png).

When a layout is requested, you will see a request and download on the PC that is hosting the `serve` command.

```
C:\Program Files (x86)\Microsoft GDK\bin>tak serve --layout-path C:\MyGame\layouts
Verifying touch adaptation bundle 'C:\MyGame\layouts'.
Now listening on: http://0.0.0.0:9269
Application started. Press Ctrl+C to shut down.
Hosting environment: Production
Content root path: C:\MyGame\layouts
Request starting HTTP/1.1 POST http://192.168.1.1:9269/connection/negotiate?negotiateVersion=1  0
Request finished in 1.6283ms 200 application/json
Request starting HTTP/1.1 GET http://192.168.1.1:9269/connection?id=3u0Xs_Dlwn-J1mREHTcG5w
Request starting HTTP/1.1 GET http://192.168.1.1:9269/v1/tabs/active/download
Request finished in 3.9865ms 200 application/octet-stream
```

### 4. Select your layout

After a streaming session has been started, you can select the touch layout to be utilized by selecting the Developer and then TAK selection from the in-stream overlay by pressing the `...` button in the top left.

![Select layout](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/game-streaming-cta-android-select-layout.gif).
