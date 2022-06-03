---
title: POST /titles/{titleId}/invites
description: POST /titles/{titleId}/invites
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Send Invite

Send an invite to an Xbox Live user.

This API allows a game client to send an invite to an Xbox Live user for a specific title. The invite is sent to all registered endpoints, regardless of platform.

```http
POST /titles/{titleId}/invites
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
* [SendInviteRequest](#sendinviterequest)
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

<a id="sendinviterequest"></a>

### SendInviteRequest

If the platform is not set in the request, the invite will allow the recipient to join on any platform the game can be played on. Otherwise, it will include only the listed platform.

**Note:** the exception to this is that if Scarlett is not configured as a platform, then invites specifying XboxOne will also be sent to Scarlett devices.

| Name| Type| Description|
| --- | --- | --- |
| connectionString| string| The connection string is what gets passed to the game when the invite reaches the user. The connection string usually contains information like the server IP to enable the invited user to join. If the connection string field is left empty then the title is invoked with an empty connection string. The length of the connection string is restricted to 512 characters.|
| invitedUsers| string[]| The XUID of the users the invite is being sent to. The XUID is represented as a base 10 integer. The maximum is 16 XUIDs.|
| platform| [Platform](#platform)| |

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
