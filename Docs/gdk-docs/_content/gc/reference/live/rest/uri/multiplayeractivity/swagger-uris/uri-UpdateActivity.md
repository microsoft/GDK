---
title: PUT /titles/{titleId}/users/{xuid}/activities
description: PUT /titles/{titleId}/users/{xuid}/activities
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Update Activity

Sets or updates the activity for a user playing a specific title.
This API allows a game client or server to set/update the multiplayer activity for a user playing a particular title. The activity must be set as soon as the user is active in a multiplayer activity. Xbox Live users will be able to subscribe to changes in activity for other users (generally friends) and these updates will be pushed to the Xbox clients via RTA.

```http
PUT /titles/{titleId}/users/{xuid}/activities
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

<a id="request-body"></a>

## Request body

| Name| Required| Type| Description|
|---|---|---|---|
| connectionString| TRUE| string| The connection string is the object passed to the connecting client in order to join the game. The connection string usually contains information like the server IP to enable the joining user to connect. The length of the connection string is restricted to 512 characters.|
| joinRestriction| TRUE| JoinRestriction| The setting which enables who can join the current player.|
| sequenceNumber| TRUE| string| This is a string representation of a monotonically increasing number (ulong) that the client must pass in for each request. It is used to guarantee the ordering of the updates to an activity. A good example of a sequenceNumber can be the unix time of the client since it's guaranteed to be increasing. Must be greater than 0, and cannot be greater than the maximum ulong.|
| currentPlayers| | integer| The number of players already playing with the user in a multiplayer activity.|
| groupId| | string| A unique identifier to group all the users playing as part of the same game.|
| maxPlayers| | integer| The maximum number of players who can play with this player in the current activity.|
| platform| | [Platform](#platform)| |

<a id="responses"></a>

## Responses

| Name| Type| Description|
| --- | --- | --- |
| 204 No Content| | The activity was set successfully.|
| 400 Bad Request| [ErrorResponse](#errorresponse)| An error occurred while processing the request. Possible error codes: "RequestValidationError: The request validation has failed.", " AuthorizationError: The caller is not allowed to access the resource. Too many requests."|
| Other Status Codes| [ThrottledEntity](#throttledentity)| Too many requests. Headers Retry-After: integer|

<a id="definitions"></a>

## Definitions

* [ErrorResponse](#errorresponse)
* [JoinRestriction](#joinrestriction)
* [Platform](#platform)
* [SetActivityRequest](#setactivityrequest)
* [ThrottleEntity](#throttleentity)

<a id="errorresponse"></a>

### ErrorResponse

| Name| Type| Description|
|----|----|----|
| debugMessage| string| Human readable version of the error message that can be used for debugging.|
| errorCode| string| Error code enum.|

<a id="joinrestriction"></a>

### JoinRestriction
	
The setting which enables who can join the current player.

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
| Scarlett| string| |
| Win32| string| |
| WindowsOneCore| string| |
| XboxOne| string| |

<a id="setactivityrequest"></a>

## SetActivityRequest

If the platform for the activity is set within the request it will only be joinable on that platform. If the platform is not set then the activity would be joinable on all platforms that the game is available to be played on.

| Name| Type| Description|
|----|----|----|
| connectionString| string| The connection string is the object passed to the connecting client in order to join the game. The connection string usually contains information like the server IP to enable the joining user to connect. The length of the connection string is restricted to 512 characters.|
| currentPlayers| integer| The number of players already playing with the user in a multiplayer activity.|
| groupId| string| A unique identifier to group all the users playing as part of the same game.|
| joinRestriction| [JoinRestriction](#joinrestriction)| The setting which enables who can join the current player.|
| maxPlayers| integer| The maximum number of players who can play with this player in the current activity.|
| platform| [Platform](#platform)| |
| sequenceNumber| string| This is a string representation of a monotonically increasing number (ulong) that the client must pass in for each request. It is used to guarantee the ordering of the updates to an activity. A good example of a sequenceNumber can be the unix time of the client since it's guaranteed to be increasing. Must be greater than 0, and cannot be greater than the maximum ulong.|

<a id="throttleentity"></a>

### ThrottledEntity

| Name | Type | Description |
|-------|-----|-----|
| currentRequests| string | Current number of requests - concurrency or rate. |
| debugMessage| string| Human readable version of the throttle message that can be used for debugging.|
| limitType | string | The limit type i.e. concurrency or rate.|
| maxRequests| string| Max request allowed - concurrency or rate. |
| periodInSeconds| string| The period in seconds that applies when rate or concurrency limits are exceeded.|
| version| string| Current throttle contract version.|
