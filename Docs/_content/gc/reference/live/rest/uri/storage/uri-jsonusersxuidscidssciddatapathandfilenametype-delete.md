---
title: DELETE (/json/users/xuid({xuid})/scids/{scid}/data/{pathAndFileName},json)
description: " DELETE (/json/users/xuid({xuid})/scids/{scid}/data/{pathAndFileName},json)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# DELETE (/json/users/xuid({xuid})/scids/{scid}/data/{pathAndFileName},json)
Deletes a file. 
The domain for these URIs is `titlestorage.xboxlive.com`.
 
  * [URI parameters](#ID4EX)
  * [Authorization](#ID4EEB)
  * [Required Request Headers](#ID4ERB)
  * [Optional Request Headers](#ID4E1C)
  * [Request body](#ID4EWD)
  * [HTTP status codes](#ID4EDE)
  * [Response body](#ID4EUBAC)
 
<a id="ID4EX"></a>

 
## URI parameters 
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| xuid| unsigned 64-bit integer| The Xbox User ID (XUID) of the player who making the request.| 
| scid| guid| the ID of the service config to look up.| 
| pathAndFileName| string| Path and file name for the item to be accessed. Valid characters for the path portion (up to and including the final forward slash) include uppercase letters (A-Z), lowercase letters (a-z), numbers (0-9), underscore (_), and forward slash (/). The path portion may be empty. Valid characters for the file name portion (everything after the final forward slash) include uppercase letters (A-Z), lowercase letters (a-z), numbers (0-9), underscore (_), period (.), and hyphen (-). The file name may not be empty, end in a period or contain two consecutive periods.| 
  
<a id="ID4EEB"></a>

 
## Authorization 
 
The request must include a valid Xbox LIVE authorization header. If caller is not allowed to access this resource, the service will return a 403 Forbidden response. If the header is invalid or missing, the service will return a 401 Unauthorized response. 
  
<a id="ID4ERB"></a>

 
## Required Request Headers
 
| Header| Value| Description| 
| --- | --- | --- | --- | --- | --- | 
| x-xbl-contract-version| 1| API contract version.| 
| Authorization| XBL3.0 x=[hash];[token]| STS authentication token. STSTokenString is replaced by the token returned by the authentication request. See Authenticating and Authorizing Xbox LIVE Services Requests for additional information about retrieving an STS token and creating an authorization header.| 
  
<a id="ID4E1C"></a>

 
## Optional Request Headers
 
| Header| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | 
| If-Match| Specifies an ETag that must match an exisitng item to complete the operation.| 
  
<a id="ID4EWD"></a>

 
## Request body 
 
No objects are sent in the body of this request.
  
<a id="ID4EDE"></a>

 
## HTTP status codes 
 
The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).
 
| Code| Reason phrase| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| 200| OK | The file was deleted successfully, or does not exist.| 
| 201| Created | The entity was created.| 
| 400| Bad Request | Service could not understand malformed request. Typically an invalid parameter.| 
| 401| Unauthorized | The request requires user authentication.| 
| 403| Forbidden | The request is not allowed for the user or service.| 
| 404| Not Found | The specified resource could not be found.| 
| 406| Not Acceptable | Resource version is not supported.| 
| 408| Request Timeout | The request took too long to complete.| 
| 500| Internal Server Error | The server encountered an unexpected condition which prevented it from fulfilling the request.| 
| 503| Service Unavailable | Request has been throttled, try the request again after the client-retry value in seconds (e.g. 5 seconds later).| 
  
<a id="ID4EUBAC"></a>

 
## Response body 
 
No objects are sent in the body of the response.
  
<a id="ID4EDCAC"></a>

 
## See also
 
<a id="ID4EFCAC"></a>

 
##### Parent  

[/json/users/xuid({xuid})/scids/{scid}/data/{pathAndFileName},json](uri-jsonusersxuidscidssciddatapathandfilenametype.md)

   