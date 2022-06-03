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

# Send Server Invite

Sends an invite to an Xbox user with the given connection string.

This API allows a game server to send an invite to an Xbox Live user. The body of the request contains a connection string that is used by the invitee to join the server. The connection string could contain the game server IP or a pointer to a session that the user is in. The invite is sent to all registered endpoints, regardless of platform.

```http
POST /titles/{titleId}/invites/server
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
| invitedUsers| TRUE| string[]| The XUID of the users the invite is being sent to. The XUID is represented as a base 10 integer. The maximum is 16 XUIDs.|
| sender| TRUE| string| The id of the user on whose behalf the invite is being sent.|
| connectionString| | string| The connection string is what gets passed to the game when the invite reaches the user. The connection string usually contains information like the server IP to enable the invited user to join. If the connection string field is left empty then the title is invoked with an empty connection string. The length of the connection string is restricted to 512 characters.|
| platform| | [Platform](#platform)| |

<a id="responses"></a>

## Responses

| Name| Type| Description|
| --- | --- | --- |
| 204 No Content| |
The invite was sent successfully.|
| 400 Bad Request| [ErrorResponse](#errorresponse)| An error occurred while processing the request. Possible error codes: "RequestValidationError: The request validation has failed.", " AuthorizationError: The caller is not allowed to access the resource. Too many requests."|
| Other Status Codes| [ThrottledEntity](#throttledentity)| Too many requests. Headers Retry-After: integer|

<a id="definitions"></a>

## Definitions

* [ErrorResponse](#errorresponse)
* [Platform](#platform)
* [SendServerInviteRequest](#sendserverinviterequest)
* [ThrottledEntity](#throttledentity)

<a id="errorresponse"></a>

### ErrorResponse

| Name| Type| Description|
|----|----|----|
| debugMessage| string| Human readable version of the error message that can be used for debugging.|
| errorCode| string| Error code enum.|

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

<a id="sendserverinviterequest"></a>

### SendServerInviteRequest

| Name| Type| Description|
| --- | --- | --- |
| connectionString| string| The connection string is what gets passed to the game when the invite reaches the user. The connection string usually contains information like the server IP to enable the invited user to join. If the connection string field is left empty then the title is invoked with an empty connection string. The length of the connection string is restricted to 512 characters.|
| invitedUsers| string[]| The XUID of the users the invite is being sent to. The XUID is represented as a base 10 integer. The maximum is 16 XUIDs.|
| platform| [Platform](#platform)| |
| sender| string| The id of the user on whose behalf the invite is being sent.|

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
