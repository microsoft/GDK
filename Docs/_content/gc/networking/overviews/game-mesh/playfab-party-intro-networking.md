---
author: M-Stahl
title: PlayFab Party
description: Provides an overview of using Azure PlayFab Party with the Microsoft Game Development Kit (GDK).
kindex: PlayFab Party
ms.author: jkepner
ms.topic: conceptual
edited: 11/11/2020
security: public
---

# Azure PlayFab Party

Use this topic to understand how to use PlayFab Party with the Microsoft Game Development Kit (GDK). [PlayFab Party](/gaming/playfab/features/multiplayer/networking/) simplifies adding low-latency chat and data communication to your game in a way that's flexible, inclusive, and secure. Party is ideal for multiplayer implementations when a cloud-hosted dedicated server isn’t wanted (sometimes called *peer-to-peer games* or *P2P games*). Party powers voice and text communications for social experiences within your app (for example, in-game squads or post-game lobbies), even if you're using a cloud server as the game host. Party is the Microsoft Game Development Kit (GDK) successor to the Xbox One ERA Secure Sockets API.

Party uses Azure Cognitive Services to transcribe user voice chat and synthesize text as speech, which was primarily designed as an accessibility aid. Typical usage of PlayFab Party voice chat is billed on a per-minute basis. Up to 10 percent of those voice minutes can use transcription and synthesis for free. We recommend tying activation of this capability to an ease-of-access user setting.
> [!NOTE]
> Party also translates chat in real time. In anonymous matchmaking and international competitive games, these transcription and translation capabilities are a more engaging multiplayer experience.

A key goal of PlayFab Party (and our other multiplayer services) is to facilitate interoperable multiplayer infrastructure and cross-network gameplay. Verify that your multiplayer experiences comply with relevant platform policies for multiplayer and cross-network user activity.

## PlayFab Party features

* **Encryption and authentication:** Party authenticates user devices by using their PlayFab user identity and encrypts data with a DTLS-like protocol.
* **Device-to-device datagram networking:** At the core of Party are relays that are hosted globally across the Azure cloud. User devices use these relays to create Party networks and send game data to one another. The Party networking system includes configurable transport features such as automatic retries when encountering packet loss.
* **Voice and text chat:** User devices can bind audio devices to Party networks for real-time voice chat. Party also supports text chat messages between users.
* **Speech-to-text and voice synthesis:** Party can transcribe user voice chat and synthesize utterances for text messages. This functionality has several uses but was primarily designed as an accessibility aid.
* **Real-time translation:** Party can understand and synthesize real-time translations of user voice and text chat.


## Microsoft Game Development Kit (GDK) considerations


### Xbox Live requirements

User communication for Xbox Live titles must meet several requirements for user safety. Using PlayFab Party with the PlayFab Party Xbox Live Plug-in ensures that your title meets all the Xbox Live communication and security requirements.
> [!NOTE]
> An *Xbox Requirement* (XR) is a requirement for a game that must be met before it can be published on Xbox platforms.

- **XR-015:** Managing Player Communication.
- **XR-045:** Xbox Live and Account Privileges. The Xbox Live Plug-in only enforces the *XPRIVILEGE_COMMUNICATIONS* portion. If your title uses other Xbox Live features, you're required to perform the necessary privilege checks.
- **XR-072:** Supporting Voice.
- **XR-007**: Cross-Network Play, Data Usage, and Companion App Interactions. PlayFab Party only enforces the *Cross-network gameplay* portion that requires a server. Your title is responsible for the necessary privilege checks and Xbox Live interaction.
- **XR-064:** Joinable Game Sessions and Online Play
- **XR-067:** Maintaining Multiplayer Session State
- **XR-124:** Game Invitations




## Network initialization

PlayFab Party doesn't automatically handle [network initialization](../initialization-connectivity-networking.md#ID4ETA) for Microsoft Game Development Kit (GDK) titles. Wait for the network to become initialized before calling into PlayFab Party. Party APIs fail until the network is initialized.


<a id="SuspendResume"></a>
## Suspend and resume

You should register for suspend and resume events via `RegisterAppStateChangeNotification`. On suspend, clean up Party with `PartyManager::Cleanup()`. On resume, you should again wait for network initialization before calling `PartyManager::Initialize()`. Party APIs fail if you attempt to use them across a suspend/resume cycle.

It can take a couple hundred milliseconds for `PartyManager::Cleanup()` to complete.  We recommend cleaning up Party in parallel with your other suspend operations in order to avoid suspend timeouts.  If calling `Partymanager::Cleanup()` asynchronously, you should make sure to block the suspend notification until Party's cleanup returns.


## Pricing information

PlayFab Party is free for the Microsoft Game Development Kit (GDK) by using Xbox Live identities. For more information about pricing and billing, see [Xbox Live Free Program FAQ](/gaming/playfab/features/multiplayer/networking/xbl-discount).


## Configuring your title in the PlayFab portal

1. Go to [https://developer.playfab.com/](https://developer.playfab.com/), and then create an account.
1. Create a PlayFab studio and title ID by using your new account.
1. Go to your newly created title, select the **Multiplayer** section, and then select the **Party (Preview)** tab.
1. Select **Enable**, and then enter the access code **Xbox Live**. Party is enabled after a few moments.
1. On the **API Features** tab, copy your PlayFab title ID and entity ICD.
1. Add the title ID and entity ICD to the client PlayFab Party API initialization function. You can now use PlayFab Party in your Microsoft Game Development Kit (GDK) title.

For more information, see [Quickstart: Game Manager](/gaming/playfab/gamemanager/quickstart).


## Adding the PlayFab Party library to your Microsoft Game Development Kit (GDK) project by using Visual Studio

1. Right-click your project in the Visual Studio Solution Explorer, and then select **Properties**.
1. In **Configuration Properties**, go to the **Xbox One** section.
1. Select the **Gaming Extension Libraries** drop-down list, and then add a reference to PlayFab Party and the Xbox Live Helper.
> [!NOTE]
> The libraries are installed in a default location under *Program Files (x86)\Microsoft GDK\[Version]\GRDK\ExtensionLibraries\PlayFab.Party.Cpp\Redist\CommonConfiguration\neutral*.


## PlayFab Party and sandboxes

Configuring PlayFab Party for sandboxes isn't required. All network sessions are allocated in a retail environment, regardless of the sandbox that it's deployed into. If you need to separate users for testing, create a separate PlayFab title ID for your testing versus retail environments. The PlayFab title ID is independent of your Xbox Live title ID. One Xbox Live title ID can use several different PlayFab title IDs.


## See also

[PlayFab Party Overview](/gaming/playfab/features/multiplayer/networking/)