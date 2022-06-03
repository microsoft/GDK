---
title: PermissionId Enumeration
description: " PermissionId Enumeration"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# PermissionId Enumeration
Details the PermissionId enumeration.
Permission IDs can be used with the permission validation URLs:

   * [GET (/users/{requestorId}/permission/validate)](../uri/privacy/uri-privacyusersrequestoridpermissionvalidateget.md)
   * [POST (/users/{requestorId}/permission/validate)](../uri/privacy/uri-privacyusersrequestoridpermissionvalidatepost.md)

These IDs include direct checks against a particular setting for a user, such as checking a single privacy setting of a target, or a single privilege actor. In addition, there are permission IDs that can be used with the permission API and incorporate checks against multiple settings for specific user actions.

<a id="ID4EIB"></a>


## Permissions

These are values that a caller can use to check whether a specific action can be performed. Unlike the settings above, these encapsulate policies defined by the service and cannot be directly changed by users, though in most cases, the policies build on top of one or more settings whose values are defined by users. These are usually composite checks against more than one setting defined above. Example: The <b>ViewProfile</b> permission does a check of the target's <b>ShareProfile</b> privacy setting and the requestor's <b>AllowProfileViewing</b> privilege.

In general, it's recommended that callers request a permission ID for actions that need to be checked, rather than directly checking privacy settings and privileges. This allows privacy policies to be changed consistently across the service as new checks are incorporated.

| Permission Name| Description|
| --- | --- |
| CommunicateUsingText| Check whether or not the user can send a message with text content to the target user|
| CommunicateUsingVideo| Check whether or not the user can communicate using video with the target user|
| CommunicateUsingVoice| Check whether or not the user can communicate using voice with the target user|
| ViewTargetProfile| Check whether or not the user can view the profile of the target user|
| ViewTargetGameHistory| Check whether or not the user can view the game history of the target user|
| ViewTargetVideoHistory| Check whether or not the user can view the detailed video watching history of the target user|
| ViewTargetMusicHistory| Check whether or not the user can view the detailed music listening history of the target user|
| ViewTargetExerciseInfo| Check whether or not the user can view the exercise info of the target user|
| ViewTargetPresence| Check whether or not the user can view the online status of the target user|
| ViewTargetVideoStatus| Check whether or not the user can view the details of the targets video status (extended online presence)|
| ViewTargetMusicStatus| Check whether or not the user can view the details of the targets music status (extended online presence)|
| ViewTargetUserCreatedContent| Check whether or not the user can view the user-created content of other users|