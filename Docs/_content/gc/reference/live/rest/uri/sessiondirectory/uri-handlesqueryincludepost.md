---
title: POST (/handles/query?include=relatedInfo)
description: " POST (/handles/query?include=relatedInfo)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# POST (/handles/query?include=relatedInfo)
Creates queries for session handles that include related session information.

> **Important:**  
> This method is used by the 2015 Multiplayer and applies only to that multiplayer version and later. It is intended for use with template contract 104/105 or later, and requires a header element of X-Xbl-Contract-Version: 104/105 or later on every request.

  * [Remarks](#ID4ET)
  * [URI parameters](#ID4ECB)
  * [Query string parameters](#ID4EPB)
  * [HTTP status codes](#ID4EAF)
  * [Request body](#ID4EHF)
  * [Response body](#ID4EZF)

<a id="ID4ET"></a>


## Remarks

This HTTP/REST method creates queries for handle data with session information specified in the "include" query string. The query string value is designed to be extensible to support future query options, supporting a comma-delimited list, for example, "?include=relatedInfo,session". The POST method can be wrapped by **Microsoft.Xbox.Services.Multiplayer.MultiplayerService.GetActivitiesForUsersAsync**.

The type field in the request body for this method must be set to "activity". The items in the response body map directly to the properties of the **Microsoft.Xbox.Services.Multiplayer.MultiplayerActivityDetails**.

<a id="ID4ECB"></a>


## URI parameters

<a id="ID4EPB"></a>


## Query string parameters

A query can be modified using the query string parameters in the next table.

| <b>Parameter</b>| <b>Type</b>| <b>Description</b>|
| --- | --- | --- | --- |
| keyword| string| A keyword, for example, "foo", that must be found in sessions or templates if they are to be retrieved. |
| xuid| 64-bit unsigned integer| The Xbox user ID, for example, "123", for sessions to include in the query. By default, the user must be active in the session for it to be included. |
| reservations| boolean| True to include sessions for which the user is set as a reserved player but has not joined to become an active player. This parameter is only used when querying your own sessions, or when querying a specific user's sessions server-to-server. |
| inactive| boolean| True to include sessions that the user has accepted but is not actively playing. Sessions in which the user is "ready" but not "active" count as inactive. |
| private| boolean| True to include private sessions. This parameter is only used when querying your own sessions, or when querying a specific user's sessions server-to-server. |
| visibility| string| Visibility state for the sessions. Possible values are defined by the <b>Microsoft.Xbox.Services.Multiplayer.MultiplayerSessionVisibility</b>. If this parameter is set to "open", the query should include only open sessions. If it is set to "private", the <i>private</i> parameter must be set to true. |
| version| 32-bit signed integer| The maximum session version that should be included. For example, a value of 2 specifies that only sessions with a major session version of 2 or less should be included. The version number must be less than or equal to the request's contract version mod 100. |
| take| 32-bit signed integer| The maximum number of sessions to retrieve. This number must be between 0 and 100. |


Setting either *private* or *reservations* to true requires server-level access to the session. Alternatively, these settings require the caller's XUID claim to match the XUID filter in the URI. Otherwise, the HTTP/403 status code is returned, whether or not any such sessions actually exist.

<a id="ID4EAF"></a>


## HTTP status codes
The service returns an HTTP status code as it applies to MPSD.  
<a id="ID4EHF"></a>


## Request body

<a id="ID4ENF"></a>


### Sample request

To get all activities for a user's "favorites" social graph, the POST body looks like this:


```cpp
{
  "type": "activity",
  "scid": "B5B1F71F-A328-4371-89E0-C3AD222D0E92"  // optional filter on scid
  "owners": {
     "people": {
       "moniker": "favorites",
       "monikerXuid": "3210"
     }
  }
}

```


<a id="ID4EZF"></a>


## Response body

The results are returned as an array of handle structures, with a unique ID embedded in each handle. The specific session information is returned in the **relatedInfo** object. Note that this information is not returned for the regular POST method on this URI.

<a id="ID4EDG"></a>


### Sample response


```cpp
{
	"results": [{
		"id": "11111111-ebe0-42da-885f-033860a818f6",
		"type": "activity",
		"version": 1,
		"sessionRef": {
			"scid": "8dfb0100-ebe0-42da-885f-033860a818f6",
			"templateName": "party",
			"name": "e3a836aeac6f4cbe9bcab985494d3175"
		},

    "titleId": "1234567",
    "ownerXuid": "3212",

    // Only if ?include=relatedInfo
		"relatedInfo": {
			"visibility": "open",
			"joinRestriction": "followed",
			"closed": true,
			"maxMembersCount": 8,
			"membersCount": 4,
		}
	},
	{
		"id": "11111111-ebe0-42da-885f-033860a818f7",
		"type": "activity",
		"version": 1,
		"sessionRef": {
			"scid": "8dfb0100-ebe0-42da-885f-033860a818f6",
			"templateName": "TitleStorageTestDefault",
			"name": "795fcaa7-8377-4281-bd7e-e86c12843632"
		},
    "titleId": "1234567",
    "ownerXuid": "3212",

    // Only if ?include=relatedInfo
		"relatedInfo": {
			"visibility": "open",
			"joinRestriction": "followed",
			"closed": false,
			"maxMembersCount": 8,
			"membersCount": 4,
		}
	}]
}

```


<a id="ID4ENG"></a>


## See also

<a id="ID4EPG"></a>


##### Parent

[/handles/query](uri-handlesquery.md)