---
title: POST (/users/{requestorId}/permission/validate)
description: " POST (/users/{requestorId}/permission/validate)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# POST (/users/{requestorId}/permission/validate)
Gets a set of yes-or-no answers about whether the user is allowed to perform specified actions with a set of target users.

  * [Remarks](#ID4EQ)
  * [URI parameters](#ID4ECB)
  * [Authorization](#ID4ENB)
  * [Required Request Headers](#ID4ESC)
  * [Request body](#ID4E4D)
  * [HTTP status codes](#ID4ETE)
  * [Required Response Headers](#ID4EIG)
  * [Response body](#ID4E5H)

<a id="ID4EQ"></a>


## Remarks

The request body takes a list of users and a list of settings, and the result is an allowed/blocked result for each user/setting pair.

In cross-network multiplayer scenarios (where privacy communications checks must be performed between users that have an Xbox User ID (XUID) and off-network users that do not), please refer to [PermissionCheckBatchRequest (JSON)](../../json/json-permissioncheckbatchrequest.md) for User types.

<a id="ID4ECB"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- |
| requestorId| string| Required. Identifier of the user performing the action. The possible values are <code>xuid({xuid})</code> and <code>me</code>. This must be a logged-in user. Example value: <code>xuid(0987654321)</code>.|

<a id="ID4ENB"></a>


## Authorization

Authorization claims used | Claim| Type| Required?| Example value|
| --- | --- | --- | --- | --- | --- | --- |
| Xuid| 64-bit signed integer| yes| 1234567890|

<a id="ID4ESC"></a>


## Required Request Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Authorization| string| Authentication credentials for HTTP authentication. Example values: <code>XBL3.0 x=&lt;userhash>;&lt;token></code>|
| X-RequestedServiceVersion| string| Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, etc. Example value: 1.|

<a id="ID4E4D"></a>


## Request body

<a id="ID4EDE"></a>


### Required members

See [PermissionCheckBatchRequest (JSON)](../../json/json-permissioncheckbatchrequest.md).


```cpp
{
    "users":
    [
        {"xuid":"12345"},
        {"xuid":"54321"}
    ],
    "permissions":
    [
        "ViewTargetGameHistory",
        "ViewTargetProfile"
    ]
}

```


<a id="ID4ETE"></a>


## HTTP status codes

The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).

| Code| Reason phrase| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 200| OK| The session was successfully retrieved.|
| 400| The request is invalid.| Examples: incorrect setting IDs, incorrect URIs, etc.|
| 404| The user specified in the URI does not exist.| The specified resource could not be found.|

<a id="ID4EIG"></a>


## Required Response Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Content-Type| string| The MIME type of the body of the request. Example value: <code>application/json</code>|
| Content-Length| string| The number of bytes being sent in the response. Example value: 34|
| Cache-Control| string| Polite request from the server to specify caching behavior. Example: <code>no-cache, no-store</code>|

<a id="ID4E5H"></a>


## Response body

See [PermissionCheckBatchResponse (JSON)](../../json/json-permissioncheckbatchresponse.md).

<a id="ID4ELAAC"></a>


### Sample response


```cpp
{
    "responses":
    [
        {
            "user": {"xuid":"12345"},
            "permissions":
            [
                {
                    "isAllowed":true
                },
                {
                    "isAllowed":true
                }
            ]
        },
        {
            "user": {"xuid":"54321"},
            "permissions":
            [
                {
                    "isAllowed":false,
                    "reasons":
                    [
                        {"reason":"NotAllowed"}
                    ]
                },
                {
                    "isAllowed":false,
                    "reasons":
                    [
                        {"reason":"PrivilegeRest", "restrictedSetting":"AllowProfileViewing"}
                    ]
                }
            ]
        }
    ]
}

```


<a id="ID4EVAAC"></a>


## See also

<a id="ID4EXAAC"></a>


##### Parent

[/users/{requestorId}/permission/validate](uri-privacyusersrequestoridpermissionvalidate.md)

 [PermissionId Enumeration](../../enums/privacy-enum-permissionid.md)