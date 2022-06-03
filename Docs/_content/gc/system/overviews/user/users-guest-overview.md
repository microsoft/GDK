---
author: M-Stahl
title: Guest users
description: Describes Xbox Live Guest Accounts and their interaction with Xbox Live Services.
kindex: Guest user
ms.author: scmatlof
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# Guest Users Overview

Guest Users, also known as ___Sponsored Guests___ or ___Guest Accounts___, allow players to interact with many Xbox Live services without needing to create a full Xbox Live account. When a title allows guest accounts to participate, it is using Sponsored Guests to facilitate this.
> [!NOTE]
> There exists another type of guest account known as a ___Pure Guest___.  This is the type of account which exists in the absence of a signed in account.  It cannot make authenticated Xbox Live service calls, nor can it play any games which require an Xbox Live user to be signed in.

Guest users are single-session accounts that are sponsored by another Xbox Live user already signed in to the device. It allows a player to interact with many Xbox Live services without needing to create a full Xbox Live account, and lasts until one of the following conditions is met:
* The guest account signs out
* The sponsoring user signs out
* The device is shut down

From the end user's perspective, Guest accounts allow a player to more easily join a local or online multiplayer game from the same console as their sponsor by lowering the barrier to entry. For a single gaming session, that guest enjoys many of the same benefits as the sponsor account, including voice communication.

## Supporting Guest Accounts in your title
Supporting guest users in your title is not required, but it is a great way to allow players without an Xbox Live account to experience your content on the sponsored device without requiring substantial changes to user handling. Similar to full Xbox Live users, Guest users can be signed in by calling [XUserAddAsync](../../../reference/system/xuser/functions/xuseraddasync.md) with the ```XUserAddOptions::AllowGuests``` option. On signing in, the guest is assigned an ```XUserHandle``` which works with all API's that take an ```XUserHandle``` as a parameter. 
> [!NOTE]
> A key difference between an Xbox Live user and a guest user is the ability to deterministically identify a user. When a guest is signed in, they do not have control over which account is chosen to sponsor it. If a guest signs out and then a guest signs in, you have no way of determining if it is the same user as before. Keep this in mind if you are considering storing player preferences or cached data with a specific user.

## Xbox Live Users vs Guests Users when interacting with Xbox Live Services
[XblContextCreateHandle](../../../reference/live/xsapi-c/xbox_live_context_c/functions/xblcontextcreatehandle.md) can then be called on that user in order to communicate with Xbox Live services. You can check if a user is a guest by calling [XUserGetIsGuest](../../../reference/system/xuser/functions/xusergetisguest.md) with a user handle.

Xbox Live user and Guest user differences are dependent on the API's being consumed. For services that fully support guest accounts, such as querying for another player's public profile information, both types of users behave identically using the privileges of the sponsor account.

Xbox Live Services which do not support guest users are typically ones that store or manage long-term data associated with a particular user (e.g. Statistics, Achievements, Social Relationships, etc.). Calls to those services will return an error (typically a `HTTP_E_STATUS_BAD_REQUEST`) when invoked with a guest user. 

>![Alert](../../../../../resources/gamecore/images/en-us/common/note.gif) It is the responsibility of the developer to avoid using guest accounts with API's that do not support them. A list of services and their level of support can be found below.

### Xbox Live User Account subscription status and parental controls
Since Guest accounts inherit the capabilities of the sponsor account, any limitations imposed by the type of subscription (Gold vs Silver) and any parental controls enabled for that account are also inherited.  For example, if the sponsor account has any privileges revoked by Xbox Live Enforcement, those privileges will be removed for the Guest user as well. 

## Support for Guest Accounts with Xbox Live Services

### Xbox Live API support for Guest Users
* Cloud Storage
    * Not Supported

* General
    * Real-Time Activity (RTA) support is determined by the services being subscribed to

* Identity
    * Authentication
        * Inherited from sponsor account
    * Privacy
        * Permission Checking / Mute / Avoid lists
            * Inherited from sponsor account
    * Privileges
        * Parental Controls
            * Inherited from sponsor account
        * Privacy Settings
            * Inherited from sponsor account
        * Privileges removed for sponsored guest accounts
            * XPRIVILEGE_BROADCAST
            * XPRIVILEGE_MANAGE_PROFILE_PRIVACY_SETTING
            * XPRIVILEGE_GAME_DVR
            * XPRIVILEGE_SOCIAL_NETWORK_SHARING
            * XPRIVILEGE_ADD_FRIEND
    * User Profile - Partial Support
        * Guests can view public Xbox profile data

* Multiplayer
    * Inherited from sponsor account

* Player-Data
    * Achievements - Not Supported
    * Stats - Not Supported

* Authenticated Custom Web Service and Service to Service Calls
    * Guest accounts can make authenticated calls to custom web services
    * Guest accounts can be used in service to service calls

* Social
    * Localized Strings - Not Supported
    * People-System - Not Supported
    * Presence - Not Supported
    * Reputation - Not Supported
    * Social Manager - Not Supported

### PlayFab
* PlayFab Party Chat
    * Guests inherit the permissions of the sponsored user and can participate if the sponsored account has multiplayer and communication privileges

## Frequently Asked Questions
### Can multiple guest accounts be signed in at the same time?
Multiple guest accounts can have the same sponsor and may be logged in simultaneously.

### Do guest accounts have access to device entitlements?
Device entitlements are propagated to the guest accounts the same way they are to Xbox Live users.

Guest accounts also have the same access to installed content as the sponsor account

### How do guest accounts interact with platforms that don't support guest accounts (e.g. PC, mobile)?
Guest accounts appear as normal accounts with the same permissions of the sponsor account and do not require additional code.

### How are guest accounts tested in certification?
Guest account functionality are not specifically tested in the certification process. Additionally, whether a title chooses to support guest accounts is up to the developer.

## See Also

[User identity and XUser](player-identity-xuser.md)

[Xbox Live User Privileges Overview](../../../live/features/identity/privileges/live-user-privileges-overview.md)

[Xbox Live User Client Privileges](../../../live/features/identity/privileges/concepts/live-user-privileges-client.md)