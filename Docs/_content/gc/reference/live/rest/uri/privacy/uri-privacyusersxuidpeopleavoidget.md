---
title: GET (/users/{ownerId}/people/avoid)
description: " GET (/users/{ownerId}/people/avoid)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/users/{ownerId}/people/avoid)
Gets the Avoid list for a user.

  * [Remarks](#ID4EQ)
  * [URI parameters](#ID4EZ)
  * [Authorization](#ID4EEB)
  * [Required Request Headers](#ID4EJC)
  * [HTTP status codes](#ID4EYD)
  * [Required Response Headers](#ID4E1F)
  * [Response body](#ID4ESH)

<a id="ID4EQ"></a>


## Remarks

If a target is given, only returns that user if they're on the block list, or else empty if they're not.

<a id="ID4EZ"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- |
| ownerId| string| Required. Identifier of the user whose resource is being accessed. The possible values are <code>xuid({xuid})</code>. Must be the authenticated user. Example value: <code>xuid(2603643534573581)</code>. Maximum size: none. |

<a id="ID4EEB"></a>


## Authorization

Authorization claims used | Claim| Type| Required?| Example value|
| --- | --- | --- | --- | --- | --- | --- |
| Xuid| 64-bit signed integer| yes| 1234567890|

<a id="ID4EJC"></a>


## Required Request Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Authorization | string| Authentication credentials for HTTP authentication. Example value: <code>Xauth=&lt;authtoken></code>. Maximum size: none.|
| Accept| string| Content-Types that are acceptable. Example value: <code>application/json</code>. Maximum size: none.|

<a id="ID4EYD"></a>


## HTTP status codes

The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).

| Code| Reason phrase| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 200| OK| The session was successfully retrieved.|
| 400| Bad Request| The target ID specified in the URI is not valid.|
| 403| Forbidden| The owner specified in the URI is not the authenticated user.|
| 404| Not Found| The owner specified in the URI does not exist.|

<a id="ID4E1F"></a>


## Required Response Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Content-Type| string| The MIME type of the body of the request. Example value: <code>application/json</code>. Maximum size: none.|
| Content-Length| string| The number of bytes being sent in the response. Example value: 34. Maximum size: none.|
| Cache-Control| string| Polite request from the server to specify caching behavior. Example value: <code>application/json</code>. Maximum size: none.|

<a id="ID4ESH"></a>


## Response body

<a id="ID4EYH"></a>


### Sample response


```cpp
{
    "users":
    [
        { "xuid":"12345" },
        { "xuid":"23456" }
    ]
}

```


<a id="ID4EDAAC"></a>


## See also

<a id="ID4EFAAC"></a>


##### Parent

[/users/{ownerId}/people/avoid](uri-privacyusersxuidpeopleavoid.md)