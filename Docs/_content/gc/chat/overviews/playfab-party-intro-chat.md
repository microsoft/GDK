---
author: M-Stahl
title: PlayFab Party chat introduction
description: Describes how to implement PlayFab Party communications in your games.
kindex: PlayFab Party Chat Intro
ms.author: jkepner
ms.topic: conceptual
edited: 10/22/2020
security: public
---

# Adding chat by using Microsoft Azure PlayFab Party

Use this topic to understand how [PlayFab Party](/gaming/playfab/features/multiplayer/networking/) simplifies adding low-latency chat and data communication to your game in a way that's flexible, inclusive, and secure. Party is ideal for multiplayer implementations when a cloud-hosted dedicated server isn’t wanted (sometimes called *peer-to-peer games* or *P2P games*). Party powers voice and text communications for social experiences within your app (for example, in-game squads or post-game lobbies), even if you're using a cloud server as the game host.

Party uses Azure Cognitive Services to transcribe user voice chat and synthesize text as speech, which was primarily designed as an accessibility aid. Typical usage of PlayFab Party voice chat is billed on a per-minute basis. For more information, see [PlayFab Party Pricing](/gaming/playfab/features/multiplayer/networking/pricing). We recommend tying activation of this capability to an ease-of-access user setting.
> [!NOTE]
> Party also translates chat in real time. In anonymous matchmaking and international competitive games, these transcription and translation capabilities are a more engaging multiplayer experience.

A key goal of PlayFab Party (and our other multiplayer services) is to facilitate interoperable multiplayer infrastructure and cross-network gameplay. Verify that your multiplayer experiences comply with relevant platform policies for multiplayer and cross-network user activity.
> [!NOTE]
> PlayFab Party can’t be used in parallel with the `GameChat2` API.


## See also

[PlayFab Party](../../networking/overviews/game-mesh/playfab-party-intro-networking.md)

[PlayFab Party Overview](/gaming/playfab/features/multiplayer/networking/)