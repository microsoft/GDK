---
title: "/users/{ownerId}/people/mute"
description: " /users/{ownerId}/people/mute"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /users/{ownerId}/people/mute
Accesses the mute list for a user.

  * [URI parameters](#ID4EQ)

<a id="ID4EQ"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- |
| ownerId| string| Required. Identifier of the user whose resource is being accessed. The possible values are "me", <code>xuid({xuid})</code>, or gt({gamertag}). Must be the authenticated user. Example values: <code>xuid(2603643534573581)</code>, <code>gt(SomeGamertag)</code>. Maximum size: none. |

<a id="ID4ETB"></a>


## Valid methods

[GET (/users/{ownerId}/people/mute)](uri-privacyusersowneridpeoplemuteget.md)

&nbsp;&nbsp;Gets the mute list for a user.

<a id="ID4E4B"></a>


## See also

<a id="ID4E6B"></a>


##### Parent

[Privacy URIs](atoc-reference-privacyv2.md)