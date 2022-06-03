---
title: GET /titles/{titleId}/users/{xuid}/activities
description: GET /titles/{titleId}/users/{xuid}/activities
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Get Activity

Gets the activity for a user playing a specific title. This API allows a game client or server to get the activity for a user playing a particular title.

```http
GET /titles/{titleId}/users/{xuid}/activities
```

<a id="uri-parameters"></a>
 
## URI parameters

| Parameter| In | Required | Type| Description|
| --- | --- | --- | --- | --- |
| titleId| path | TRUE | integer | The titleId of the game that the request is being sent for.|
| xuid| path | TRUE | string | The XUID of the user being referred to in the current request. The XUID is represented as a base 10 integer.|
  
<a id="request-header"></a>

## Request header

| Name| Required | Type| Description|
| --- | --- | --- | --- |
| Authorization| TRUE | integer | Caller must supply an XToken in the XBL 3.0 authorization format. For example, Authorization: XBL3.0 x=2553948354698;<encrypted token>)|
| Content-Type| TRUE | string | ContentType must be set to application/json |

<a id="responses"></a>

## Responses

| Name| Type| Description|
| --- | --- | --- |
| 200 OK| GetActivityResponse| A return object with the activity for the given user.|
| 204 No Content| | The request was successful, but no activity was found to return.|
| 400 Bad Request| [ErrorResponse](#errorresponse)| An error occurred while processing the request. Possible error codes: "RequestValidationError: The request validation has failed.", " AuthorizationError: The caller is not allowed to access the resource. Too many requests."|
| Other Status Codes| [ThrottledEntity](#throttledentity)| Too many requests. Headers Retry-After: integer|

<a id="definitions"></a>

## Definitions

* [ErrorResponse](#errorresponse)
* [GetActivityResponse](#getactivityresponse)
* [JoinRestriction](#joinrestriction)
* [Platform](#platform)
* [ThrottledEntity](#throttledentity)

<a id="errorresponse"></a>

### ErrorResponse

| Name| Type| Description|
|----|----|----|
| debugMessage| string| Human readable version of the error message that can be used for debugging.|
| errorCode| string| Error code enum.|

<a id="getactivityresponse"></a>

### GetActivityResponse

| Name| Type| Description|
|----|----|----|
| connectionString| string| The connection string is the object passed to the connecting client in order to join the game. The connection string usually contains information like the server IP to enable the joining user to connect. The length of the connection string is restricted to 512 characters.|
| currentPlayers| integer| The number of players already playing with the user in a multiplayer activity.|
| groupId| string| A unique identifier to group all the users playing as part of the same game.|
| joinRestriction| [JoinRestriction](#joinrestriction)| The setting which enables who can join the current player.|
| maxPlayers| integer| The maximum number of players who can play with this player in the current activity.|
| platform| [Platform](#platform)| |
| sequenceNumber| string| This is a string representation of a monotonically increasing number (ulong) that the client must pass in for each request. It is used to guarantee the ordering of the updates to an activity. A good example of a sequenceNumber can be the unix time of the client since it's guaranteed to be increasing. Must be greater than 0, and cannot be greater than the maximum ulong.|
| titleId| integer| The titleId of the game for which the activity was requested.|

<a id="joinrestriction"></a>

### JoinRestriction

| Name| Type| Description|
| --- | --- | --- |
| Followed| string| |
| InviteOnly| string| |
| Public| string| |

<a id="platform"></a>

### Platform

| Name| Type| Description|
| --- | --- | --- |
| Android| string| |
| IOS| string| |
| Nintendo| string| |
| PlayStation| string| |

<a id="throttledentity"></a>

### ThrottledEntity

| Name | Type | Description |
|-------|-----|-----|
| currentRequests| string | Current number of requests - concurrency or rate. |
| debugMessage| string| Human readable version of the throttle message that can be used for debugging.|
| limitType | string | The limit type i.e. concurrency or rate.|
| maxRequests| string| Max request allowed - concurrency or rate. |
| periodInSeconds| string| The period in seconds that applies when rate or concurrency limits are exceeded.|
| version| string| Current throttle contract version.|
