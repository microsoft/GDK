---
title: DELETE (/users/xuid({xuid})/devices/current/titles/current)
description: " DELETE (/users/xuid({xuid})/devices/current/titles/current)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# DELETE (/users/xuid({xuid})/devices/current/titles/current)
Remove the presence of a closing title, instead of waiting for the [PresenceRecord](../../json/json-presencerecord.md) to expire. 
The domain for these URIs is `userpresence.xboxlive.com`.
 
  * [URI parameters](#ID4EZ)
  * [Authorization](#ID4EEB)
  * [Required Request Headers](#ID4ERD)
  * [Optional Request Headers](#ID4EVF)
  * [Request body](#ID4EVG)
  * [Response body](#ID4EAH)
 
<a id="ID4EZ"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| xuid| 64-bit unsigned integer| Xbox User ID (XUID) of the target user.| 
  
<a id="ID4EEB"></a>

 
## Authorization
 
| Type| Required| Description| Response if missing| 
| --- | --- | --- | --- | --- | --- | --- | 
| XUID| Yes| Xbox User ID (XUID) of the caller| 403 Forbidden| 
| titleId| Yes| titleId of the title| 403 Forbidden| 
| deviceId| Yes for all except Windows and Web| deviceId of the caller| 403 Forbidden| 
| deviceType| Yes for all except Web| deviceType of the caller| 403 Forbidden| 
  
<a id="ID4ERD"></a>

 
## Required Request Headers
 
| Header| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| Authorization| string| Authentication credentials for HTTP authentication. Example value: "XBL3.0 x=&lt;userhash>;&lt;token>".| 
| x-xbl-contract-version| string| Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, and so on. Example values: 3, vnext.| 
| Content-Type| string| The mime type of the body of the request Example value: application/json.| 
| Content-Length| string| The length of the request body. Example value: 312.| 
| Host| string| Domain name of the server. Example value: presencebeta.xboxlive.com.| 
  
<a id="ID4EVF"></a>

 
## Optional Request Headers
 
| Header| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| X-RequestedServiceVersion|  | Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, and so on. Default value: 1.| 
  
<a id="ID4EVG"></a>

 
## Request body
 
No objects are sent in the body of this request.
  
<a id="ID4EAH"></a>

 
## Response body
 
In case of success, HTTP status code is returned with no response body.
 
In case of error (HTTP 4xx or 5xx), appropriate error information is returned in the response body.
  
<a id="ID4ELH"></a>

 
## See also
 
<a id="ID4ENH"></a>

 
##### Parent 

[/users/xuid({xuid})/devices/current/titles/current](uri-usersxuiddevicescurrenttitlescurrent.md)

   