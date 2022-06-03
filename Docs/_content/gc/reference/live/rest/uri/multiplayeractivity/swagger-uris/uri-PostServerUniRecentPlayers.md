---
title: POST /titles/{titleId}/recentplayers/server
description: POST /titles/{titleId}/recentplayers/server
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Post Server Recent Players

Appends to or updates a set of users' lists of recent players (unidirectional). This is essentially a batch API of the client API, for servers.

This API allows a game server to append to a set of users' lists of recent players, and to update existing recent player entries. Each user's recent players list is unidirectional.

```http
POST /titles/{titleId}/recentplayers/server
```
<a id="uri-parameters"></a>
 
## URI parameters

| Parameter| In | Required | Type| Description|
| --- | --- | --- | --- | --- |
| titleId| path | TRUE | integer | The titleId of the game that the request is being sent for.|
  
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
| recentPlayersByXuid| TRUE| [ServerRecentPlayersByXuid](#serverrecentplayersbyxuid)[]| Array of objects representing a XUID and their recent players. There should be at least 1 and at most 20 XUID entries.|

<a id="responses"></a>

## Responses

| Name| Type| Description|
| --- | --- | --- |
| 204 No Content| | The recent players request was sent successfully.|
| 400 Bad Request| [ErrorResponse](#errorresponse)| An error occurred while processing the request. Possible error codes: "RequestValidationError: The request validation has failed.", " AuthorizationError: The caller is not allowed to access the resource."|
| Other Status Codes| [ThrottledEntity](#throttledentity)| Too many requests. Headers Retry-After: integer|

<a id="definitions"></a>

## Definitions

* [EncounterType](#encountertype)
* [ErrorResponse](#errorresponse)
* [Network](#network)
* [ServerRecentPlayersByXuid](#serverrecentplayersbyxuid)
* [ServerRecentPlayersRequest](#serverrecentplayersrequest)
* [ThrottledEntity](#throttledentity)
* [UnidirectionalRecentPlayer](#unidirectionalrecentplayer)

<a id="encountertype"></a>

### EncounterType

The type of recent players encounter. This field is optional and defaults to Default. Default has no prescribed meaning - it is up to the caller to interpret this value appropriately.

| Name| Type| Description|
| --- | --- | --- |
| Default| string| |
| Opponent| string| |
| Teammate| string| |

<a id="errorresponse"></a>

### ErrorResponse

| Name| Type| Description|
|----|----|----|
| debugMessage| string| Human readable version of the error message that can be used for debugging.|
| errorCode| string| Error code enum.|

<a id="network"></a>

### Network

| Name| Type| Description|
|----|----|----|
| XboxLive| string| |

<a id="serverrecentplayersbyxuid"></a>

### ServerRecentPlayersByXuid

| Name| Type| Description|
|---|---|---|
| recentPlayers| [UnidirectionalRecentPlayer](#unidirectionalrecentplayer)[]| The array of recent players for this user. There should be at least 1 recent players and at most 100 recent players.|
| xuid| string| The user's XUID (base 10 integer).|

<a id="serverrecentplayersrequest"></a>

### ServerRecentPlayersRequest

| Name| Type| Description|
|---|---|---|
| recentPlayersByXuid| [ServerRecentPlayersByXuid](#serverrecentplayersbyxuid)[]| Array of objects representing a XUID and their recent players. There should be at least 1 and at most 20 XUID entries.|

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

<a id="unidirectionalrecentplayer"></a>

## UnidirectionalRecentPlayer

| Name| Type| Description|
|-------|-----|-----|
| encounterType| [EncounterType](#encountertype)| The type of recent players encounter. This field is optional and defaults to Default. Default has no prescribed meaning - it is up to the caller to interpret this value appropriately.|
| id| string| The Id (a XUID base 10 integer) of another user.|
| network| [Network](#network)| The network the other user was encountered on.|
| timestamp| string| |

