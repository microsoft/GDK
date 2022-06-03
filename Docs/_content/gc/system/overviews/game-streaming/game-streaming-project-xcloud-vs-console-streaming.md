---
title: "Xbox Game Streaming vs. Xbox Remote Play"
description: Describes the differences between game streaming environments.
author: M-Stahl
ms.author: arikc
ms.topic: conceptual
edited: 01/09/2021
kindex: Project xCloud vs Remote Play
security: public
---

# Xbox Game Streaming vs. Xbox Remote Play

Use this topic to understand the differences between the game streaming environments known as Xbox Game Streaming and Xbox Remote Play.

When using **Xbox Game Streaming**, your game runs on an Xbox server in an Azure datacenter. The user is connected to the closest datacenter, and then the game plays from there. When using **Xbox Remote Play**, your game runs on the user's Xbox console. The user connects directly to their home Xbox console, and then the game plays from there. 

## Xbox Game Streaming

Consider the following when setting up your title for Xbox Game Streaming. 

 * Only games that are published to Xbox Game Streaming are available for streaming there.
 * When running on an Xbox Game Streaming server, the game can't open a companion app.
 * If your game makes matchmaking decisions based on the network connectivity to your game server, the latency from the console that's running the game to your game server can be *very* fast. This isn't representative of the overall latency the user experiences. We recommend using [XboxStreamingGetStreamAddedLatency](../../../reference/system/xgamestreaming/functions/xgamestreaminggetstreamaddedlatency.md) to include the latency that occurs from streaming your title to the user. 
 * Your game can use native touch or the Touch Adaptation Kit (TAK) so that mobile users can have a familiar gaming experience. For more information about enabling touch input for your game, see [Getting started with touch](game-streaming-getting-started-with-touch.md).

## Xbox Remote Play

Consider the following when setting up your title for Xbox Remote Play. 

 * The user can play games that are installed locally on their Xbox console.
 * When playing a title via Xbox Remote Play, it's possible for users that are physically connected to the console to play with the streaming user.
 * If your game makes matchmaking decisions based on the network connectivity to your game server, by using Xbox Remote Play, that isn't representative of the overall latency to the user. We recommend using [XboxStreamingGetStreamAddedLatency](../../../reference/system/xgamestreaming/functions/xgamestreaminggetstreamaddedlatency.md) to include the latency that occurs from the console to the user in addition to the latency from the console to your game server.

