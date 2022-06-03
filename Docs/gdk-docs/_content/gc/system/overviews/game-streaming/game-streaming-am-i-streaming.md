---
title: Cloud Aware API calls
description: Describes how to detect that your Cloud Aware game is capable of streaming for Xbox Game Streaming.
author: M-Stahl
ms.author: arikc
ms.topic: conceptual
edited: 01/05/2021
kindex: Is game streaming?
security: public
---

# Cloud Aware API calls

Use this topic to detect if your Cloud Aware title is capable of streaming so that you can [optimize your game](game-streaming-optimizing-your-game.md) for Xbox Game Streaming.

## Set up your game for streaming

During game initialization, ensure that you've set up the game streaming component by using `XGameStreamingInitialize` as shown in the following code.

```C++

// Initialize the game streaming component
XGameStreamingInitialize();

```
   
To detect if there are any active streaming clients that are currently connected, use `XGameStreamingIsStreaming` as shown in the following code.

```C++
 if (XGameStreamingIsStreaming())
 {
     // The game is currently streaming to at least one device
     // Enable any customizations that might be useful when running from the cloud
 }
```

## Manage the connection state

If there are any active streaming clients, your game has a point-in-time understanding of those clients when using `XGameStreamingIsStreaming`. To receive notification when a streaming client connects or disconnects from your game, use [XGameStreamingRegisterConnectionStateChanged](../../../reference/system/xgamestreaming/functions/xgamestreamingregisterconnectionstatechanged.md).  


## See also
[XGameStreaming (API contents)](../../../reference/system/xgamestreaming/xgamestreaming_members.md#connection-state)
[Optimizing your game](game-streaming-optimizing-your-game.md)