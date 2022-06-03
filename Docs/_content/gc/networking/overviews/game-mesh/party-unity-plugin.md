---
author: M-Stahl
title: PlayFab Party SDK for Unity
description: Describes the PlayFab Party plug-in for game development on Unity.
kindex:
- PlayFab Party SDK for Unity
- networking
ms.author: carocai
ms.topic: conceptual
edited: 11/06/2020
security: public
---

# Azure PlayFab Party SDK for Unity

## Overview

PlayFab Party is a cross-platform, real-time communication and networking service that simplifies low-latency chat and data communication for multiplayer games. Use the Party Unity plug-in to seamlessly call Party APIs from your Unity title. 

For information about the supported platforms, see the [Azure Playfab Party SDKs](/en-us/gaming/playfab/features/multiplayer/networking/party-sdks) topic.

Download the plug-in from [our GitHub page](https://github.com/playfab/PlayFabPartyUnity).

## Prerequisites

- PlayFab account ([www.playfab.com](https://www.playfab.com)) is registered and set up:
    - The studio and app are configured. The TitleID exists.
    - The Party feature is enabled.
    - We strongly recommend that you try the PlayFab Unity test app so that it ensures seamless PlayFab integration.
- PlayFab Unity Editor Extensions plug-in installed.
- PlayFab (Core) SDK (installed via PlayFab Unity Editor extensions).
- If you're targeting a Microsoft Game Development Kit (GDK) platform (Xbox One, Xbox Series X&#124;S, and/or PC):
    - Have access to the [Microsoft Game Development Kit (GDK)](https://aka.ms/gdkdl).
    - GDK installed (with all optional components).
    - GDK Unity plug-in installed (available in Add-ins download section on the GDK portal).
    - If you're targeting Xbox or Xbox Series X&#124;S:
        - Unity Xbox Series X&#124;S Add-on installed (download from Unity).
        - Unity Xbox One Add-on installed (download from Unity).
        - Party on Xbox consoles requires Xbox Live authentication. Ensure that:
            - Your Xbox app title is registered in Partner Center.
            - The necessary SandboxID and developer Xbox Live account are created and configured to work with the registered Xbox app title.
    - If you're targeting Microsoft Game Development Kit (GDK) on PC, the Party Unity SDK is "Microsoft Game Development Kit (GDK)-PC&ndash;ready" as soon as Unity build tools for Microsoft Game Development Kit (GDK) PC are available.
         

## What's inside

The SDK contains the following folders.

- /PlayFabPartySDK: Contains APIs that you'll call from your game to take advantage of networking, in-game chat, and other functionality that's offered by Party
- /PlayFabPartySDK/Examples: Contains a simple demo scene with a script that shows how to call the Party APIs
- /PlayFabPartySDK/Prefabs: Contains the `PlayFabMultiplayerManager` prefab
- /PlayFabPartySDK/Setup/GameCore: Contains set-up scripts that need to be used once to prepare the SDK to build for the Microsoft Game Development Kit (GDK)

For a detailed guide, see [Quickstart: PlayFab Party Unity Plugin](/gaming/playfab/features/multiplayer/networking/party-unity-plugin-quickstart).