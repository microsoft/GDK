---
title: Xbox Live multiplayer overview
description: Describes multiplayer features in Xbox Live that include Multiplayer Session Directory (MPSD), matchmaking, networking, voice chat, and text chat.
kindex: Xbox Live multiplayer overview
author: joannaleecy
ms.author: joanlee
ms.topic: conceptual
ms.assetid: 958b94b3-dccd-479a-bf52-54f7ff1656fa
ms.localizationpriority: medium
ms.date: 01/17/2021
edited: 03/08/2021
security: public
---

# Xbox Live multiplayer overview

This topic describes multiplayer features in Xbox Live that include Multiplayer Session Directory (MPSD), matchmaking, networking, voice chat, and text chat. Xbox Live multiplayer helps you create real-time multiplayer gameplay experiences in your title.  

You can use these multiplayer features to create interactions such as chatting and playing together over the internet *for Xbox Live gamers*. These interactions can help dramatically extend the life and use of your title beyond typical solo play.  

You can also use these features with your custom solutions and Azure PlayFab multiplayer features. To mix and match these features when developing titles by using the Microsoft Game Development Kit (GDK), see the following:  

* [Multiplayer overview (NDA topic)](../../../multiplayer/multiplayer-intro.md)  
* [Xbox and PC multiplayer design guidance (NDA topic)](../../../multiplayer/multiplayer-design-guidance-xbox-pc-gdk.md)  
* [Cross-platform multiplayer design guidance (NDA topic)](../../../multiplayer/multiplayer-design-guidance-cross-platform.md)  

If your titles need server hosting, see [Multiplayer Servers](/gaming/playfab/features/multiplayer/servers/).  

By building a great multiplayer experience, your title can use the large social network of Xbox Live gamers to help increase the gamer base for your game and promote a sustained community of dedicated fans&mdash;playing together.  

## Xbox Live multiplayer features

You can use Xbox Live multiplayer APIs to enable features like sending and accepting invites, matchmaking, voice chat, and text chat for Xbox Live gamers.  

These features can be categorized into the following major subsystems.  

* [Multiplayer session process lifetime management](#multiplayer-session-process-lifetime-management)
* [Simple and advanced matchmaking](#simple-and-advanced-matchmaking)
* [Xbox Live social experiences for titles with custom session and matchmaking components](#xbox-live-social-experiences-for-titles-with-custom-session-and-matchmaking-components)
* [Secure real-time voice and text chat communication](#secure-real-time-voice-and-text-chat-communication)  
* [Real-time networking and communication solution for client-host titles](#real-time-networking-and-communication-solution-for-client-host-titles)  

<a id="multiplayer-session-process-lifetime-management"></a>

### Multiplayer session process lifetime management

Multiplayer session process lifetime management shares and coordinates the information that's needed to connect a group of gamers. It can facilitate interactions between client/server, matchmaking logic and session creations, UI and multiplayer game experiences, and more.  

There are several types of services available. For more information about the differences between these services, see [Multiplayer overview (NDA topic)](../../../multiplayer/multiplayer-intro.md).  

#### Multiplayer Session Directory (MPSD)

Multiplayer Session Directory (MPSD) enables you to manage extensively customized multiplayer experiences. MPSD can be used for client/server and client-host designs. MPSD also integrates the UI (also known as the *shell*) experiences and the console OS to find and invite Xbox Live gamers for play. For more details, see [Multiplayer Session Directory overview](mpsd/live-mpsd-overview.md).  

#### Multiplayer Manager (MPM)

For *client-host* (peer-to-peer with relay) titles that require only simple multiplayer capabilities, you can instead use Multiplayer Manager (MPM). It's a client-side API that enables common multiplayer scenarios that follow best practices. MPM is best suited for game sessions that have no more than eight players. For more details, see [Multiplayer Manager overview](mpm/live-multiplayer-manager-overview.md).  

<a id="simple-and-advanced-matchmaking"></a>

### Simple and advanced matchmaking

SmartMatch is a matchmaking service that provides traditional quick-match capabilities as well as session-browse and support for highly customized matchmaking scenarios.  

You can also integrate the Xbox Looking for Group system in your title so that gamers can find other Xbox Live gamers who share their interests and goals. For more details, see [Matchmaking overview](matchmaking/live-matchmaking-overview.md).  



<a id="xbox-live-social-experiences-for-titles-with-custom-session-and-matchmaking-components"></a>

### Xbox Live social experiences for titles with custom session and matchmaking components

Xbox Live social experiences around invites and joins are requirements for Xbox and Windows PC titles.  

Multiplayer Activity (MPA) is designed to help titles that are using custom/studio-developed components, like matchmaking and lobby management functionalities, to enhance these social experiences. For more details, see [Multiplayer Activity feature overview](mpa/live-mpa-overview.md).  


<a id="secure-real-time-voice-and-text-chat-communication"></a>

### Secure real-time voice and text chat communication

Game Chat 2 facilitates secure in-game communication by using Xbox Live social graph, media services, and specialized encoding hardware on Xbox One (or later) devices. For more details, see [Intro to Game Chat 2](../../../chat/overviews/game-chat2/game-chat-2-intro.md).  

<a id="real-time-networking-and-communication-solution-for-client-host-titles"></a>

### Real-time networking and communication solution for client-host titles

If you need an integrated, real-time networking and communication solution, consider Azure PlayFab Party. Party is a cross-platform solution that's designed to quickly add multiplayer experiences in client-host (peer-to-peer with relay) titles. For more information, see [Party overview](/gaming/playfab/features/multiplayer/networking/).  

Xbox Integrated Multiplayer (XIM), a similar solution that's provided by Xbox Live, has been deprecated. XIM doesn't work for Microsoft Game Development Kit (GDK) titles. No new Xbox One Software Development Kit titles can adopt this technology. However, we will continue to support XIM for existing Xbox One Software Development Kit titles so that published titles will continue to work.  
> [!NOTE]
> For titles that are using client/server architecture, you can still use Party as a real-time voice and chat communication solution.  

## See also

[Multiplayer overview (NDA topic)](../../../multiplayer/multiplayer-intro.md)  

[Common multiplayer scenarios](live-common-multiplayer-scenarios.md)  