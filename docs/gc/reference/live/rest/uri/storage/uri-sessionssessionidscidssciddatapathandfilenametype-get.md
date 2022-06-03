---
title: GET (/sessions/{sessionId}/scids/{scid}/data/{pathAndFileName},{type})
description: " GET (/sessions/{sessionId}/scids/{scid}/data/{pathAndFileName},{type})"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/sessions/{sessionId}/scids/{scid}/data/{pathAndFileName},{type})
Downloads a file. 
The domain for these URIs is `titlestorage.xboxlive.com`.
 
  * [URI parameters](#ID4EX)
  * [Authorization](#ID4ECB)
  * [Optional Query String Parameters](#ID4EPB)
  * [Required Request Headers](#ID4EQC)
  * [Optional Request Headers](#ID4EZD)
  * [Request body](#ID4EDF)
  * [HTTP status codes](#ID4EQF)
  * [Response Headers](#ID4EDDAC)
  * [Response body](#ID4EGEAC)
 
<a id="ID4EX"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| sessionId| string| the ID of the session to look up.| 
| scid| guid| the ID of the service config to look up.| 
| pathAndFileName| string| Path and file name for the item to be accessed. Valid characters for the path portion (up to and including the final forward slash) include uppercase letters (A-Z), lowercase letters (a-z), numbers (0-9), underscore (_), and forward slash (/). The path portion may be empty. Valid characters for the file name portion (everything after the final forward slash) include uppercase letters (A-Z), lowercase letters (a-z), numbers (0-9), underscore (_), period (.), and hyphen (-). The file name may not be empty, end in a period or contain two consecutive periods.| 
| type| string| The format of the data. Possible values are binary or json.| 
  
<a id="ID4ECB"></a>

 
## Authorization 
 
The request must include a valid Xbox LIVE authorization header. If caller is not allowed to access this resource, the service will return a 403 Forbidden response. If the header is invalid or missing, the service will return a 401 Unauthorized response. 
  
<a id="ID4EPB"></a>

 
## Optional Query String Parameters 
 
Varies by blob type. Binary blobs do not support query parameters.
 
| Parameter| Type| Description| 
| --- | --- | --- | --- | --- | --- | 
| select| string| Only usable when type is json. Specifies that the response should only contain a certain property/value of the JSON, as determined by this parameter. Use a "dot" (.) to specify sub-properties and square brackets ('[' and ']') to specify array indices. For example, "array1[4].prop2" specifies the "prop2" property of index 4 of the "array1" array.| 
  
<a id="ID4EQC"></a>

 
## Required Request Headers
 
| Header| Value| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| x-xbl-contract-version| 1| API contract version.| 
| Authorization| XBL3.0 x=[hash];[token]| STS authentication token. STSTokenString is replaced by the token returned by the authentication request. See Authenticating and Authorizing Xbox LIVE Services Requests for additional information about retrieving an STS token and creating an authorization header.| 
  
<a id="ID4EZD"></a>

 
## Optional Request Headers
 
| Header| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| If-Match| Specifies an ETag that must match an exisitng item to complete the operation.| 
| If-None-Match| Specifies an ETag that must not match any exisitng items to complete the operation.| 
| Range| Specifies the range of bytes to download. Follows the standard HTTP Range header format.| 
  
<a id="ID4EDF"></a>

 
## Request body 
 
No objects are sent in the body of this request.
  
<a id="ID4EQF"></a>

 
## HTTP status codes 
 
The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).
 
| Code| Reason phrase| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
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
  
<a id="ID4EDDAC"></a>

 
## Response Headers
 
| Header| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| ETag| ETag is an opaque identifier assigned by a web server to a specific version of a resource found at a URL. If the resource content at that URL ever changes, a new and different ETag is assigned.| 
| Content-Range| If this was a partial download, this header specifies the range of bytes downloaded.| 
  
<a id="ID4EGEAC"></a>

 
## Response body
 
If the call is successful, the service will return the contents of the file.
  
<a id="ID4EREAC"></a>

 
## See also
 
<a id="ID4ETEAC"></a>

 
##### Parent  

[/sessions/{sessionId}/scids/{scid}/data/{pathAndFileName},{type}](uri-sessionssessionidscidssciddatapathandfilenametype.md)

  
<a id="ID4E6EAC"></a>

 
##### Reference  [TitleBlob (JSON)](../../json/json-titleblob.md)

   