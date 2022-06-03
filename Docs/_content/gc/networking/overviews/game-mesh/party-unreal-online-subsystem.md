---
author: M-Stahl
title: PlayFab Party Online Subsystem for Unreal
description: Describes the PlayFab Party Online Subsystem for game development on Unreal.
kindex:
- PlayFab Party Online Subsystem for Unreal
- networking
ms.author: amartz
ms.topic: conceptual
edited: 11/13/2020
security: public
---

# Azure PlayFab Party Online Subsystem for Unreal

## Overview

Use the PlayFab Party Online Subsystem (PFP OSS) to use Party and Azure Cognitive Services in your Unreal Engine 4 (UE4) game. This includes cross-talk, cross-play, and accessibility features like real-time text chat translation and voice transcription services. PFP OSS is currently designed for use when developing PC and Xbox games. This subsystem layer works seamlessly on top of the existing Epic-provided base Online Subsystem (OSS) Microsoft Game Development Kit (GDK)/Live for Xbox Live. PFP OSS compliments the base OSS by adding support for PlayFab Party networking and Voice over Internet Protocol (VoIP).

PFP OSS works alongside the PlayFab SDK marketplace plug-in, which provides other PlayFab functionalities such as commerce and leaderboards. For more information, see [PlayFab SDK on the UE4 Marketplace](https://www.unrealengine.com/marketplace/product/playfab-sdk).

## What's included in OSS?

- Game networking.
- VoIP.
- Support for the following platforms:
     - GDK (Xbox consoles, Windows 10).
     - Xbox One Software Development Kit.
- Support for cross-play and cross-talk across the previously mentioned platforms.  
  Extra configuration is required for cross-play between the Xbox One Software Development Kit and the GDK. For more details, see [PlayFab Party Online Subsystem (OSS) Quickstart](/gaming/playfab/features/multiplayer/networking/party-unreal-engine-oss-quickstart) and [Obtaining PlayFab Party libraries](/gaming/playfab/features/multiplayer/networking/party-unreal-engine-oss-obtaining-playfab-party-libraries).
- Azure Cognitive Services:
    - Real-time text chat translation.
    - Real-time voice chat transcription.
    - Real-time voice chat transcription translation.
    - Text-to-speech synthesis. 

## Which versions of Unreal Engine are supported?
We recommend using Unreal Engine 4.25plus&mdash;the first approved version of UE4 for shipping on the GDK. If you're on an earlier version of UE4, the OSS can be backported with minimal work. For more details, see [Using older versions of Unreal Engine 4](/gaming/playfab/features/multiplayer/networking/party-unreal-engine-using-older-versions).
> [!NOTE]
> If you're using a version of UE4 earlier than 4.25plus, rename all references to the GDK to Anvil by using find and replace all.

## Which versions of the GDK are supported?
- **Windows 10:**
    - We recommend the June 2020 GDK (2006) or later.
    - The minimum is the November 2019 GDK (1911).  
    - If you're using a GDK version that's earlier than 2006 on PC, contact your Microsoft representative for further guidance.
- **Xbox consoles:** The minimum&mdash;we recommend the June 2020 GDK (2006) or later.
 
- **Xbox One Software Development Kit:** The minimum&mdash;we recommend the July 2018 Xbox One Software Development Kit QFE 15 (1807).
    

## Pricing
> [!NOTE]
> VoIP and Game Networking functionality are free for users who are signed in with an Xbox Live account, regardless of platform.

Cognitive services and other services can have a cost associated with them. For details, see [PlayFab Party Pricing](/gaming/playfab/features/multiplayer/networking/pricing) or contact your Microsoft representative.

## See also
[PlayFab Party](playfab-party-intro-networking.md)

[PlayFab Party chat introduction](../../../chat/overviews/playfab-party-intro-chat.md)

[PlayFab Party SDK for Unity](party-unity-plugin.md)