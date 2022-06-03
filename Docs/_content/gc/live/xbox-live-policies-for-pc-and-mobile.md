---
title: Xbox Live policies for PC and mobile
description: Policies that apply when Xbox Live is integrated into a mobile, PC, or console device other than the Xbox One console.
kindex: Xbox Live policies for PC and mobile
author: joannaleecy
ms.author: mstahl
ms.topic: conceptual
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

# Xbox Live policies for PC and mobile

## Introduction

The following policies apply when Xbox Live is integrated into a mobile, PC, or console device other than the Xbox One console.  

> If your game is targeting Xbox One, see [Xbox Requirements](https://developer.microsoft.com/games/xbox/partner/certification-requirements) for the Xbox Live and Xbox Policies which apply on that platform. If you have trouble accessing that page, please contact your Microsoft representative. Interested in bringing your PC/Mobile game to Xbox One console? Visit the [ID@Xbox program](https://www.xbox.com/Developers/id) for more information on how to apply.  
> For developers in the Xbox Live Creators Program, visit the [Microsoft Store Policies](/legal/windows/agreements/store-policies) for all policies relating to the submission of your game to the Store across all Microsoft Devices (PC, Xbox One, Hololens, etc). Note that there are additional requirements for apps that are primarily gaming experiences or target the Xbox One console, detailed in the section titled "Gaming and Xbox". Xbox Live on devices not supported by the Microsoft Store is not available to the Creators Program at this time. Visit the [Xbox Live Creators Program](https://www.xbox.com/developers/creators-program/) for information on getting started.  

Adherence to these integration policies will ensure successful deployment of Xbox Live in your game and consistent implementation across the gaming ecosystem. Failure to adhere to these policies may result in revocation of access to the Xbox Live service by your title.

## Store policies

Games which use Xbox Live are still subject to the store polices for the application platforms which they submit their game to. For Microsoft Store, the store policies are located [here](/legal/windows/agreements/store-policies). For developers not in the Xbox Live Creators program, the policies on this page supersede store policies 10.13.5, 10.13.6, 10.13.7, 10.13.8, 10.13.9, and 10.13.11.  

For PC games submitted to the Microsoft Store which have Xbox Live, there will be prerelease testing to ensure that the Xbox Live implementation functions correctly and that parental controls are respected prior to release. This testing will occur in parallel to normal store testing, adding no additional delays to your publishing timeline on the Microsoft Store.  

## Policy enforcement process

You are free to release and update your Xbox Live integrated game on any store or platform, outside of the Xbox One console, without any additional certification testing, except for those required by the store or platform on which your game will be published and released. Microsoft will monitor released games via the following mechanisms:  
1. Customer complaints regarding game functionality.
1. Spot-check review of select games, including the most popular titles.
1. Alerts and/or warnings we find in our back-end services.

If your game is found to not adhere to these policies, we will inform you and provide a reasonable timeline to fix based on severity, as determined by Microsoft. Other than in exceptional circumstances, if the issue is not resolved within the requested timeframe we may revoke the game's ability to sign into Xbox Live services until the issue is resolved.  

For information on how to test your title's adherence to these policies, see [Xbox Live Integration Test Cases For PC and Mobile Devices](/gaming/xbox-live/policies/live-policy-tests-pc).  

## Xbox Live implementation policies

In order to keep Xbox Live running as a high-quality service that respects the privacy and protects the security of its users we enforce a number of Xbox Live implementation policies. These policies are referred to as Xbox Requirements or XRs. Failure to comply with XRs will result in your title being denied the ability to publish to the Microsoft store. Titles which are already published may find themselves removed if they do not maintain compliance with XRs. The rest of this article will outline the XRs required to keep a PC or mobile title in good standing.  

### Player data and privacy

Xbox Live Services will provide you with limited user data in order for you to deliver your game to players. This user data includes account identifiers like a userid (XUID) and gamertag, connections with other players, and data about a player's activities in your game, including usage data, statistics, scores, ratings rankings, and social activity.  

You are an independent controller of such data and must have a privacy statement (or policy) in place with end users governing your use of personal data, as required by the [Application Developer Agreement](/legal/windows/agreements/app-developer-agreement). We recommend you include a link to your privacy statement from within your game, on your website, and from the detail page of any store in which you make your game available for download.  

Notwithstanding the foregoing, the following rules apply to personal data provide through the Xbox Live Services.  

* Such data may only be used to deliver your game to players.  
* You may not sell, license, or share the data with any third party. Social graph data (e.g., friends' lists) may not be stored, except for the account identifiers of those friends who have linked their own Xbox Live accounts with your game. Delete all account identifiers, when you remove your game from our service, or when a user delinks their Xbox Live account from your game.  
* Do not share services or user data (even if anonymous, aggregate, or derived data) to any ad network, data broker or other advertising or monetization-related service.  
* When Microsoft receives requests from end users to delete their personal data, we will communicate the requests to you by providing a list of end user identifiers. You must check the list at least every 30 days to ensure you receive all delete requests and must use the information provided on the list only to satisfy the delete requests of end users. You can find details about this process at [Deleted Account List Tools](https://aka.ms/xbox-deleted).  

### Official Naming Standards (XR-022)

Titles must use the naming standards defined in the latest release of the [Xbox Live required terminology list](/gaming/xbox-live/policies/live-certification-terminology-pc) for Xbox Live features. On Xbox One, titles must not refer to components of the console system or components of peripherals using terms that are not specifically included in the terminology list.  

### Display Name and Gamerpic (XR-046)

On Xbox One, titles must use the Gamertag function to display the user's gamertag as their primary display name.  

On non console platforms, while not required, we recommend you use the Xbox Live player's gamertag in the appropriate locations within the game title's experience.  

If titles show the user's gamerpic, the corresponding GameDisplayPic function must be used. These items are returned by the get_user_profile or GetUserProfileAsync Xbox Live APIs. When the gamertag is displayed, all 15 characters of any gamertag must be displayed correctly. Gamertags can include only ASCII characters a--z, A--Z, 0--9, comma (,), and space (ASCII character 0x20).  

### [Profile Settings Usage (XR-048)](/gaming/xbox-live/policies/xr/live-pc-xr048)

The Xbox Live service is the source for Xbox Live user profile information. Games must not store user information sourced from Xbox Live, such as profile data, preferences, or display names, beyond a locally stored cache used to support loss of network connectivity. Any such caches must be updated on the next available connection to the service.  

## Service connectivity

### [Loss of Connectivity to Xbox and Partner Services (XR-074)](/gaming/xbox-live/policies/xr/live-pc-xr074)

Titles must resolve errors with Xbox Live and partner services connectivity. Titles must honor the retry policies set by Xbox Live when attempting to retry a request to the Xbox service after a failure has occurred. Titles must appropriately manage messaging the user when services are unavailable. For example, if a partner service other than Xbox Live is not available, the game should not indicate that there is an issue with Xbox Live.  

### [Service Access Limitations (XR-132)](/gaming/xbox-live/policies/xr/live-pc-xr132)

Titles which exceed [title and user based limits](/windows/uwp/xbox-live/using-xbox-live/best-practices/fine-grained-rate-limiting) when calling Xbox Live services or do not adhere to Xbox Live service retry policies may be subjected to rate limiting, which may result in service interruption or deprecation. Failure to adhere to the specified limits may block a title from release, and in-production issues with released titles may result in Xbox Live services suspension up to and including title removal.  

## Online safety and privacy

### [Linking Microsoft Accounts with Publisher Accounts (XR-013)](/gaming/xbox-live/policies/xr/live-pc-xr013)

On Xbox One, titles that use partner-hosted services or accounts that require credentials must link that account with the user's Microsoft account.  

Outside of Xbox One, titles can choose to allow account linking to support their game experience.  

If account linking is enabled within the title, the following rules apply:  

* Users must be notified of the account linking and given the choice to opt-out.
* If any account linking or access to partner hosted services is enabled, it must be made available to all users/account types.
* Linked accounts must be authenticated prior to linking.
* Users must be provided all applicable terms of use, privacy and other policies within the title (or a notice with a link to such information) both during the linking process and for as long as the accounts are linked.
* Users must have the ability to de-link accounts.

### [Xbox Live and Account Privileges (XR-045)](/gaming/xbox-live/policies/xr/live-pc-xr045)

Xbox Live promises users a certain level of privacy and online safety for themselves and their children. In order to deliver on that promise, titles must check whether the active user has certain privileges before completing certain actions on the Xbox Live service or in a title experience.  

| Activity | ID | Privilege Name | Notes |
|---|:---:|---|---|
| Playing in a multiplayer game session | 254 | XPRIVILEGE_MULTIPLAYER_SESSIONS | Allows a user to join multiplayer gameplay sessions with real-world users (not bots) in scenarios such as: Synchronous player-vs-player gameplay in the same session, asynchronous turn-based gameplay, Team-based gameplay, User-initiated matchmaking, Sending or accepting invitations, Join-in-progress sessions. |
| Playing in a cross network game play session | 185 | AuthPrivileges.CrossNetworkPlay | Allows a user to participate in a gameplay session with other real-world players who are not signed into Xbox Live in scenarios such as: Synchronous player-vs-player gameplay in the same session, asynchronous turn-based gameplay, Team-based gameplay, User-initiated matchmaking, Sending or accepting invitations, Join-in-progress sessions. |
| Communication with anyone | 252 | XPRIVILEGE_COMMUNICATIONS | Allows a user to communicate with any other Xbox Live users through voice or text. |
| Shared gaming sessions | 189 | XPRIVILEGE_SESSIONS | Allows a user to participate in connected single-player experiences in shared environments. These experiences must not have any features covered under privilege 252 or 254 (Communications and Multiplayer, respectively). Use of this privilege is a title capability that requires platform approval. |
| User-generated content (UGC) | 247 | XPRIVILEGE_USER_CREATED_CONTENT | Allows a user to see other users' UGC online, download other users' UGC, or share their own UGC online. This does not restrict usage of previously downloaded UGC. |
| Sharing to a social network | 220 | XPRIVILEGE_SOCIAL_NETWORK_SHARING | Xbox One Only: Allows a user to share information, including game progress, Kinect-generated content, game clips, and so on outside of Xbox Live. |

### [Managing Player Communication (XR-015)](/gaming/xbox-live/policies/xr/live-pc-xr015)

Titles must not transmit user data or allow communication over Xbox Live when the user's privacy & online safety settings do not allow it.

Titles meet this XR by retrieving data from Xbox Live services. If the title uses its own services, it must check the user's privacy permissions at the beginning of a session or when a new user joins the session. For user-initiated scenarios outside of sessions, titles meet this requirement by checking privacy prior to displaying the user's data and before performing the action. The following list of privacy settings is available for titles to check:  

| Permission name | Description |
|---|---|
| CommunicateUsingText | Check whether or not the user can send a message with text content to the target user. |
| CommunicateUsingVoice | Check whether or not the user can communicate using voice with the target user. |

During the gameplay session, titles which offer communication between Xbox Live and non-Xbox Live network players must offer the ability to mute any non-Xbox Live players for the duration of the session.  

If Xbox Live sign-in is optional in the PCGP SKU of the game, *and* the user does not sign-in to Xbox Live (instead, signs-in with Bethesda ID), the game can skip all the steps below.  
If Xbox Live sign-in is used, then the game needs to check the user’s privileges, and privacy settings.  

**If the game restricts online experiences to just within Xbox Live social graph -**  
* Check multiplayer privilege using the [XUserCheckPrivilege](../reference/system/xuser/functions/xusercheckprivilege.md) API and pass in the [XUserPrivilege::Multiplayer](../reference/system/xuser/enums/xuserprivilege.md) as the desired privilege.  
  * If the user has the privilege, go to the next step.  
  * If the user does not have the privilege, block all multiplayer experience and display deny reason.  
* Now the user is allowed to get into the online multiplayer experience. However when the user attempts to engage in text/voice communication, the game also needs to check privacy settings. Call [XblPrivacyCheckPermissionAsync](../reference/live/xsapi-c/privacy_c/functions/xblprivacycheckpermissionasync.md) or [XblPrivacyBatchCheckPermissionAsync](../reference/live/xsapi-c/privacy_c/functions/xblprivacybatchcheckpermissionasync.md) with the *CommunicateUsingText* and/or *CommunicateUsingVoice* parameters.  
  ![alert](../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** The result can come back as “Friends Only”, in which case the game needs to use the Xbox Live social graph API to determine if the current user and the target user are friends, and only allow communication if that`s the case.  

**If the game allows cross-network multiplayer (Steam IDs with Xbox Live IDs, etc.) -**  
* Check multiplayer privilege using the [XUserCheckPrivilege](../reference/system/xuser/functions/xusercheckprivilege.md) API and pass in the [XUserPrivilege::Multiplayer](../reference/system/xuser/enums/xuserprivilege.md) as the desired privilege.  
  * If the user has the privilege, go to the next step.  
  * If the user does not have the privilege, block all multiplayer experience and display deny reason.  
* Then the game should check crossplay privilege using the [XUserCheckPrivilege](../reference/system/xuser/functions/xusercheckprivilege.md) API and pass in the [XUserPrivilege::CrossPlay](../reference/system/xuser/enums/xuserprivilege.md) as the desired privilege.  
  * If the user has the privilege, go to the next step.  
  * If the user does not have the privilege, block all multiplayer experience and display deny reason (e.g. "Your Xbox Live account privacy setting does not allow you to play with people outside of Xbox Live").  
* Now the user is allowed to get into the online multiplayer experience. However when the user attempts to engage in text/voice communication, the game also needs to check privacy settings. If the target user is an XBL user, use Call [XblPrivacyCheckPermissionAsync](../reference/live/xsapi-c/privacy_c/functions/xblprivacycheckpermissionasync.md) or [XblPrivacyBatchCheckPermissionAsync](../reference/live/xsapi-c/privacy_c/functions/xblprivacybatchcheckpermissionasync.md) with the *CommunicateUsingText* and/or *CommunicateUsingVoice* parameters.  
  ![alert](../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** The result can come back as “Friends Only”, in which case the game needs to use the Xbox Live social graph API to determine if the current user and the target user are friends, and only allow communication if that`s the case.  
* If the target user is *not* an XBL user, use [XblPrivacyCheckPermissionForAnonymousUserAsync](../reference/live/xsapi-c/privacy_c/functions/xblprivacycheckpermissionforanonymoususerasync.md) with the same *CommunicateUsingText* and/or *CommunicateUsingVoice* parameters.  
  ![alert](../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** The result can come back as “In-game friends”, in which case the game needs to use in-game friends list to determine if the current user and the target user are in-game friends, and only allow communication if that`s the case.


## Achievements and awards

The following requirements apply to titles that offer achievements, and awards on Xbox Live. All games targeting Xbox One are required to have Achievements and meet the following requirements. Demos are not allowed to have achievements; however, they have the option of supporting Hero Stats.

### Achievements and Gamerscore (XR-055)

Titles that offer Xbox Live achievements must provide the required number of achievements and their associated gamerscore at launch. Titles are permitted to add achievements or gamerscore at any time after launch, with or without corresponding new content, but they cannot exceed title-based or calendar-based limits.

A single achievement cannot exceed 200 gamerscore and all achievements in the title must be achievable.

| Item | Launch | Semi-annual additions | Lifetime limit |
|---|:---:|:---:|:---:|
| Minimum achievements | 10 | 0 | 10 |
| Maximum achievements | 100 | 100 | 500 |
| Gamerscore | 1000 | 1000 | 5000 |
> [!NOTE]
> "Semi-annual" means January–June, July–December.

### No Additional Purchases Required for Base Achievements (XR-057)

Titles must provide a way for a user to earn all achievements defined by the base title without being required to purchase additional in-title content.  

Titles must not allow users to earn achievements by simply making purchases. For titles that have any achievement that unlocks based on a real-money purchase, that achievement must also be unlockable through in-title activity or in-title currency that was earned through in-title activity.  

### Achievements Across Multiple Titles or Platforms (XR-058)

Achievements must not be shared across titles. When a single title is supported across different platforms by using the same title ID, a title must share the same set of achievements and can, at their discretion, have platform-specific achievements.  

### Modifying Active Achievements (XR-060)

After an achievement has been published to users, it cannot be removed, nor can its unlock rules or rewards be changed. Achievement text strings (name, description) or art (icons/background) can be modified.  

### [Achievement Names and Descriptions (XR-062)](/gaming/xbox-live/policies/xr/live-pc-xr062)

Achievement names and descriptions may contain only content that would merit a rating of PEGI 12, ESRB EVERYONE 10+, or lower.  

Achievement names and descriptions may not contain what is commonly considered profanity in a clear text or redacted form.  

## Multiplayer sessions

The requirements in this category pertain to game titles that provide multiplayer sessions on Xbox Live. Xbox Live offers a consistent and simple way to find multiplayer sessions and to fine-tune the parameters used to find those sessions.

### [Joinable Game Sessions and Online Play (XR-064)](/gaming/xbox-live/policies/xr/live-pc-xr064)

On Xbox consoles, titles that offer joinable game sessions must enable joinability through the Xbox shell interface.  

On devices other than Xbox consoles, titles which offer cross platform multiplayer with Xbox consoles must enable joins through the Game Bar experience.  

### [Maintaining Multiplayer Session State (XR-067)](/gaming/xbox-live/policies/xr/live-pc-xr067)

On Xbox consoles, titles with online multiplayer functionality must maintain session-state information in the Xbox Multiplayer Session Directory (MPSD).  

On devices other than Xbox consoles, titles which offer cross platform multiplayer with Xbox consoles must maintain session-state information in the Xbox Multiplayer Session Directory (MPSD).  