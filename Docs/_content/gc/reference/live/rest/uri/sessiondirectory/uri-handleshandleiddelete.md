---
title: DELETE (/handles/{handleId})
description: " DELETE (/handles/{handleId})"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# DELETE (/handles/{handleId})
Deletes handles specified by handle ID.

> **Important:**  
> This method is used by the 2015 Multiplayer and applies only to that multiplayer version and later. It is intended for use with template contract 104/105 or later, and requires a header element of X-Xbl-Contract-Version: 104/105 or later on every request.

  * [Remarks](#ID4ET)
  * [URI parameters](#ID4EAB)
  * [HTTP status codes](#ID4ELB)
  * [Request body](#ID4ESB)
  * [Response body](#ID4E4B)

<a id="ID4ET"></a>


## Remarks
This HTTP/REST method deletes the handles for the specified ID and clears the user's current activity for the session. This method can be wrapped by **Microsoft.Xbox.Services.Multiplayer.MultiplayerService.ClearActivityAsync**.  
<a id="ID4EAB"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- | --- |
| handleId| GUID| The unique ID of the handle for the session.|

<a id="ID4ELB"></a>


## HTTP status codes
The service returns an HTTP status code as it applies to MPSD.  
<a id="ID4ESB"></a>


## Request body

No objects are sent in the body of this request.

<a id="ID4E4B"></a>


## Response body

No objects are sent in the body of the response.

<a id="ID4EIC"></a>


## See also

<a id="ID4EKC"></a>


##### Parent

[/handles/{handleId}](uri-handleshandleid.md)