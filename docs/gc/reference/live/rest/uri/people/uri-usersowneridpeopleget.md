---
title: GET (/users/{ownerId}/people)
description: " GET (/users/{ownerId}/people)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/users/{ownerId}/people)
Gets caller's people collection.
The domain for these URIs is `social.xboxlive.com`.

  * [Remarks](#ID4EV)
  * [URI parameters](#ID4E5)
  * [Query string parameters](#ID4EJB)
  * [Authorization](#ID4ERD)
  * [Required Request Headers](#ID4EZE)
  * [Optional Request Headers](#ID4EYF)
  * [Request body](#ID4E5G)
  * [HTTP status codes](#ID4EJH)
  * [Required Response Headers](#ID4EBBAC)
  * [Response body](#ID4ENCAC)

<a id="ID4EV"></a>


## Remarks

GET operations won't modify any resources so this will produce the same results if executed once or multiple times.

<a id="ID4E5"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- |
| ownerId| string| Identifier of the user whose resource is being accessed. Must match the authenticated user. The possible values are "me", xuid({xuid}), or gt({gamertag}).|

<a id="ID4EJB"></a>


## Query string parameters

| Parameter| Type| Description|
| --- | --- | --- | --- | --- | --- |
| view| string| Return the people associated with a view. The default value is "all". The possible values are: <ul><li><b>All</b> - Returns all People on the user's People list. This is the default value.</li><li><b>Favorite</b> - Returns all People on the user's People list who have the Favorite attribute.</li><li><b>LegacyXboxLiveFriends</b> - Returns all People on the user's People list who are also legacy Xbox LIVE friends.</li></br>**Note:**  Only the **All** value is supported if the calling user is different than the owning user.|
| startIndex| 32-bit unsigned integer| Return the items starting at the given index.  
| maxItems| 32-bit unsigned integer| Maximum number of people to return from the collection starting from the start index. The service may provide a default value if <b>maxItems</b> is not present and may return fewer than <b>maxItems</b> (even if the last page of results has not yet been returned).|

<a id="ID4ERD"></a>


## Authorization

| Type| Required| Description| Response if missing|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| XUID| yes| Caller has user's Xbox User ID (XUID).| 401 Unauthorized|

<a id="ID4EZE"></a>


## Required Request Headers

| Header| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Authorization| String. Authorization data for Xbox LIVE. This is typically an encrypted XSTS token. Example value: <b>XBL3.0 x=&lt;userhash>;&lt;token></b>.|

<a id="ID4EYF"></a>


## Optional Request Headers

| Header| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| X-RequestedServiceVersion| Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, etc. Default value: 1.|
| Accept| String. Content-Types that the caller accepts in the response. All responses are <b>application/json</b>.|

<a id="ID4E5G"></a>


## Request body

No objects are sent in the body of this request.

<a id="ID4EJH"></a>


## HTTP status codes

The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).

| Code| Reason phrase| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 200| OK| Success.|
| 400| Bad Request| Query parameters or user IDs were malformed.|
| 403| Forbidden| XUID claim could not be parsed from the authorization header.|

<a id="ID4EBBAC"></a>


## Required Response Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Content-Length| 32-bit unsigned integer| Length, in bytes, of the response body. Example value: 22.|
| Content-Type| string| MIME type of the response body. This will always be <b>application/json</b>.|

<a id="ID4ENCAC"></a>


## Response body

If the call is successful, the service returns the total number of people in the caller's people collection, and an array containing the caller's people collection. See [PeopleList (JSON)](../../json/json-peoplelist.md).

<a id="ID4EZCAC"></a>


### Sample response


```cpp
{
    "people": [
        {
            "xuid": "2603643534573573",
            "isFavorite": true,
            "isFollowingCaller": false,
            "socialNetworks": ["LegacyXboxLive"]
        },
        {
            "xuid": "2603643534573572",
            "isFavorite": true,
            "isFollowingCaller": false,
            "socialNetworks": ["LegacyXboxLive"]
        },
        {
            "xuid": "2603643534573577",
            "isFollowingCaller": false,
            "isFavorite": false
        },
    ],
    "totalCount": 3
}

```


<a id="ID4EDDAC"></a>


## See also

<a id="ID4EFDAC"></a>


##### Parent

[/users/{ownerId}/people](uri-usersowneridpeople.md)