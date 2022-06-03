---
title: GET (/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName})
description: " GET (/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName})"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName})
Gets a session object.

> **Important:**  
> This URI method requires a header element of X-Xbl-Contract-Version: 104/105 or later on every request.

  * [Remarks](#ID4ET)
  * [URI parameters](#ID4EMB)
  * [HTTP status codes](#ID4EZB)
  * [Request body](#ID4E6B)
  * [Response body](#ID4EKC)

<a id="ID4ET"></a>


## Remarks

This HTTP/REST method reads a session document for the specified name and retrieves the session. On success, it returns the session object, with all its attributes, obtained from the server. This method can be wrapped by **Microsoft.Xbox.Services.Multiplayer.MultiplayerService.GetCurrentSessionAsync**. The parameters for the GET method directly parallel those specified in the **MultiplayerSessionReference** object for the session, passed in the *sessionReference* parameter of **GetCurrentSessionAsync**.

The wire format for the GET method is shown below.

```cpp
GET /serviceconfigs/00000000-0000-0000-0000-000000000000/sessiontemplates/quick/sessions/00000000-0000-0000-0000-000000000001 HTTP/1.1
      Content-Type: application/json

```



<a id="ID4EMB"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- | --- |
| scid| GUID| Service configuration identifier (SCID). Part 1 of the session identifier.|
| sessionTemplateName| string| Name of the current instance of the session template. Part 2 of the session identifier.|
| sessionName| GUID| Unique ID of the session. Part 3 of the session identifier.|

<a id="ID4EZB"></a>


## HTTP status codes
The service returns an HTTP status code as it applies to MPSD.  
<a id="ID4E6B"></a>


## Request body

No objects are sent in the body of this request.

<a id="ID4EKC"></a>


## Response body
See the response structure in [MultiplayerSession (JSON)](../../json/json-multiplayersession.md).  
<a id="ID4ETC"></a>


## See also

<a id="ID4EVC"></a>


##### Parent

[/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName}](uri-serviceconfigsscidsessiontemplatessessiontemplatenamesessionssessionname.md)