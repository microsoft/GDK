---
title: PUT (/trustedplatform/users/xuid({xuid})/scids/{scid}/data/{pathAndFileName},{type})
description: " PUT (/trustedplatform/users/xuid({xuid})/scids/{scid}/data/{pathAndFileName},{type})"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# PUT (/trustedplatform/users/xuid({xuid})/scids/{scid}/data/{pathAndFileName},{type})
Uploads a file. The data can be uploaded in a full upload in which the data and metadata are sent in a single message, or as a multi-block upload in which the data and metadata are sent in a series of smaller blocks. Only files that are smaller than four megabytes can be sent as a single message. Multi-block upload is not supported for data of type json. 
The domain for these URIs is `titlestorage.xboxlive.com`.
 
  * [URI parameters](#ID4EX)
  * [Authorization](#ID4EEB)
  * [Optional Query String Parameters](#ID4ERB)
  * [Required Request Headers](#ID4EQE)
  * [Optional Request Headers](#ID4EZF)
  * [Request body](#ID4E3G)
  * [HTTP status codes](#ID4EHH)
  * [Response body](#ID4E1EAC)
 
<a id="ID4EX"></a>

 
## URI parameters 
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| xuid| unsigned 64-bit integer| The Xbox User ID (XUID) of the player who making the request.| 
| scid| guid| the ID of the service config to look up.| 
| pathAndFileName| string| Path and file name for the item to be accessed. Valid characters for the path portion (up to and including the final forward slash) include uppercase letters (A-Z), lowercase letters (a-z), numbers (0-9), underscore (_), and forward slash (/). The path portion may be empty. Valid characters for the file name portion (everything after the final forward slash) include uppercase letters (A-Z), lowercase letters (a-z), numbers (0-9), underscore (_), period (.), and hyphen (-). The file name may not be empty, end in a period or contain two consecutive periods.| 
| type| string| The format of the data. Possible values are binary or json.| 
  
<a id="ID4EEB"></a>

 
## Authorization 
 
The request must include a valid Xbox LIVE authorization header. If caller is not allowed to access this resource, the service will return a 403 Forbidden response. If the header is invalid or missing, the service will return a 401 Unauthorized response. 
  
<a id="ID4ERB"></a>

 
## Optional Query String Parameters 
 
For single message uploads, the query string parameters are:
 
| Parameter| Type| Description| 
| --- | --- | --- | --- | --- | --- | 
| clientFileTime| DateTime| Date/Time of the file on whatever client last uploaded the file.| 
| displayName| string| Name of the file that should be shown to the user.| 
 
For multi-block uploads, the query string parameters are:
 
| Parameter| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| clientFileTime| DateTime| Date/Time of the file on whatever client last uploaded the file.| 
| displayName| string| Name of the file that should be shown to the user.| 
| continuationToken| string| The continuation token from the response of the previous upload request. If this is the first block, this should not be specified. | 
| finalBlock| bool| Set to true for the last block of the file. Set to false for all other blocks.| 
  
<a id="ID4EQE"></a>

 
## Required Request Headers
 
| Header| Value| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| x-xbl-contract-version| 1| API contract version.| 
| Authorization| XBL3.0 x=[hash];[token]| STS authentication token. STSTokenString is replaced by the token returned by the authentication request. See Authenticating and Authorizing Xbox LIVE Services Requests for additional information about retrieving an STS token and creating an authorization header.| 
  
<a id="ID4EZF"></a>

 
## Optional Request Headers
 
| Header| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| If-Match| Specifies an ETag that must match an exisitng item to complete the operation.| 
| If-None-Match| Specifies an ETag that must not match any exisitng items to complete the operation.| 
  
<a id="ID4E3G"></a>

 
## Request body 
 
The request body contains the contents of the file being uploaded. For single message uploads, the body is the complete contents of the file. For multi-block uploads, the body is the portion of the file specified in the query string parameters. 
  
<a id="ID4EHH"></a>

 
## HTTP status codes 
 
The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).
 
| Code| Reason phrase| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| 200| OK | The request was successful.| 
| 201| Created | The entity was created.| 
| 400| Bad Request | Service could not understand malformed request. Typically an invalid parameter.| 
| 401| Unauthorized | The request requires user authentication.| 
| 403| Forbidden | The request is not allowed for the user or service.| 
| 404| Not Found | The specified resource could not be found.| 
| 406| Not Acceptable | Resource version is not supported.| 
| 408| Request Timeout | The request took too long to complete.| 
| 500| Internal Server Error | The server encountered an unexpected condition which prevented it from fulfilling the request.| 
| 503| Service Unavailable | Request has been throttled, try the request again after the client-retry value in seconds (e.g. 5 seconds later).| 
  
<a id="ID4E1EAC"></a>

 
## Response body 
 
If the call is a multi-block request and it is successful, the service will return a continution token to pass with the next block.
 
<a id="ID4EGFAC"></a>

 
### Sample response
 

```cpp
{
    "continuationToken":"abcd1234-1111-2222-3333-abcd12345678-1"
}
         
```

   
<a id="ID4ESFAC"></a>

 
## See also
 
<a id="ID4EUFAC"></a>

 
##### Parent  

[/trustedplatform/users/xuid({xuid})/scids/{scid}/data/{pathAndFileName},{type}](uri-trustedplatformusersxuidscidssciddatapathandfilenametype.md)

   