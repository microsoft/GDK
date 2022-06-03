---
title: GET (/users/{ownerId}/people/{targetid})
description: " GET (/users/{ownerId}/people/{targetid})"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/users/{ownerId}/people/{targetid})
Gets a person by target ID from caller's people collection. 
The domain for these URIs is `social.xboxlive.com`.
 
  * [Remarks](#ID4EV)
  * [URI parameters](#ID4E5)
  * [Authorization](#ID4EJB)
  * [Required Request Headers](#ID4ERC)
  * [Optional Request Headers](#ID4EQD)
  * [Request body](#ID4EWE)
  * [HTTP status codes](#ID4EBF)
  * [Required Response Headers](#ID4EDH)
  * [Response body](#ID4EQAAC)
 
<a id="ID4EV"></a>

 
## Remarks
 
GET operations won't modify any resources so this will produce the same results if executed once or multiple times.
  
<a id="ID4E5"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| ownerId| string| Identifier of the user whose resource is being accessed. Must match the authenticated user. The possible values are "me", xuid({xuid}), or gt({gamertag}).| 
| targetid| string| Identifier of the user whose data is being retrieved from the owner's People list, either an Xbox User ID (XUID) or a gamertag. Example values: xuid(2603643534573581), gt(SomeGamertag).| 
  
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
  
<a id="ID4EQD"></a>

 
## Optional Request Headers
 
| Header| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| X-RequestedServiceVersion| Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, etc. Default value: 1.| 
| Accept| String. Content-Types that the caller accepts in the response. All responses are <b>application/json</b>.| 
  
<a id="ID4EWE"></a>

 
## Request body
 
No objects are sent in the body of this request.
  
<a id="ID4EBF"></a>

 
## HTTP status codes
 
The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).
 
| Code| Reason phrase| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| 200| OK| Success.| 
| 400| Bad Request| User IDs were malformed.| 
| 403| Forbidden| XUID claim could not be parsed from the authorization header.| 
| 404| Not Found| Target user was not found in the owner's People list.| 
  
<a id="ID4EDH"></a>

 
## Required Response Headers
 
| Header| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| Content-Length| 32-bit unsigned integer| Length, in bytes, of the response body. Example value: 22.| 
| Content-Type| string| MIME type of the response body. This will always be <b>application/json</b>.| 
  
<a id="ID4EQAAC"></a>

 
## Response body
 
If the call is successful, the service returns the target person. See [Person (JSON)](../../json/json-person.md).
 
<a id="ID4E3AAC"></a>

 
### Sample response
 

```cpp
{
    "xuid": "2603643534573581",
    "isFavorite": false,
    "isFollowingCaller": false,
    "socialNetworks": ["LegacyXboxLive"]
}
         
```

   
<a id="ID4EGBAC"></a>

 
## See also
 
<a id="ID4EIBAC"></a>

 
##### Parent 

[/users/{ownerId}/people/{targetid}](uri-usersowneridpeopletargetid.md)

   