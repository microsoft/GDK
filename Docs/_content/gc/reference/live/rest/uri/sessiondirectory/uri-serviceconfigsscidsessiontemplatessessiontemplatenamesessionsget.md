---
title: GET (/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions)
description: " GET (/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions)
Retrieves session template documents.

> **Important:**  
> This URI method requires a header element of X-Xbl-Contract-Version: 104/105 or later on every request.

  * [Remarks](#ID4ET)
  * [URI parameters](#ID4EKB)
  * [HTTP status codes](#ID4EXB)
  * [Request body](#ID4EAC)
  * [Response body](#ID4EKC)

<a id="ID4ET"></a>


## Remarks

This HTTP/REST method retrieves session template information for the supplied filters. This method can be wrapped by **Microsoft.Xbox.Services.Multiplayer.MultiplayerService.GetSessionsAsync**.


> **Note:**   
> For 2015 Multiplayer, this method is called by <b>Microsoft.Xbox.Services.Multiplayer.MultiplayerService.GetSessionsForUsersFilterAsync</b>.  



> **Note:**   
> Every call to this method must include either a keyword, an Xbox user ID filter, or both. If the caller does not have correct permissions for the <i>private</i> and <i>reservations</i> parameters, the method returns an error code of 403 Forbidden, whether or not any such sessions actually exist.  


<a id="ID4EKB"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- | --- | --- | --- |
| scid| GUID| Service configuration identifier (SCID). Part 1 of the session ID.|
| keyword| string| A keyword used to filter results to just sessions identified with that string.|
| xuid| GUID| Xbox user IDs for the users for whom to retrieve sessions. The users must be active in the sessions. |
| reservations| string| Value indicating if the list of sessions includes those that the users have not accepted. This parameter can only be set to true. This setting requires the caller to have server-level access to the session, or the caller's XUID claim to match the Xbox user ID filter. |
| inactive| string| Value indicating if the list of sessions includes those that the users have accepted but are not actively playing. This parameter can only be set to true. |
| private| string| Value indicating if the list of sessions includes private sessions. This parameter can only be set to true. It is valid only when querying your own sessions, or when querying server-to-server. Setting this parameter to true requires the caller to have server-level access to the session, or the caller's XUID claim to match the Xbox user ID filter. |
| visibility| string| An enumeration value indicating visibility status used in filtering results. Currently this parameter can only be set to Open to include open sessions. See <b>MultiplayerSessionVisibility</b>. |
| version| string| A positive integer indicating the major session version or lower of the sessions to include. The value must be less than or equal to the request's contract version modulo 100. |
| take| string| A positive integer indicating the maximum number of sessions to retrieve.|

<a id="ID4EXB"></a>


## HTTP status codes
The service returns an HTTP status code as it applies to MPSD.  
<a id="ID4EAC"></a>


## Request body

No objects are sent in the body of this request.

<a id="ID4EKC"></a>


## Response body

The return from this method is a JSON array of session references, with some session data included inline.


```cpp
{
    "results": [ {
            "xuid": "9876",    // If the session was found from a xuid, that xuid.
            "startTime": "2009-06-15T13:45:30.0900000Z",
            "sessionRef": {
                "scid": "foo",
                "templateName": "bar",
                "name": "session-seven"
            },
            "accepted": 4,    // Approximate number of non-reserved members.
            "status": "active",    // or "reserved" or "inactive". This is the state of the user in the session, not the session itself. Only present if the session was found using a xuid.
            "visibility": "open",    // or "private", "visible", or "full"
            "joinRestriction": "local",    // or "followed". Only present if 'visibility' is "open" or "full" and the session has a join restriction.
            "myTurn": true,    // Not present is the same as 'false'. Only present if the session was found using a xuid.
            "keywords": [ "one", "two" ]
        }
    ]
}

```


<a id="ID4EUC"></a>


## See also

<a id="ID4EWC"></a>


##### Parent

[/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions](uri-serviceconfigsscidsessiontemplatessessiontemplatenamesessions.md)