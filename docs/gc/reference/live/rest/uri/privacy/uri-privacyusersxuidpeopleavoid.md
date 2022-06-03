---
title: "/users/{ownerId}/people/avoid"
description: " /users/{ownerId}/people/avoid"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /users/{ownerId}/people/avoid
Accesses the Avoid list for a user

  * [URI parameters](#ID4EQ)

<a id="ID4EQ"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- |
| ownerId| string| Required. Identifier of the user whose resource is being accessed. The possible values are <code>xuid({xuid})</code>. Must be the authenticated user. Example value: <code>xuid(2603643534573581)</code>. Maximum size: none. |

<a id="ID4ERB"></a>


## Valid methods

[GET (/users/{ownerId}/people/avoid)](uri-privacyusersxuidpeopleavoidget.md)

&nbsp;&nbsp;Gets the Avoid list for a user.

<a id="ID4E2B"></a>


## See also

<a id="ID4E4B"></a>


##### Parent

[Privacy URIs](atoc-reference-privacyv2.md)