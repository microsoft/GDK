---
title: Xbox Network Policies for PC and mobile
description: Policies for adding Xbox network features to a PC, mobile or Creators Program game.
kindex: Xbox Network Policies for PC and mobile
ms.topic: conceptual
author: M-Stahl
ms.localizationpriority: high
ms.date: 7/1/2021
security: public
---

# Xbox Network Policies for PC, Mobile, and Creators Program

Version 2.4


## Introduction

The following policies apply when Xbox network services are integrated into a mobile, PC, or console device other than an Xbox console.

>If your game is targeting an Xbox console, see [Xbox Requirements (NDA topic)](../Console/certification-requirements.md) for the Xbox network and Xbox Policies which apply on that platform. Interested in bringing your PC/Mobile game to an Xbox console? Visit the [ID@Xbox program](https://www.xbox.com/Developers/id) for more information on how to apply.
>
>For developers in the Xbox  Creators Program, in addition to the Xbox Network Policies below (for supported features in the creators program) visit the [Microsoft Store Policies](/legal/windows/agreements/store-policies) for store policies relating to the submission of your game to the Store across all Microsoft Devices (PC, Xbox consoles, Hololens, etc). Note that there are additional requirements for apps that are primarily gaming experiences or target Xbox consoles, detailed in the section titled "Gaming and Xbox". Xbox network on devices not supported by the Microsoft Store is not available to the Creators Program at this time. Visit the [Xbox Creators Program](https://www.xbox.com/developers/creators-program/) for information on getting started.
>
Adherence to these integration policies will ensure successful deployment of Xbox network services in your game and consistent implementation across the gaming ecosystem. Failure to adhere to these policies may result in revocation of access to Xbox network services by your title.


## Store policies

Games which use Xbox network are still subject to the store polices for the application platforms which they submit their game to. For Microsoft Store, the store policies are located [here](/legal/windows/agreements/store-policies). 

For PC games submitted to the Microsoft Store which have Xbox network features, there will be pre release testing to ensure that the Xbox network features function correctly and that parental controls are respected prior to release.  This testing will occur in parallel to normal store testing, adding no additional delays to your publishing timeline on the Microsoft Store.  

## Policy enforcement process

You are free to release and update your Xbox network integrated game on any store or platform, outside of the Xbox console, without any additional certification testing, except for those required by the store or platform on which your game will be published and released. Microsoft will monitor released games via the following mechanisms:

1. Customer complaints regarding game functionality.
2. Spot-check review of select games, including the most popular titles.
3. Alerts and/or warnings we find in our back-end services.

If your game is found to not adhere to these policies, we will inform you and provide a reasonable timeline to fix based on severity, as determined by Microsoft. Other than in exceptional circumstances, if the issue is not resolved within the requested timeframe we may revoke the game's ability to sign into Xbox network services until the issue is resolved.

For information on how to test your title's adherence to these policies, see [Xbox Network Integration Test Cases For PC and Mobile Devices](live-policy-tests-pc.md).


## Xbox Network Implementation Policies

In order to keep the Xbox network running as a high quality service that respects the privacy and protects the security of its users we enforce a number of Xbox network implementation policies. These policies are referred to as Xbox Requirements or XRs. Failure to comply with XRs will result in your title being denied the ability to publish to the Microsoft store. Titles which are already published may find themselves removed if they do not maintain compliance with XRs. The rest of this article will outline the XRs required to keep a PC or mobile title in good standing.


### Player Data and Privacy

Xbox Network Services will provide you with limited user data in order for you to deliver your game to players.  This user data includes account identifiers like a userid (XUID) and gamertag, connections with other players, and data about a player's activities in your game, including usage data, statistics, scores, ratings rankings, and social activity.

You are an independent controller of such data and must have a privacy statement (or policy) in place with end users governing your use of personal data, as required by the [Application Developer Agreement](/legal/windows/agreements/app-developer-agreement). We recommend you include a link to your privacy statement from within your game, on your website, and from the detail page of any store in which you make your game available for download.

Notwithstanding the foregoing, the following rules apply to personal data provide through the Xbox network services.  

* Such data may only be used to deliver your game to players.  

* You may not sell, license, or share the data with any third party.  Social graph data (e.g., friends' lists) may not be stored, except for the account identifiers of those friends who have linked their own Xbox Live accounts with your game. Delete all account identifiers, when you remove your game from our service, or when a user delinks their Xbox network account from your game.  

* Do not share services or user data (even if anonymous, aggregate, or derived data) to any ad network, data broker or other advertising or monetization-related service.

* When Microsoft receives requests from end users to delete their personal data, we will communicate the requests to you by providing a list of end user identifiers. You must check the list at least every 30 days to ensure you receive all delete requests and must use the information provided on the list only to satisfy the delete requests of end users. You can find details about this process at[ Deleted Account List Tools](https://aka.ms/xbox-deleted).


#### XR-022: Official Naming Standards \*

Titles must use the naming standards defined in the latest release of the terminology list for the their target device platforms:

* [Xbox Console (NDA topic)](../Console/console-certification-terminology.md) 
* [PC or Mobile](live-terminology-pc.md)

On Xbox consoles, titles must not refer to components of the console system or components of peripherals using terms that are not specifically included in the terminology list.


#### [XR-046: Display Name and Gamerpic](../XR/XR046.md) \*

On Xbox consoles, titles must use the Gamertag as their primary display name.
Based on development architecture and design choice titles can choose between the player’s modern gamertag (GDK) or their classic gamertag (ERA or GDK)

On non console platforms, while not required, we recommend you use the Xbox network player’s gamertag in the appropriate locations within the game title’s experience.

The gamertag used must be displayed correctly in the title based on the gamertag type used:

* **Modern Gamertag:**  Display all 16 characters of the unique modern gamertag, which includes up to 12 characters of the modern gamertag, followed by # and the suffix number (if present). For example: Major Nelson (no suffix present) or Major Nelson#881. If modern gamertags are used, all Unicode character ranges available for modern gamertags must be supported. For more modern gamertag information and best practices visit the GDK development documentation article 'Overview of modern gamertags'
* **Classic Gamertag:**  Correctly display all 15 characters of the classic gamertag. Classic gamertags include only ASCII characters a–z, A–Z, 0–9, comma (,), and space (ASCII character 0x20). For example: Major Nelson

In the GDK these items are returned using the **XUserGetGamertag** API.  In ERA the gamertag is obtained using the **GetUserProfileAsync** API.

#### XR-048: Profile Settings Usage \*

The Xbox network service is the source for Xbox network user profile information. Games must not store user information sourced from the Xbox network, such as profile data, preferences, or display names, beyond a locally stored cache used to support loss of network connectivity. Any such caches must be updated on the next available connection to the service. 


## Service Connectivity

#### [XR-074: Loss of Connectivity to Xbox and Partner Services ](../XR/XR074.md) \*

Titles must resolve errors with Xbox network and partner services connectivity. Titles must honor the retry policies set by Xbox network when attempting to retry a request to the Xbox service after a failure has occurred.  Titles must appropriately manage messaging the user when services are unavailable. For example, if a partner service other than the Xbox network is not available, the game should not indicate that there is an issue with the Xbox network.

#### [XR-132: Service Access Limitations](../XR/XR132.md) \*
Titles which exceed [title and user based limits ](/en-us/windows/uwp/xbox-live/using-xbox-live/best-practices/fine-grained-rate-limiting)when calling Xbox network services or do not adhere to Xbox network service retry policies may be subjected to rate limiting, which may result in service interruption or deprecation. Failure to adhere to the specified limits may block a title from release, and in-production issues with released titles may result in Xbox network services suspension up to and including title removal.

## Online Safety and Privacy

#### [XR-013: Linking Microsoft Accounts with Publisher Accounts \* ](../XR/XR013.md)

On Xbox consoles, titles that use partner-hosted services or accounts that require credentials must link that account with the user’s Microsoft account.  

Outside of Xbox consoles, titles can choose to allow account linking to support their game experience.  

If account linking is enabled within the title, the following rules apply: 
* Users must be notified of the account linking and given the choice to opt-out.
* If any account linking or access to partner hosted services is enabled, it must be made available to all users/account types. 
* Linked accounts must be authenticated prior to linking. 
* Users must be provided all applicable terms of use, privacy and other policies within the title (or a notice with a link to such information) both during the linking process and for as long as the accounts are linked.
* Users must have the ability to de-link accounts. 

#### [XR-045: Xbox User and Account Privileges ](../XR/XR045.md)\*

The Xbox network provides users with an expected level of privacy and online safety for themselves and their children. In order to deliver on that promise, titles must check the Xbox network service for privileges to complete certain actions on the Xbox network service or in a title experience.

| **Activity**|**ID**|**Privilege Name**|**Notes**|
|-|--|--- |---|
|Playing in a multiplayer game session|254|XPRIVILEGE_MULTIPLAYER_SESSIONS|Allows a user to join online multiplayer gameplay sessions with real-world users (not bots) in scenarios such as: Synchronous player-vs-player gameplay in the same session, asynchronous turn-based gameplay, Team-based gameplay, User-initiated matchmaking, Sending or accepting invitations, Join-in-progress sessions. Note this privilege does not pertain to local multiplayer games run on the same device.|
|Playing in a cross network game play session|185|AuthPrivileges.CrossNetworkPlay|Allows a user to participate in a gameplay session with other real-world players who are not signed into Xbox network in scenarios such as: Synchronous player-vs-player gameplay in the same session, asynchronous turn-based gameplay, Team-based gameplay, User-initiated matchmaking, Sending or accepting invitations, Join-in-progress sessions.|
|Communication with anyone |252|XPRIVILEGE_COMMUNICATIONS|Allows a user to communicate with any other Xbox network users through voice or text. |
|Shared gaming sessions|189|XPRIVILEGE_SESSIONS|Allows a user to participate in connected single-player experiences in shared environments or in scenarios where a title is a hybrid free to play and paid multiplayer title and uses this privilege to gate those experiences Xbox consoles. Single player experiences must not have any features covered under privilege 252 or 254 (Communications and Multiplayer, respectively). Use of this privilege is a title capability that requires platform approval.|
|User-generated content (UGC)|247|XPRIVILEGE_USER_CREATED_CONTENT|Allows a user to see other users’ UGC online, download other users’ UGC, or share their own UGC online. This does not restrict usage of previously downloaded UGC. |
|Sharing to a social network|220|XPRIVILEGE_SOCIAL_NETWORK_SHARING|Xbox consoles Only: Allows a user to share information, including game progress, Kinect-generated content, game clips, and so on outside of the Xbox network.|

Free to play titles, demos, or betas can be configured to allow multiplayer gameplay (ID 254) for players who are not Xbox network Gold subscribers.  This is done via a service side configuration and can be initiated by contacting your Microsoft representative.  These titles must continue to check for the multiplayer game privilege to ensure that parental controls and player choices are respected.

#### [XR-015: Managing Player Communication](../XR/XR015.md) \* 

Titles must not transmit user data or allow communication over Xbox network when the user's privacy & online safety settings do not allow it.

Titles meet this XR by retrieving data from Xbox network services. If the title uses its own services, it must check the user's privacy permissions at the beginning of a session or when a new user joins the session. For user-initiated scenarios outside of sessions, titles meet this requirement by checking privacy prior to displaying the user's data and before performing the action. The following list of privacy settings is available for titles to check:

| Permission name |Description |
|-----------------|------------|
|CommunicateUsingText | Check whether or not the user can send a message with text content to the target user. |
|CommunicateUsingVoice |Check whether or not the user can communicate using voice with the target user. |

During the gameplay session, titles which offer communication between Xbox network and non-Xbox network players must offer the ability to mute any non-Xbox network players for the duration of the session.

#### [XR-018: User-Generated Content](../XR/XR018.md) \* 

User generated content is content that users contribute to an app or product and can be viewed or accessed by other users in an online state. If your product contains UGC, you must: 

* Publish and make available to users a product terms of service and/or content guidelines for User Generated Content either in game or on a title’s website 
* Provide a means for users to report inappropriate or harmful content within the product to the developer for review and removal/disablement if in violation of content guidelines and/or implement a method for proactive detection of inappropriate or harmful UGC (for example, text filtering) 
* Titles must remove/disable UGC when requested by Microsoft 
* Gracefully handle scenarios in which a user does not have access to UGC in game 
* Titles integrated with 3rd party mod platforms must integrate with the product’s report / complaint API if available and must moderate content if required by respective 3rd party contracts 
* Titles integrated with 3rd party mod platforms must present a disclaimer, dialog, or visual cue to users if the content is not sourced from the developer 


## Achievements and awards

The following requirements apply to titles that offer achievements, and awards on the Xbox network.  

#### XR-055: Achievements and Gamerscore \*

Titles must provide the required number (minimum and maximum) of achievements and their associated gamerscore at launch. Titles are permitted to add achievements or gamerscore at any time after launch, with or without corresponding new content, but they cannot exceed title-based or calendar-based limits.

A single achievement cannot exceed 200 gamerscore and all achievements in the title must be achievable.

Item | Launch |Semi-annual additions| Lifetime limit
-----|----|-----|-----
Minimum achievements | 10 | 0 | 10
Maximum achievements | 100 | 100 | 500
Gamerscore | 1000 | 1000 | 5000

Note: “Semi-annual” means January–June, July–December. Base game achievements and Gamerscore do not count towards the semi-annual limits.


#### [XR-057: Unlocking Achievements](../XR/XR057.md) \*

Titles must provide a way for a user to earn all achievements defined by the base title without being required to purchase additional in-title content.

Achievements must be unlocked through in-game actions, gameplay, and/or experiences.

Titles must not provide players alternative options that unlock achievements directly without corresponding gameplay activity. A non-exhaustive list of disallowed options:

* A real-money purchase

* In-game cheat codes, consoles, or menu options

These options may be used to reduce the difficulty of the gameplay required to unlock achievements.

#### XR-058: Achievements Across Multiple Titles or Platforms 


Achievements must not be shared across titles. When a single title is supported across different platforms by using the same title ID, a title must share the same set of achievements and can, at their discretion, have platform-specific achievements.

#### XR-060: Modifying Active Achievements

After an achievement has been published to users, it cannot be removed, nor can its unlock rules or rewards be changed. Achievement text strings (name, description) or art (icons/background) can be modified.

#### [XR-062: Achievement Names and Descriptions](../XR/XR062.md)

Achievement names and descriptions may contain only content that would merit a rating of PEGI 12, ESRB EVERYONE 10+, or lower.

Achievement names and descriptions may not contain what is commonly considered profanity in a clear text or redacted form.

## **Multiplayer sessions**

The requirements in this category pertain to game titles that provide multiplayer sessions on Xbox. Xbox offers a consistent and simple way to find multiplayer sessions and to fine-tune the parameters used to find those sessions.

#### [XR-064: Joinable Game Sessions and Online Play](../XR/XR064.md)\*

On Xbox consoles, titles that offer joinable game sessions must enable joinability through the Xbox shell interface. 

Titles that offer cross platform multiplayer with Xbox consoles from PC devices using Xbox sign in must also enable joins through the Game Bar experience.

#### [XR-067: Maintaining Multiplayer Session State](../XR/XR067.md) \*

On Xbox consoles, titles with online multiplayer functionality must maintain session-state information on the Xbox network.  Titles do this through the Xbox Multiplayer Session Directory (MPSD) or if a title has their own multiplayer session state functionality, they may choose to instead record player interactions using the Multiplayer Activity Recent Player feature.

On devices other than Xbox consoles, titles which offer cross platform multiplayer with Xbox consoles must maintain session-state information in the Xbox Multiplayer Session Directory (MPSD).   If they have their own session state functionality,  they may choose to instead record player interactions using the Multiplayer Activity Recent Player feature.