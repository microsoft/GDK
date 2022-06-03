---
title: GET (/users/{ownerId}/people/mute)
description: " GET (/users/{ownerId}/people/mute)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/users/{ownerId}/people/mute)
Gets the mute list for a user.

  * [Remarks](#ID4EQ)
  * [URI parameters](#ID4EZ)
  * [Effect of privacy settings on resource](#ID4EEB)
  * [Authorization](#ID4ENB)
  * [Required Request Headers](#ID4ESC)
  * [Request body](#ID4EPE)
  * [HTTP status codes](#ID4E1E)
  * [Required Response Headers](#ID4E3G)
  * [Response body](#ID4ETAAC)

<a id="ID4EQ"></a>


## Remarks

If a target is given, this URI returns only that user if the user is on the mute list, or else empty if the user is not.

<a id="ID4EZ"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- |
| ownerId| string| Required. Identifier of the user whose resource is being accessed. The possible values are "me", <code>xuid({xuid})</code>, or gt({gamertag}). Must be the authenticated user. Example values: <code>xuid(2603643534573581)</code>, <code>gt(SomeGamertag)</code>. Maximum size: none. |

<a id="ID4EEB"></a>


## Effect of privacy settings on resource

None.

<a id="ID4ENB"></a>


## Authorization

Authorization claims used | Claim| Type| Required?| Example value|
| --- | --- | --- | --- | --- | --- | --- |
| Xuid| 64-bit signed integer| yes| 1234567890|

<a id="ID4ESC"></a>


## Required Request Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Authorization | string| Authentication credentials for HTTP authentication. Example value: <code>Xauth=&lt;authtoken></code>. Maximum size: none.|
| X-RequestedServiceVersion| string| Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the authorization token, and so on. Example values: <code>1</code>, <code>vnext</code>. Maximum size: none.|
| Accept| string| Content-Types that are acceptable. Example value: <code>application/json</code>. Maximum size: none.|

<a id="ID4EPE"></a>


## Request body

No objects are sent in the body of this request.

<a id="ID4E1E"></a>


## HTTP status codes

The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).

| Code| Reason phrase| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 200| OK| Successful request for the mute list.|
| 400| Bad Request| The target ID specified in the URI is not valid.|
| 403| Forbidden| The owner specified in the URI is not the authenticated user.|
| 404| Not Found| The owner specified in the URI does not exist.|

<a id="ID4E3G"></a>


## Required Response Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Content-Type| string| The MIME type of the body of the request. Example value: <code>application/json</code>|
| Content-Length| string| The number of bytes being sent in the response. Example value: 34|
| Cache-Control| string| Polite request from the server to specify caching behavior. Example: <code>no-cache, no-store</code>|

<a id="ID4ETAAC"></a>


## Response body

<a id="ID4EZAAC"></a>


### Sample response

See [UserList](../../json/json-userlist.md).


```cpp
{
    "users":
    [
        { "xuid":"12345" },
        { "xuid":"23456" }
    ]
}

```


<a id="ID4EJBAC"></a>


## See also

<a id="ID4ELBAC"></a>


##### Parent

[/users/{ownerId}/people/mute](uri-privacyusersowneridpeoplemute.md)