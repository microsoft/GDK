---
title: GET (/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName})
description: " GET (/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName})"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName})
Retrieves a set of session template names.

> **Important:**  
> This URI method requires a header element of X-Xbl-Contract-Version: 104/105 or later on every request.

  * [URI parameters](#ID4ET)
  * [HTTP status codes](#ID4E5)
  * [Request body](#ID4EFB)
  * [Response body](#ID4EQB)

<a id="ID4ET"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- | --- |
| scid| GUID| Service configuration identifer (SCID). Part 1 of the session ID.|
| sessionTemplateName| string| Name of the current instance of the session template. Part 2 of the session ID. |

<a id="ID4E5"></a>


## HTTP status codes
The service returns an HTTP status code as it applies to MPSD.  
<a id="ID4EFB"></a>


## Request body

No objects are sent in the body of this request.

<a id="ID4EQB"></a>


## Response body


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


<a id="ID4EZB"></a>


## See also

<a id="ID4E2B"></a>


##### Parent

[/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}](uri-serviceconfigsscidsessiontemplatessessiontemplatename.md)