---
title: GET (/handles/{handleId}/session)
description: " GET (/handles/{handleId}/session)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/handles/{handleId}/session)
Gets a session object for the specified handle identifier.

> **Important:**  
> This method is used by the 2015 Multiplayer and applies only to that multiplayer version and later. It is intended for use with template contract 104/105 or later, and requires a header element of X-Xbl-Contract-Version: 104/105 or later on every request.

  * [Remarks](#ID4ET)
  * [URI parameters](#ID4EDB)
  * [HTTP status codes](#ID4EOB)
  * [Request body](#ID4EVB)
  * [Response body](#ID4E6B)

<a id="ID4ET"></a>


## Remarks

This HTTP/REST method retrieves a session object from the server, using the supplied service-side pointer to the session (handle). The return is the session object, with all its attributes. This method can be wrapped by **Microsoft.Xbox.Services.Multiplayer.MultiplayerService.GetCurrentSessionByHandleAsync**.

The caller of this method obtains the handle ID from a player's **MultiplayerActivityDetails** object. Alternatively, the caller gets the ID from a protocol activation after a user has accepted a game invite.

<a id="ID4EDB"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- | --- |
| handleId| GUID| The unique ID of the handle for the session.|

<a id="ID4EOB"></a>


## HTTP status codes
The service returns an HTTP status code as it applies to MPSD.  
<a id="ID4EVB"></a>


## Request body

No objects are sent in the body of this request.

<a id="ID4E6B"></a>


## Response body
See the response structure in [MultiplayerSession (JSON)](../../json/json-multiplayersession.md).  
<a id="ID4EIC"></a>


## See also

<a id="ID4EKC"></a>


##### Parent

[/handles/{handleId}/session](uri-handleshandleidsession.md)