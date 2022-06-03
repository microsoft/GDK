---
title: DELETE (/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName}/members/{index})
description: " DELETE (/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName}/members/{index})"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# DELETE (/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName}/members/{index})
Removes the specified members from a session.

> **Important:**  
> This URI method requires a header element of X-Xbl-Contract-Version: 104/105 or later on every request.

  * [URI parameters](#ID4ET)
  * [HTTP status codes](#ID4E5)
  * [Request body](#ID4EFB)
  * [Response body](#ID4EOB)

<a id="ID4ET"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- | --- |
| scid| GUID| Service configuration identifier (SCID). Part 1 of the session identifier.|
| sessionTemplateName| string| Name of the current instance of the session template. Part 2 of the session identifier.|
| sessionName| GUID| Unique ID of the session. Part 3 of the session identifier.|

<a id="ID4E5"></a>


## HTTP status codes
The service returns an HTTP status code as it applies to MPSD.  
<a id="ID4EFB"></a>


## Request body
See the request structure in [MultiplayerSessionRequest (JSON)](../../json/json-multiplayersessionrequest.md).  
<a id="ID4EOB"></a>


## Response body
See the response structure in [MultiplayerSession (JSON)](../../json/json-multiplayersession.md).  
<a id="ID4EYB"></a>