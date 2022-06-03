---
author: joannaleecy
title: Player sign in concepts
description: Describes sign in concepts for Microsoft Game Development Kit (GDK) titles using PlayFab.
kindex: PlayFab, GDK, sign in, authentication, log in
ms.author: joanlee
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# Player sign in concepts

This article describes concepts that will help you implement player sign in for Microsoft Game Development Kit (GDK) titles that use PlayFab. 

Players must be authenticated with Xbox and PlayFab before using features that rely on their services in your titles. For example, players need to be signed in to their PlayFab account before they are able to start chatting using PlayFab Party.

If you're already familiar with the Xbox/PlayFab sign in concepts and want to start coding, see [Implement player sign in](gdk-playfab-player-sign-in-steps.md).

## Understand Xbox and PlayFab user accounts

Xbox Live and PlayFab accounts are two different user accounts. 

When your title is using Xbox and PlayFab services, players have to be signed in to both their Xbox Live and PlayFab user accounts.

Your title needs to be prepared to handle any player not having both of these accounts.

* Player has an Xbox Live account and doesn't have a PlayFab account
* Player has a PlayFab account and doesn't have an Xbox Live account
* Player has both accounts

By the end of the sign in process:

* Each player needs to have an Xbox Live and a PlayFab account that they can sign in to.
* The player's Xbox Live and PlayFab user account must also be associated with each other.
* The player is signed in to both accounts.

## Sign in options

This section lists different options to implement player sign in for Xbox Live and PlayFab user accounts. For detailed steps, see [Implement player sign in](gdk-playfab-player-sign-in-steps.md).

### Sign players in to Xbox Live

[XUser](gdk-playfab-player-sign-in-steps.md#xuser), part of the Microsoft Game Development Kit (GDK)'s system API, is used to sign players in to their Xbox Live accounts. This API is used for titles developed on PC (Microsoft Game Development Kit (GDK)) and Xbox (Microsoft Game Development Kit (GDK)) titles only.

For titles using XDK, use the corresponding user API. For more information, see [Handle user system events](https://developer.microsoft.com/en-us/games/xbox/docs/xdk/how-to-handle-user-system-events) and [User and controller sample](https://developer.microsoft.com/en-us/games/xbox/docs/xdk/user-and-controller-apis).

### Sign players in to PlayFab

There are two ways to sign players in to their PlayFab accounts. PlayFab SDK is the recommended route for all titles using any PlayFab services. 

However, if PlayFab Party is the only PlayFab service your title uses and your title only uses Xbox Live as an authentication provider, then use PlayFab Party's Xbox Live Helper Library.

* [PlayFab SDK](gdk-playfab-player-sign-in-steps.md#playfab-sdk)
* [PlayFab Party Xbox Live Helper Library](gdk-playfab-player-sign-in-steps.md#playfab-party-sdk)

#### Guidance for non-Microsoft Game Development Kit (GDK) titles 

PlayFab supports multiple platform authentication providers. When developing cross-platform titles that include other platforms such as mobile (Android and iOS) and non-Microsoft Game Development Kit (GDK) titles, sign players in to their PlayFab accounts using their preferred user authentication workflows. This means for users playing on Xbox or PC, provide Xbox Live sign in option. For users playing on Android, provide Google sign in option. For users playing on iOS devices, provide Apple ID sign in option.

To learn more, see [Platform-specific PlayFab authentication](/gaming/playfab/features/authentication/platform-specific-authentication/), [PlayFab SDK](/gaming/playfab/sdks/playfab-sdk-intro), and their specific user sign in developer documentation for latest guidance.

## See also

* [User identity and XUser](../system/overviews/user/player-identity-xuser.md)
* [Platform-specific PlayFab authentication](/gaming/playfab/features/authentication/platform-specific-authentication/)
* [Microsoft Store in-app purchase set up (NDA topic)](gdk-playfab-microsoft-store.md)
