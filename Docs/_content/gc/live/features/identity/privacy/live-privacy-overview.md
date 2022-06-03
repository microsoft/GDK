---
title: Privacy and permissions overview
description: Describes how the Xbox Live Privacy service protects users by respecting their preferences and providing the social experiences they want.
kindex:
- Privacy and Permissions overview
- permissions
ms.topic: conceptual
ms.localizationpriority: medium
author: joannaleecy
ms.author: jodoyle
ms.date: 05/12/2020
edited: 02/18/2021
security: public
---

# Privacy and permissions overview

Use this topic to check and resolve privacy and permissions issues in your title.  
  
The Xbox Live Privacy service protects users by respecting their preferences and providing the social experiences they want. 
The Privacy service supports permission checking, muting users, and avoiding users by using Xbox Live Services API (XSAPI) and Xbox Live REST endpoints.  

For more information, see [XSAPI Overview](/gaming/xbox-live/api-ref/xsapi/live-introduction-to-xbox-live-apis).
> [!NOTE]
> You can't retrieve or set a user's privacy settings with the Privacy service.


## Permission checks

Permission checks are the primary capability that are provided by the Privacy service. 
These checks function by determining whether a user can perform an action with another user, or set of users.  

For example, if you want to know if a user can communicate with a target, the Privacy service bases its answer on a range of relevant criteria including the following scenarios.  
 * Do both users' settings permit this scenario?
 * What is the relationship between the users?
 * Is the actor on the Avoid list of the target?

Xbox Privacy Service supports cross-network communication permission checks. Xbox users can decide whether to communicate with friends on other networks (**crossNetworkFriends**) or everyone on those networks (**crossNetworkUsers**). 
The privacy service enables titles to verify whether **crossNetworkUsers** or **crossNetworkFriends** can communicate with the user via the following permission checks CommunicateUsingText, CommunicateUsingVideo, CommunicateUsingVoice. 
Note. Cross-network communication is the only cross-network scenario that privacy service permissions support.

For more information, see [XblPrivacyCheckPermissionAsync](../../../../reference/live/xsapi-c/privacy_c/functions/xblprivacycheckpermissionasync.md) and [GET (/users/{requestorId}/permission/validate)](/gaming/xbox-live/api-ref/xbox-live-rest/uri/privacy/uri-privacyusersrequestoridpermissionvalidateget).


## Mute list

Your title can retrieve a user's Mute list with the Privacy service. 
A Mute list specifies up to 250 users that the list owner doesn't want to hear from via voice communication. 
> [!NOTE]
> The Mute list controls voice communication, but it doesn't affect text communication. 

By default, all relevant permission checks incorporate Mute lists. 
This means that you don't have to run extra checks for the Mute list in addition to checking other permissions.  

For example, if you want to know if a user can voice-chat with another user, the Privacy service checks 
the user's Mute list as part of the permission check. Your code doesn't need to also check the Mute list. 
However, you might find some scenarios where it's helpful to retrieve a Mute list. 
> [!NOTE]
> Games aren't allowed to add people to a user's Mute list.

For more information, see [XblPrivacyGetMuteListAsync](../../../../reference/live/xsapi-c/privacy_c/functions/xblprivacygetmutelistasync.md) and [GET (/users/{ownerId}/people/mute)](/gaming/xbox-live/api-ref/xbox-live-rest/uri/privacy/uri-privacyusersowneridpeoplemuteget).


## Avoid list

Your title can also retrieve a user's Avoid list with the Privacy service. 
An avoid list holds up to 1,000 Xbox Live users that the owner has blocked to prevent communication in any form, 
such as voice, text, game invites, or club invites.  

Retrieving the Avoid list can be valuable, but checking the Avoid list is also part of all relevant permission checks.

For example, if you want to know if a user can send a text message to another user, the Privacy service consults 
the Avoid list as part of the permission check. Your code doesn't need to also check the Avoid list.
> [!NOTE]
> Games aren't allowed to add people to a user's Avoid list.

For more information, see [XblPrivacyGetAvoidListAsync](../../../../reference/live/xsapi-c/privacy_c/functions/xblprivacygetavoidlistasync.md) and [GET (/users/{ownerId}/people/avoid)](/gaming/xbox-live/api-ref/xbox-live-rest/uri/privacy/uri-privacyusersxuidpeopleavoidget). 

## See also 
  
[Xbox Live overview](../../../get-started/live-xbl-overview.md)  
[Getting started with Xbox Live APIs](../../../get-started/live-gs-xbl-apis.md)  
[Xbox Live features](../../live-features-nav.md)