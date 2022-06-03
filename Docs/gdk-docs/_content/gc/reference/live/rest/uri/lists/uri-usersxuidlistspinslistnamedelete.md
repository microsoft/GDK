---
title: DELETE (/users/xuid(xuid)/lists/PINS/{listname})
description: " DELETE (/users/xuid(xuid)/lists/PINS/{listname})"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# DELETE (/users/xuid(xuid)/lists/PINS/{listname})
Removes items from a list. 
The domain for these URIs is `eplists.xboxlive.com`.
 
  * [Remarks](#ID4EV)
  * [URI parameters](#ID4EIB)
  * [Query string parameters](#ID4ETB)
  * [Authorization](#ID4ETC)
  * [Required Request Headers](#ID4EAD)
  * [Request body](#ID4EWE)
  * [HTTP status codes](#ID4EBF)
  * [Response body](#ID4E6BAC)
 
<a id="ID4EV"></a>

 
## Remarks
 
Items to be removed are indicated by their index in the list and are identified in the query string parameter **indexes**. The list of indexes must be comma-delimited and only 100 indexes can be passed in a single call. However, if no indexes are passed (empty query string parameter) then the contents of the entire list will be deleted (an empty list will remain, and the version number will continue to increment). Once the items are removed, the list is "compacted" such that no holes are left in the ordering of indexes. Therefore, this call is not idempotent.
 
This call requires an **If-Match:versionNumber** header to be included in the request, where **versionNumber** is the current version number of the file. If it is not included, or does not match the current list version number, then an HTTP 412 (precondition failed) status code will be returned and the body of the response will contain the latest metadata of the list that includes the current version number. This is done to guard against updates from different clients trampling on one another.
  
<a id="ID4EIB"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| xuid| string| Xbox User ID (XUID).| 
| listtype| string| Type of the list (how it is used and how it acts). Always "PINS" for these related methods.| 
| listname| string| Name of the list (which list of a given listtype to act on). Always "XBLPins" for items in Pins.| 
  
<a id="ID4ETB"></a>

 
## Query string parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | --- | --- | --- | 
| indexes| string| Optional. Specifies where to remove items. Supported values: 0, positive integers, and "end". Default value: 0.| 
 
Example: **indexes=1,8** removes items at indexes 1 and 8. Indexes must be unique. If no indexes are provided, the entire list will be cleared.
  
<a id="ID4ETC"></a>

 
## Authorization
 
This call expects an XSTS SAML token in the **Authorization** header. A Xuid claim must exist within that SAML token to identify the caller. This value is used to determine if the caller has access rights to the list data in question. The list itself will be identified by the Xuid as well and will be included in the URI for the list. Using this, we may in the future support shared access to lists, but that is not a feature at this time. Currently, all lists that a user accesses will be their own and there is no shared access. Thus the Xuid in the URI must match the Xuid in the SAML claims token. 

> **Note:**   
> Both XBL Auth 2.0 and 3.0 tokens are supported at present. 


  
<a id="ID4EAD"></a>

 
## Required Request Headers
 
| Header| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| Authorization| Contains the STS token used to authenticate and authorize the request. Must be a token from XSTS service and include the XUID as one of the claims. | 
| X-XBL-Contract-Version| Specifies which API version is being requested (positive integers). Pins supports version 2. If this header is missing or the value is not supported then the service will return a 400 – Bad request with "Unsupported or missing contract version header" in the status description.| 
| Content-Type| Specifies whether the content of request/response bodies will be in json or xml. Supported values are "application/json" and "application/xml"| 
| If-Match| This header must contain the current version number of a list when making modify requests. Modify requests use PUT, POST, or DELETE verbs. If the version in the "If-Match" header does not match the current version of the list, the request will be rejected with an HTTP 412 – precondition failed return code. (optional) Can also be used for GETs, if present and the passed in version matches the current list version then no list data and an HTTP 304 – Not Modified code will be returned. | 
  
<a id="ID4EWE"></a>

 
## Request body
 
No objects are sent in the body of this request.
  
<a id="ID4EBF"></a>

 
## HTTP status codes
 
The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).
 
| Code| Reason phrase| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| 200| OK| The request completed successfully. The response body should contain the requested resource (for a GET). POST and PUT requests will receive up-to-date list metadata (list version, count, etc.).| 
| 201| Created| A new list has been created. This is returned on the initial insert to a list. The response includes up-to-date metadata on the list and the location header contains the URI for the list.| 
| 304| Not Modified| Returned on GETs. Indicates that the client has the latest version of the list. The service compares the value in the <b>If-Match</b> header to the list version. If they are equal, then a 304 gets returned with no data.| 
| 400| Bad Request| The request was malformed. Could be an invalid value or type for a URI or query string parameter. Can also be the result of a missing required parameter or data value, or the request indicated a missing or invalid version of the API. See the <b>X-XBL-Contract-Version</b> header.| 
| 401| Unauthorized| The request requires user authentication.| 
| 403| Forbidden| The request is not allowed for the user or service.| 
| 404| Not Found| The caller does not have access to the resource. This indicates that no such list has been created.| 
| 412| Precondition Failed| Indicates that the version of the list has changed and a modify request has failed. A modify request is an insert, update, or remove. The service checks the <b>If-Match</b> header for the list version. If it does not match the current version of the list, then the operation fails and this is returned along with the current list metadata (which includes the current version).| 
| 500| Internal Server Error| The service is refusing the request due to a server-side error.| 
| 501| Not Implemented| The caller requested a URI that has not been implemented on the server. (Currently only used when a request is made for a list name that is not allow listed.)| 
| 503| Service Unavailable| The server is refusing the request, usually due to excessive load. After a delay (see the <b>Retry-after</b> header), the request can be retried.| 
  
<a id="ID4E6BAC"></a>

 
## Response body
 
<a id="ID4EFCAC"></a>

 
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

   
<a id="ID4EPCAC"></a>

 
## See also
 
<a id="ID4ERCAC"></a>

 
##### Parent 

[/users/xuid(xuid)/lists/PINS/{listname}](uri-usersxuidlistspinslistname.md)

   