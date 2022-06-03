---
title: GET (/users/{requestorId}/permission/validate)
description: " GET (/users/{requestorId}/permission/validate)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/users/{requestorId}/permission/validate)
Gets a yes-or-no answer about whether the user is allowed to perform the specified action with a target user.

  * [URI parameters](#ID4EQ)
  * [Query string parameters](#ID4E2)
  * [Authorization](#ID4EDC)
  * [Required Request Headers](#ID4EID)
  * [Request body](#ID4ETE)
  * [HTTP status codes](#ID4E5E)
  * [Required Response Headers](#ID4ETG)
  * [Response body](#ID4EKAAC)

<a id="ID4EQ"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- |
| requestorId| string| Required. Identifier of the user performing the action. The possible values are <code>xuid({xuid})</code> and <code>me</code>. This must be a logged-in user. Example value: <code>xuid(0987654321)</code>.|

<a id="ID4E2"></a>


## Query string parameters

| Parameter| Type| Description|
| --- | --- | --- | --- | --- | --- |
| setting| string enumeration| The PermissionId value to check against. Example value: "CommunicateUsingText".|
| target| string| Identifier of the user on whom the action is to be performed. The possible values are <code>xuid({xuid})</code>. Example values: <code>xuid(0987654321)</code>|

<a id="ID4EDC"></a>


## Authorization

Authorization claims used | Claim| Type| Required?| Example value|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Xuid| 64-bit signed integer| yes| 1234567890|

<a id="ID4EID"></a>


## Required Request Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Authorization| string| Authentication credentials for HTTP authentication. Example values: <code>XBL3.0 x=&lt;userhash>;&lt;token></code>|
| X-RequestedServiceVersion| string| Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, etc. Example value: 1.|

<a id="ID4ETE"></a>


## Request body

No objects are sent in the body of this request.

<a id="ID4E5E"></a>


## HTTP status codes

The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).

| Code| Reason phrase| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 200| OK| The session was successfully retrieved.|
| 400| The request is invalid.| Examples: incorrect setting IDs, incorrect URIs, etc.|
| 404| The user specified in the URI does not exist.| The specified resource could not be found.|

<a id="ID4ETG"></a>


## Required Response Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Content-Type| string| The MIME type of the body of the request. Example value: <code>application/json</code>|
| Content-Length| string| The number of bytes being sent in the response. Example value: 34|
| Cache-Control| string| Polite request from the server to specify caching behavior. Example: <code>no-cache, no-store</code>|

<a id="ID4EKAAC"></a>


## Response body

See [PermissionCheckResponse (JSON)](../../json/json-permissioncheckresponse.md).

<a id="ID4EWAAC"></a>


### Sample response


```cpp
{
    "isAllowed": false,
    "reasons":
    [
        {"reason": "BlockedByRequestor"},
        {"reason": "MissingPrivilege", "restrictedSetting": "VideoCommunications"}
    ]
}

```


<a id="ID4EABAC"></a>


## See also

<a id="ID4ECBAC"></a>


##### Parent

[/users/{requestorId}/permission/validate](uri-privacyusersrequestoridpermissionvalidate.md)

 [PermissionId Enumeration](../../enums/privacy-enum-permissionid.md)