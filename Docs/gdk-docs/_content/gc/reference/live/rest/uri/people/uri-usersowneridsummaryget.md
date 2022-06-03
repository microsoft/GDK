---
title: GET (/users/{ownerId}/summary)
description: " GET (/users/{ownerId}/summary)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/users/{ownerId}/summary)
Gets summary data about the owner from the caller's perspective.

  * [URI parameters](#ID4EQ)
  * [Authorization](#ID4E2)
  * [Required Request Headers](#ID4EBC)
  * [Optional Request Headers](#ID4EHD)
  * [Request body](#ID4EXE)
  * [HTTP status codes](#ID4ECF)
  * [Required Response Headers](#ID4EZG)
  * [Response body](#ID4EGAAC)

<a id="ID4EQ"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- |
| ownerId| string| Identifier of the user whose resource is being accessed. The possible values are "me", xuid({xuid}), or gt({gamertag}). Example values: <code>me</code>, <code>xuid(2603643534573581)</code>, <code>gt(SomeGamertag)</code>|

<a id="ID4E2"></a>


## Authorization

| <b>Name</b>| <b>Type</b>| <b>Description</b>|
| --- | --- | --- | --- | --- | --- |
| xuid| 64-bit unsigned integer| Required. user identifier of the caller. Example value: 2533274790395904|

<a id="ID4EBC"></a>


## Required Request Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Authorization| string| Authorization data for . This is typically an encrypted XSTS token. Example value: <b>XBL3.0 x=[hash];[token]</b>.|

<a id="ID4EHD"></a>


## Optional Request Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| x-xbl-contract-version| string| Build name/number of the service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, etc. Example values: 1|
| Accept| string| Content-Types that are acceptable. All responses will be <code>application/json</code>.|

<a id="ID4EXE"></a>


## Request body

No objects are sent in the body of this request.

<a id="ID4ECF"></a>


## HTTP status codes

The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).

| Code| Reason phrase| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 200| OK| The session was successfully retrieved.|
| 400| Bad Request| User IDs were malformed.|
| 403| Forbidden| XUID claim could not be parsed from the authorization header.|

<a id="ID4EZG"></a>


## Required Response Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Content-Length| string| The number of bytes being sent in the response. Example value: 232.|
| Content-Type| string| MIME type of the response body. This must be <b>application/json</b>.|

<a id="ID4EGAAC"></a>


## Response body

See [PersonSummary (JSON)](../../json/json-personsummary.md).

<a id="ID4ESAAC"></a>


### Sample response


```cpp
{
    "targetFollowingCount": 87,
    "targetFollowerCount": 19,
    "isCallerFollowingTarget": true,
    "isTargetFollowingCaller": false,
    "hasCallerMarkedTargetAsFavorite": true,
    "hasCallerMarkedTargetAsKnown": true,
    "legacyFriendStatus": "None",
    "recentChangeCount": 5,
    "watermark": "5246775845000319351"
}

```


<a id="ID4E3AAC"></a>


## See also

<a id="ID4E5AAC"></a>


##### Parent

[/users/{ownerId}/summary](uri-usersowneridsummary.md)