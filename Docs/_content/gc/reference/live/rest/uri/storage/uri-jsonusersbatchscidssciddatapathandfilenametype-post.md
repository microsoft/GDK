---
title: POST (/json/users/batch/scids/{scid}/data/{pathAndFileName},json)
description: " POST (/json/users/batch/scids/{scid}/data/{pathAndFileName},json)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# POST (/json/users/batch/scids/{scid}/data/{pathAndFileName},json)
Downloads multiple files from multiple users with the same filename. The file to be downloaded is determined by the URI of the request. The body of the request contains the list of XUIDs of the users whose files to download. The body of the response will be a multi-part MIME message, with each part representing a file for a particular user with its own set of headers. It's possible for the parts of the response to be a mix of successes and failures. 
The domain for these URIs is `titlestorage.xboxlive.com`.
 
  * [URI parameters](#ID4EX)
  * [Authorization](#ID4ECB)
  * [Request body](#ID4EPB)
  * [HTTP status codes](#ID4E3C)
  * [Required Response Headers](#ID4EPAAC)
  * [Optional Response Headers](#ID4ESBAC)
  * [Response body](#ID4E3CAC)
 
<a id="ID4EX"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| scid| guid| the ID of the service config to look up.| 
| pathAndFileName| string| Path and file name for the item to be accessed. Valid characters for the path portion (up to and including the final forward slash) include uppercase letters (A-Z), lowercase letters (a-z), numbers (0-9), underscore (_), and forward slash (/). The path portion may be empty. Valid characters for the file name portion (everything after the final forward slash) include uppercase letters (A-Z), lowercase letters (a-z), numbers (0-9), underscore (_), period (.), and hyphen (-). The file name may not be empty, end in a period or contain two consecutive periods.| 
  
<a id="ID4ECB"></a>

 
## Authorization 
 
The request must include a valid Xbox LIVE authorization header. If caller is not allowed to access this resource, the service will return a 403 Forbidden response. If the header is invalid or missing, the service will return a 401 Unauthorized response. 
  
<a id="ID4EPB"></a>

 
## Request body
 
| Property| Type| Description| 
| --- | --- | --- | --- | --- | --- | 
| xuids| array of unsigned 64-bit integers| The list of XUIDs for which to download files.| 
 
<a id="ID4EQC"></a>

 
### Sample request
 

```cpp
{
    "xuids" : 
    [
      12345,
      45678,
      78901
    ]
}
      
```

   
<a id="ID4E3C"></a>

 
## HTTP status codes 
 
The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).
 
| Code| Reason phrase| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | 
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
  
<a id="ID4EPAAC"></a>

 
## Required Response Headers
 
| Header| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| Content-Disposition| Describes the contents of the part. The "name" and "filename" parts of the header are the XUID of the user that this file belongs to.| 
| HttpStatusCode| The HTTP status code related to retrieving this particular file.| 
  
<a id="ID4ESBAC"></a>

 
## Optional Response Headers
 
| Header| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| ETag| ETag is an opaque identifier assigned by a web server to a specific version of a resource found at a URL. If the resource content at that URL ever changes, a new and different ETag is assigned.| 
| Content-Type| If the file was successfully retrieved, this is the Content-Type of the file.| 
| Content-Range| If the file was successfully retrieved and is a partial download, this is the range of bytes of the file contained in the response. | 
  
<a id="ID4E3CAC"></a>

 
## Response body
 
If the call is successful, the service will return the contents of the requested files in a multi-part response.
 
<a id="ID4EGDAC"></a>

 
### Sample response 
 

```cpp
HTTP/1.1 200 OK
Transfer-Encoding: chunked
Content-Type: multipart/form-data; boundary=c0a9fd75-d036-4294-8b7b-85fea15a31bb

228
--c0a9fd75-d036-4294-8b7b-85fea15a31bb
Content-Disposition: binary; name="123"; filename="123"
HttpStatusCode: 200
ETag: 0x8CF327717411C31
Content-Type: application/octet-stream

asdf123
--c0a9fd75-d036-4294-8b7b-85fea15a31bb
Content-Disposition: binary; name="456"; filename="456"
HttpStatusCode: 200
ETag: 0x8CF32771E954BB8
Content-Type: application/octet-stream

asdf456
--c0a9fd75-d036-4294-8b7b-85fea15a31bb
Content-Disposition: binary; name="789"; filename="789"
HttpStatusCode: 404


--c0a9fd75-d036-4294-8b7b-85fea15a31bb--

0

```

   
<a id="ID4EUDAC"></a>

 
## See also
 
<a id="ID4EWDAC"></a>

 
##### Parent 

[/json/users/batch/scids/{scid}/data/{pathAndFileName},json](uri-jsonusersbatchscidssciddatapathandfilenametype.md)

   