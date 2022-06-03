---
title: "/users/{ownerId}/summary"
description: " /users/{ownerId}/summary"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /users/{ownerId}/summary
Accesses summary data about the owner from the caller's perspective.

  * [URI parameters](#ID4EQ)

<a id="ID4EQ"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- |
| ownerId| string| Identifier of the user whose resource is being accessed. The possible values are "me", xuid({xuid}), or gt({gamertag}). Example values: <code>me</code>, <code>xuid(2603643534573581)</code>, <code>gt(SomeGamertag)</code>|

<a id="ID4ESB"></a>


## Valid methods

[GET (/users/{ownerId}/summary)](uri-usersowneridsummaryget.md)

&nbsp;&nbsp;Gets summary data about the owner from the caller's perspective.

<a id="ID4E3B"></a>


## See also

<a id="ID4E5B"></a>


##### Parent