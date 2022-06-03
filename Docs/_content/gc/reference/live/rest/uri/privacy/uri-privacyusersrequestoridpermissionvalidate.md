---
title: "/users/{requestorId}/permission/validate"
description: " /users/{requestorId}/permission/validate"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /users/{requestorId}/permission/validate
 
  * [URI parameters](#ID4EQ)
 
<a id="ID4EQ"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| requestorId| string| Required. Identifier of the user performing the action. The possible values are <code>xuid({xuid})</code> and <code>me</code>. This must be a logged-in user. Example value: <code>xuid(0987654321)</code>.| 
  
<a id="ID4ETB"></a>

 
## Valid methods

[GET (/users/{requestorId}/permission/validate)](uri-privacyusersrequestoridpermissionvalidateget.md)

&nbsp;&nbsp;Gets a yes-or-no answer about whether the user is allowed to perform the specified action with a target user.

[POST (/users/{requestorId}/permission/validate)](uri-privacyusersrequestoridpermissionvalidatepost.md)

&nbsp;&nbsp;Gets a set of yes-or-no answers about whether the user is allowed to perform specified actions with a set of target users.
 
<a id="ID4EAC"></a>

 
## See also
 
<a id="ID4ECC"></a>

   [Privacy URIs](atoc-reference-privacyv2.md)

 [PermissionId Enumeration](../../enums/privacy-enum-permissionid.md)

   