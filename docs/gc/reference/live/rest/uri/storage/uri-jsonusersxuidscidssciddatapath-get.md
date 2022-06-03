---
title: GET (/json/users/xuid({xuid})/scids/{scid}/data/{path})
description: " GET (/json/users/xuid({xuid})/scids/{scid}/data/{path})"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/json/users/xuid({xuid})/scids/{scid}/data/{path})
Lists file information at a specified path. 
The domain for these URIs is `titlestorage.xboxlive.com`.
 
  * [URI parameters](#ID4EX)
  * [Optional Query String Parameters](#ID4ECB)
  * [Authorization](#ID4EUC)
  * [Required Request Headers](#ID4EBD)
  * [Request body](#ID4EKE)
  * [HTTP status codes](#ID4EXE)
  * [Response body](#ID4EKCAC)
 
<a id="ID4EX"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| xuid| unsigned 64-bit integer| The Xbox User ID (XUID) of the player who making the request.| 
| scid| guid| the ID of the service config to look up.| 
| path| string| The path to the data items to return. All matching directories and subdirectories get returned. Valid characters include uppercase letters (A-Z), lowercase letters (a-z), numbers (0-9), underscore (_), and forward slash (/). May be empty. Max length of 256.| 
  
<a id="ID4ECB"></a>

 
## Optional Query String Parameters 
 
| Parameter| Type| Description| 
| --- | --- | --- | --- | --- | --- | 
| skipItems| int| Return the items starting at N+1 in the collection, for example, skip N items.| 
| continuationToken| string| Return the items starting at the given continuation token. The continuationToken parameter takes precedence over skipItems if both are provided. In other words, the skipItems parameter is ignored if continuationToken parameter is present.| 
| maxItems| int| Maximum number of items to return from the collection, which can be combined with skipItems and continuationToken to return a range of items. The service may provide a default value if maxItems is not present, and may return fewer than maxItems, even if the last page of results has not yet been returned. | 
  
<a id="ID4EUC"></a>

 
## Authorization 
 
The request must include a valid Xbox LIVE authorization header. If caller is not allowed to access this resource, the service will return a 403 Forbidden response. If the header is invalid or missing, the service will return a 401 Unauthorized response. 
  
<a id="ID4EBD"></a>

 
## Required Request Headers
 
| Header| Value| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| x-xbl-contract-version| 1| API contract version.| 
| Authorization| XBL3.0 x=[hash];[token]| STS authentication token. STSTokenString is replaced by the token returned by the authentication request. See Authenticating and Authorizing Xbox LIVE Services Requests for additional information about retrieving an STS token and creating an authorization header.| 
  
<a id="ID4EKE"></a>

 
## Request body 
 
No objects are sent in the body of this request.
  
<a id="ID4EXE"></a>

 
## HTTP status codes 
 
The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).
 
| Code| Reason phrase| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
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
  
<a id="ID4EKCAC"></a>

 
## Response body
 
If the call is successful, the service will return an array of [TitleBlob](../../json/json-titleblob.md) objects.
 
<a id="ID4EYCAC"></a>

 
### Sample response
 

```cpp
{
"blobs":
[
    {
        "fileName":"foo\bar\blob.txt,json",
        "clientFileTime":"2012-01-01T01:02:03.1234567Z",
        "displayName":"Friendly Name",
        "size":12,
        "etag":"0x8CEB3E4F8F3A5BF"
    },
    {
        "fileName":"foo\bar\blob2.txt,json",
        "displayName":"Blob 2",
        "size":4,
        "etag":"0x8CEB3FE57F1A142"
    },
    {
        "fileName":"foo\jsonblob.txt,json",
        "size":15,
        "etag":"0x8CEB40152B4A6F8"
    }
],
"pagingInfo":
    {
        "continuationToken":"54",
    }
}
         
```

   
<a id="ID4EEDAC"></a>

 
## See also
 
<a id="ID4EGDAC"></a>

 
##### Parent  

[/json/users/xuid({xuid})/scids/{scid}/data/{path}](uri-jsonusersxuidscidssciddatapath.md)

  
<a id="ID4ESDAC"></a>

 
##### Reference  [TitleBlob (JSON)](../../json/json-titleblob.md)

 [PagingInfo (JSON)](../../json/json-paginginfo.md)

   