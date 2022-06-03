---
title: DELETE (/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName}/members/me)
description: " DELETE (/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName}/members/me)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# DELETE (/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName}/members/me)
Removes a member from a session.

> **Important:**  
> This URI method requires a header element of X-Xbl-Contract-Version: 104/105 or later on every request.

  * [Remarks](#ID4ET)
  * [URI parameters](#ID4E3)
  * [HTTP status codes](#ID4EHB)
  * [Request body](#ID4ENB)
  * [Response body](#ID4EYB)

<a id="ID4ET"></a>


## Remarks
All session member resource operations require an Xbox User ID (XUID) authorization.  
<a id="ID4E3"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- | --- |
| scid| GUID| Service configuration identifier (SCID). Part 1 of the session identifier.|
| sessionTemplateName| string| Name of the current instance of the session template. Part 2 of the session identifier.|
| sessionName| GUID| Unique ID of the session. Part 3 of the session identifier.|

<a id="ID4EHB"></a>


## HTTP status codes
The service returns an HTTP status code as it applies to MPSD.  
<a id="ID4ENB"></a>


## Request body

No objects are sent in the body of this request.

<a id="ID4EYB"></a>


## Response body
See the response structure in [MultiplayerSession (JSON)](../../json/json-multiplayersession.md).  
<a id="ID4EBC"></a>


## See also

<a id="ID4EDC"></a>


##### Parent

[/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName}/members/me](uri-serviceconfigsscidsessiontemplatessessiontemplatenamesessionssessionnamemembersme.md)