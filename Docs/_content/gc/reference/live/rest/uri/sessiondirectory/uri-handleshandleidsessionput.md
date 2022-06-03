---
title: PUT (/handles/{handle-id}/session)
description: " PUT (/handles/{handle-id}/session)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# PUT (/handles/{handle-id}/session)
Creates or updates a session by dereferencing a handle.

> **Important:**  
> This method is used by the 2015 Multiplayer and applies only to that multiplayer version and later. It is intended for use with template contract 104/105 or later, and requires a header element of X-Xbl-Contract-Version: 104/105 or later on every request.

  * [Remarks](#ID4ET)
  * [URI parameters](#ID4ECB)
  * [HTTP status codes](#ID4ENB)
  * [Request body](#ID4EUB)
  * [Response body](#ID4E6B)

<a id="ID4ET"></a>


## Remarks

This HTTP/REST method writes a new or updated session to the multiplayer service, using the supplied session handle ID. The result is an object representing the new or updated session as returned from the server. This method can be wrapped by **Microsoft.Xbox.Services.Multiplayer.MultiplayerService.WriteSessionByHandleAsync**.

The caller of this method obtains the handle ID from a player's **MultiplayerActivityDetails** object. Alternatively, the caller gets the ID from a protocol activation after a user has accepted a game invite.

<a id="ID4ECB"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- | --- |
| handleId| GUID| The unique ID of the handle for the session.|

<a id="ID4ENB"></a>


## HTTP status codes
The service returns an HTTP status code as it applies to MPSD.  
<a id="ID4EUB"></a>


## Request body

No objects are sent in the body of this request.

<a id="ID4E6B"></a>


## Response body

No objects are sent in the body of the response.

<a id="ID4EKC"></a>


## See also

<a id="ID4EMC"></a>


##### Parent

[/handles/{handleId}/session](uri-handleshandleidsession.md)