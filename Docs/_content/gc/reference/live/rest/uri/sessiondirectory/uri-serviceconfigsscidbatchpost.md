---
title: POST (/serviceconfigs/{scid}/batch)
description: " POST (/serviceconfigs/{scid}/batch)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# POST (/serviceconfigs/{scid}/batch)
Creates a batch query on multiple Xbox user IDs for the service configuration.

> **Important:**  
> This method is used by the 2015 Multiplayer and applies only to that multiplayer version and later. It is intended for use with template contract 104/105 or later, and requires a header element of X-Xbl-Contract-Version: 104/105 or later on every request.

  * [Remarks](#ID4ET)
  * [URI parameters](#ID4ELB)
  * [Query string parameters](#ID4EVB)
  * [HTTP status codes](#ID4EGF)
  * [Request body](#ID4ENF)
  * [Response body](#ID4EWF)

<a id="ID4ET"></a>


## Remarks

This HTTP/REST method creates batch queries on multiple Xbox user IDs at the service configuration ID (SCID) level. This method can be wrapped by **Microsoft.Xbox.Services.Multiplayer.MultiplayerService.GetSessionsForUsersFilterAsync**.

For 2015 Multiplayer, you can combine many queries into a single call if all the queries are the same but dealing with different Xbox user IDs (XUIDs), as represented in the *xuid* query string parameter. Note that the query string parameters, and the responses, are the same for regular queries and batch queries.

For a batch query, the sessions belonging to each XUID are written to the response in the same order as the *xuid* parameters are presented in the request. It is possible for the same session to appear multiple times in the response, once for each *xuid* that it matches.

<a id="ID4ELB"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- | --- |
| scid| GUID| Service configuration identifier (SCID). Part 1 of the session identifier.|

<a id="ID4EVB"></a>


## Query string parameters

A query can be modified using the query string parameters in the next table.

| <b>Parameter</b>| <b>Type</b>| <b>Description</b>|
| --- | --- | --- | --- | --- | --- | --- |
| keyword| string| A keyword, for example, "foo", that must be found in sessions or templates if they are to be retrieved. |
| xuid| 64-bit unsigned integer| The Xbox user ID, for example, "123", for sessions to include in the query. By default, the user must be active in the session for it to be included. |
| reservations| boolean| True to include sessions for which the user is set as a reserved player but has not joined to become an active player. This parameter is only used when querying your own sessions, or when querying a specific user's sessions server-to-server. |
| inactive| boolean| True to include sessions that the user has accepted but is not actively playing. Sessions in which the user is "ready" but not "active" count as inactive. |
| private| boolean| True to include private sessions. This parameter is only used when querying your own sessions, or when querying a specific user's sessions server-to-server. |
| visibility| string| Visibility state for the sessions. Possible values are defined by the <b>MultiplayerSessionVisibility</b>. If this parameter is set to "open", the query should include only open sessions. If it is set to "private", the <i>private</i> parameter must be set to true. |
| version| 32-bit signed integer| The maximum session version that should be included. For example, a value of 2 specifies that only sessions with a major session version of 2 or less should be included. The version number must be less than or equal to the request's contract version mod 100. |
| take| 32-bit signed integer| The maximum number of sessions to retrieve. This number must be between 0 and 100. |


Setting either *private* or *reservations* to true requires server-level access to the session. Alternatively, these settings require the caller's XUID claim to match the XUID filter in the URI. Otherwise, the HTTP/403 status code is returned, whether or not any such sessions actually exist.

<a id="ID4EGF"></a>


## HTTP status codes
The service returns an HTTP status code as it applies to MPSD.  
<a id="ID4ENF"></a>


## Request body


```cpp
{ "xuids": [ "1234", "5678" ] }

```


<a id="ID4EWF"></a>


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


<a id="ID4EDG"></a>


## See also

<a id="ID4EFG"></a>


##### Parent

[/serviceconfigs/{scid}/batch](uri-serviceconfigsscidbatch.md)