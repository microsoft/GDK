---
title: POST /users/xuid(xuid)/lists/PINS/{listname}/RemoveItems
description: " POST /users/xuid(xuid)/lists/PINS/{listname}/RemoveItems"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# POST /users/xuid(xuid)/lists/PINS/{listname}/RemoveItems
Removes items from a list by itemId. 
The domain for these URIs is `eplists.xboxlive.com`.
 
  * [Remarks](#ID4EV)
  * [URI parameters](#ID4EFB)
  * [Query string parameters](#ID4EOC)
  * [Request body](#ID4EZC)
  * [HTTP status codes](#ID4EED)
  * [Required Request Headers](#ID4E1AAC)
  * [Response body](#ID4EQCAC)
 
<a id="ID4EV"></a>

 
## Remarks 
 
Remove items from the list by specifying item ids instead of indexes. Only 100 items are allowed to be removed in a single call **If no items are passed then the entire list will be deleted (list will remain but empty, version number will continue to increment).** Once the items are removed, the list is "compacted" such that no holes are left in the ordering of indexes. 
 
An "If-Match:versionNumber" header is optional for this call. If it is included it will be validated. The versionNumber is the current version number of the file. If it is included and does not match the current list version number, then an HTTP 412 – precondition failed status code will be returned and the body of the response will contain the latest metadata of the list which includes the current version number. This is done to guard against updates from different clients trampling on each other. 
  
<a id="ID4EFB"></a>

 
## URI parameters 
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| XUID| string| XUID of the user.| 
| listname| string| Name of the list to manipulate.| 
  
<a id="ID4EOC"></a>

 
## Query string parameters 
 
Query parameters are not supported.
  
<a id="ID4EZC"></a>

 
## Request body 
 

```cpp
{
   "Items":
   [{"ItemId":  "ed591a0c-dde3-563f-99af-530278a3c402",
      "ProviderId":  null,
      "Provider":  null
   }]
}

    
```

  
<a id="ID4EED"></a>

 
## HTTP status codes 
 
The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).
 
| Code| Reason phrase| Description| 
| --- | --- | --- | --- | --- | --- | 
| 200| OK | The request completed successfully. The response body should contain the requested resource (for a GET). POST and PUT requests will receive up-to-date list metadata (list version, count, etc.).| 
| 201| Created | A new list has been created. This is returned on the initial insert to a list. The response includes up-to-date metadata on the list and the location header contains the URI for the list.| 
| 304| Not Modified| Returned on GETs. Indicates that the client has the latest version of the list. The service compares the value in the <b>If-Match</b> header to the list version. If they are equal, then a 304 gets returned with no data. | 
| 400| Bad Request | The request was malformed. Could be an invalid value or type for a URI or query string parameter. Can also be the result of a missing required parameter or data value, or the request indicated a missing or invalid version of the API. See the <b>X-XBL-Contract-Version</b> header. | 
| 401| Unauthorized | The request requires user authentication.| 
| 403| Forbidden | The request is not allowed for the user or service.| 
| 404| Not Found | The caller does not have access to the resource. This indicates that no such list has been created.| 
| 412| Precondition Failed | Indicates that the version of the list has changed and a modify request has failed. A modify request is an insert, update, or remove. The service checks the <b>If-Match</b> header for the list version. If it does not match the current version of the list, then the operation fails and this is returned along with the current list metadata (which includes the current version). | 
| 500| Internal Server Error | The service is refusing the request due to a server-side error.| 
| 501| Not Implemented | The caller requested a URI that has not been implemented on the server. (Currently only used when a request is made for a list name that is not allow listed.)| 
| 503| Service Unavailable | The server is refusing the request, usually due to excessive load. After a delay (see the <b>Retry-after</b> header), the request can be retried. | 
  
<a id="ID4E1AAC"></a>

 
## Required Request Headers
 
| Header| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | 
| Authorization| Contains the STS token used to authenticate and authorize the request. Must be a token from XSTS service and include the XUID as one of the claims. | 
| X-XBL-Contract-Version| Specifies which API version is being requested (positive integers). Pins supports version 2. If this header is missing or the value is not supported then the service will return a 400 – Bad request with "Unsupported or missing contract version header" in the status description. | 
| Content-Type| Specifies whether the content of request/response bodies will be in json or xml. Supported values are "application/json" and "application/xml"| 
| If-Match| This header must contain the current version number of a list when making modify requests. Modify requests use PUT, POST, or DELETE verbs. If the version in the "If-Match" header does not match the current version of the list, the request will be rejected with an HTTP 412 – precondition failed return code. (optional) Can also be used for GETs, if present and the passed in version matches the current list version then no list data and an HTTP 304 – Not Modified code will be returned. | 
  
<a id="ID4EQCAC"></a>

 
## Response body 
 
If the call is successful, the service returns the latest metadata for the list. 
 
<a id="ID4E1CAC"></a>

 
### Sample response 
 

```cpp
{
        "ListVersion":  1,
        "ListCount":  1,
        "MaxListSize": 200,
        "AllowDuplicates": "true",
        "AccessSetting":  "OwnerOnly"
        }

      
```

   
<a id="ID4EGDAC"></a>

 
## See also
 
<a id="ID4EIDAC"></a>

 
##### Parent 

[Universal Resource Identifier (URI) Reference](../atoc-xboxlivews-reference-uris.md)

   