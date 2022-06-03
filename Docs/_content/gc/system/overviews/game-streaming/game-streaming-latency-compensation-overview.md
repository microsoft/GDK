---
title: Game streaming latency compensation overview
description: Provides an introduction to latency compensation.
author: M-Stahl
ms.author: morganb
ms.topic: conceptual
edited: 01/06/2021
kindex: Game streaming latency compensation
security: public
---

# Game streaming latency compensation overview

Use this topic to apply latency compensation to titles that are played by using Xbox Game Streaming. 

Game streaming adds latency between the user and the Xbox console that's running your game. Microsoft minimizes network latency by locating servers in Azure datacenters around the world and pairing users to the servers that are closest to them. 

However, latency can be noticeably higher for a user who's streaming from an Xbox console that's in another room. You can use a set of APIs to improve the way users with higher network latency experience your title when streaming.

Many Xbox multiplayer games already include latency compensation techniques. These techniques include adjustments that are designed to make gameplay feel fair even with latency. The Xbox Game Streaming APIs enable similar latency compensation techniques for both single and Xbox multiplayer games.

For more information about latency compensation, see [Game streaming latency compensation deep dive](game-streaming-latency-compensation-deep-dive.md).

## See also

[Game streaming latency measurement](game-streaming-latency-measurement.md)  
[Simulating latency while testing your game](game-streaming-simulate-latency-while-testing.md)  
[XGameStreaming (API contents)](../../../reference/system/xgamestreaming/xgamestreaming_members.md#Latency)  