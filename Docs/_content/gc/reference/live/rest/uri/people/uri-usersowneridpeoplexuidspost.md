---
title: POST (/users/{ownerId}/people/xuids)
description: " POST (/users/{ownerId}/people/xuids)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# POST (/users/{ownerId}/people/xuids)
Gets people by XUID from caller's people collection. 
The domain for these URIs is `social.xboxlive.com`.
 
  * [Remarks](#ID4EV)
  * [URI parameters](#ID4E5)
  * [Authorization](#ID4EJB)
  * [Required Request Headers](#ID4ERC)
  * [Optional Request Headers](#ID4EBE)
  * [Request body](#ID4EHF)
  * [HTTP status codes](#ID4EKH)
  * [Required Response Headers](#ID4ENBAC)
  * [Response body](#ID4EZCAC)
 
<a id="ID4EV"></a>

 
## Remarks
 
POST operations won't modify any resources so this will produce the same results if executed once or multiple times.
  
<a id="ID4E5"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| ownerId| string| Identifier of the user whose resource is being accessed. Must match the authenticated user. The possible values are "me", xuid({xuid}), or gt({gamertag}).| 
  
<a id="ID4EJB"></a>

 
## Authorization
 
| Type| Required| Description| Response if missing| 
| --- | --- | --- | --- | --- | --- | --- | 
| XUID| yes| Caller has user's Xbox User ID (XUID).| 401 Unauthorized| 
  
<a id="ID4ERC"></a>

 
## Required Request Headers
 
| Header| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| Authorization| String. Authorization data for Xbox LIVE. This is typically an encrypted XSTS token. Example value: <b>XBL3.0 x=&lt;userhash>;&lt;token></b>.| 
| Content-Length| 32-bit unsigned integer. Length, in bytes, of the request body. Example value: 22.| 
| Content-Type| String. MIME type of the request body. This must be <b>application/json</b>.| 
  
<a id="ID4EBE"></a>

 
## Optional Request Headers
 
| Header| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| X-RequestedServiceVersion| Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, etc. Default value: 1.| 
| Accept| String. Content-Types that the caller accepts in the response. All responses are <b>application/json</b>.| 
  
<a id="ID4EHF"></a>

 
## Request body
 
<a id="ID4ENF"></a>

 
### Required members
 
| Member| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| XuidList| Array of XUIDs that identify the people to be returned from the caller's people collection. See [XuidList (JSON)](../../json/json-xuidlist.md).| 
  
<a id="ID4EKG"></a>

 
### Optional members
 
There are no optional members for this request.
  
<a id="ID4EVG"></a>

 
### Prohibited members
 
All other members are prohibited in a request.
  
<a id="ID4EAH"></a>

 
### Sample request
 

```cpp
{
    "xuids": [
        "2533274790395904", 
        "2533274792986770", 
        "2533274794866999"
    ]
}
      
```

   
<a id="ID4EKH"></a>

 
## HTTP status codes
 
The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).
 
| Code| Reason phrase| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| 200| OK| Success when method is "get".| 
| 204| No Content| Success when method is "add" or "remove".| 
| 400| Bad Request| Method parameter was missing or malformed, or user IDs were malformed.| 
| 403| Forbidden| XUID claim could not be parsed from the authorization header.| 
  
<a id="ID4ENBAC"></a>

 
## Required Response Headers
 
| Header| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| Content-Length| 32-bit unsigned integer| Length, in bytes, of the response body. Example value: 22.| 
| Content-Type| string| MIME type of the response body. This will always be <b>application/json</b>.| 
  
<a id="ID4EZCAC"></a>

 
## Response body
 
A response body is only sent when the request method is "get". There is no response body for "add" or "remove".
 
If a "get" method call is successful, the service returns the total number of people in the caller's people collection, and an array containing the caller's people collection. No response is returned for "add" and "remove" methods. See [PeopleList (JSON)](../../json/json-peoplelist.md).
 
<a id="ID4EHDAC"></a>

 
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
            "isFavorite": false,
            "isFollowingCaller": false
        },
    ],
    "totalCount": 3
}
         
```

   
<a id="ID4ERDAC"></a>

 
## See also
 
<a id="ID4ETDAC"></a>

 
##### Parent 

[/users/{ownerId}/people/xuids](uri-usersowneridpeoplexuids.md)

   