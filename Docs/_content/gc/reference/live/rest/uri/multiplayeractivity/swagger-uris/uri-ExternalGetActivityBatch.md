---
title: POST /titles/{titleId}/activities/query
description: POST /titles/{titleId}/activities/query
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Get Activity Batch

Gets a batch of multiplayer activities for a list of users.

This API allows clients and services to get a batch of activities for a list of users.

This API can return partial results; any given user will have its complete set of activities, but some users may have no activities at all. If we found activities for a subset of users, we return those. For the users whose activities were not found, we return an empty list for that user. For the users whose activities couldn't be fetched due to an internal error, we return null for that user; the client should retry the call. In short, a user can have a list of activities, an empty list or null.

```http
POST /titles/{titleId}/activities/query
```

<a id="uri-parameters"></a>
 
## URI parameters

| Parameter| In | Required | Type| Description|
| --- | --- | --- | --- | --- |
| titleId| path | TRUE | integer | The titleId of the game that the request is being sent for.|

<a id="request-body"></a>

## Request body

| Name| Required| Type| Description|
|---|---|---|---|
| users| TRUE| string[]| The Ids of the users whose activity information needs to be retrieved. Up to 30 users are supported.|
  
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
| 200 OK| [GetActivityBatchResponse](#getactivitybatchresponse)| The return object contains a list of activities for each user. If the user does not have a current activity, the activity list for that user will be empty. If there was a service issue getting a user's activities, the activity list for that user will be null.|
| 400 Bad Request| [ErrorResponse](#errorresponse)| An error occurred while processing the request. Possible error codes: "InvalidRequest - The request payload is invalid.", " AuthorizationError: The caller is not allowed to access the resource."|
| Other Status Codes| [ThrottledEntity](#throttledentity)| Too many requests. Headers Retry-After: integer|

<a id="definitions"></a>

## Definitions

* [ErrorResponse](#errorresponse)
* [GetActivityBatchRequest](#getactivitybatchrequest)
* [GetActivityBatchResponse](#getactivitybatchresponse)
* [GetActivityResponse](#getactivityresponse)
* [JoinRestriction](#joinrestriction)
* [Platform](#platform)
* [ThrottledEntity](#throttledentity)
* [UserActivity](#useractivity)

<a id="errorresponse"></a>

### ErrorResponse

| Name| Type| Description|
|----|----|----|
| debugMessage| string| Human readable version of the error message that can be used for debugging.|
| errorCode| string| Error code enum.|

<a id="getactivitybatchrequest"></a>

### GetActivityBatchRequest

| Name| Type| Description|
|----|----|----|
| users| string[]| The Ids of the users whose activity information needs to be retrieved. Up to 30 users are supported..|

<a id="getactivitybatchresponse"></a>

### GetActivityBatchResponse

| Name| Type| Description|
|----|----|----|
| userActivities| [UserActivity](#useractivity)[]||

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
| Scarlett| string| |
| Win32| string| |
| WindowsOneCore| string| |
| XboxOne| string| |

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

<a id="useractivity"></a>

### UserActivity

| Name| Type| Description|
| --- | --- | --- |
| activities| [GetActivityResponse](#getactivityresponse)[]| |
| userId| string| |
