---
title: POST /titles/{titleId}/recentplayers
description: POST /titles/{titleId}/recentplayers
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Post Recent Players

Appends to or updates a user's list of recent players (unidirectional).

This API allows a game client to append to a user's list of recent players, and to update existing recent player entries. This call only affects the caller's recent players list (unidirectional).

```http
POST /titles/{titleId}/recentplayers
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
| recentPlayers| TRUE| [UnidirectionalRecentPlayer](#unidirectionalrecentplayer)[]| The array of recent players for this user. There should be at least 1 recent players and at most 100 recent players.|

<a id="responses"></a>

## Responses

| Name| Type| Description|
| --- | --- | --- |
| 204 No Content| | The recent players request was sent successfully.|
| 400 Bad Request| [ErrorResponse](#errorresponse)| An error occurred while processing the request. Possible error codes: "RequestValidationError: The request validation has failed.", " AuthorizationError: The caller is not allowed to access the resource."|
| Other Status Codes| [ThrottledEntity](#throttledentity)| Too many requests. Headers Retry-After: integer|

<a id="definitions"></a>

## Definitions

* [ClientRecentPlayersRequest](#clientrecentplayersrequest)
* [EncounterType](#encountertype)
* [ErrorResponse](#errorresponse)
* [Network](#network)
* [ThrottledEntity](#throttledentity)
* [UnidirectionalRecentPlayer](#unidirectionalrecentplayer)

<a id="clientrecentplayersrequest"></a>

### ClientRecentPlayersRequest

| Name| Type| Description|
|----|----|----|
| recentPlayers| [UnidirectionalRecentPlayer](#unidirectionalrecentplayer)[]| The array of recent players for this user. There should be at least 1 recent players and at most 100 recent players.|

<a id="encountertype"></a>

### EncounterType

The type of recent players encounter. This field is optional and defaults to Default. Default has no prescribed meaning - it is up to the caller to interpret this value appropriately.

| Name| Type| Description|
|----|----|----|
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
