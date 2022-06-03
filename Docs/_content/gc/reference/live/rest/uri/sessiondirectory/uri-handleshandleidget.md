---
title: GET (/handles/{handle-id})
description: " GET (/handles/{handle-id})"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/handles/{handle-id})
Retrieves handles specified by handle ID.

> **Important:**  
> This method is used by the 2015 Multiplayer and applies only to that multiplayer version and later. It is intended for use with template contract 104/105 or later, and requires a header element of X-Xbl-Contract-Version: 104/105 or later on every request.

  * [Remarks](#ID4ET)
  * [URI parameters](#ID4EDB)
  * [HTTP status codes](#ID4EOB)
  * [Request body](#ID4EUB)
  * [Response body](#ID4E5B)

<a id="ID4ET"></a>


## Remarks

This HTTP/REST method gets the users' current activity for the session, for the specified handles. The return is the session object, with all its attributes. This method can be wrapped by **Microsoft.Xbox.Services.Multiplayer.MultiplayerService.GetCurrentSessionByHandleAsync**.

The caller of this method obtains the handle ID from a player's **MultiplayerActivityDetails** object. Alternatively, the caller gets the ID from a protocol activation after a user has accepted a game invite.

<a id="ID4EDB"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- | --- |
| handleId| GUID| The unique ID of the handle for the session.|

<a id="ID4EOB"></a>


## HTTP status codes
The service returns an HTTP status code as it applies to MPSD.  
<a id="ID4EUB"></a>


## Request body

No objects are sent in the body of this request.

<a id="ID4E5B"></a>


## Response body
See the response structure in [MultiplayerSession (JSON)](../../json/json-multiplayersession.md).  
<a id="ID4EKC"></a>


## See also

<a id="ID4EMC"></a>


##### Parent

[/handles/{handleId}](uri-handleshandleid.md)