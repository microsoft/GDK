---
title: POST (/users/xuid(xuid)/lists/PINS/{listname})
description: " POST (/users/xuid(xuid)/lists/PINS/{listname})"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# POST (/users/xuid(xuid)/lists/PINS/{listname})
Inserts items into the list at the index based on the query string parameter **insertIndex**. 
The domain for these URIs is `eplists.xboxlive.com`.
 
  * [Remarks](#ID4EY)
  * [URI parameters](#ID4ETB)
  * [Query string parameters](#ID4E5B)
  * [Authorization](#ID4EZC)
  * [HTTP status codes](#ID4EGD)
  * [Required Request Headers](#ID4EEAAC)
  * [Sample request](#ID4E1BAC)
  * [Response body](#ID4EPCAC)
 
<a id="ID4EY"></a>

 
## Remarks
 
This call will insert items into the list at the index based on the query string parameter **insertIndex** (defaults to 0 or the beginning of the list). All items in the request body will be inserted at that point in the list. If the **insertIndex** is greater than the number of items in the existing list, the new items will be inserted at the end.
 
Items to be inserted must have the required fields indicated in the functional spec; otherwise, an HTTP 400 will be returned. Similarly, if the result of the insert will exceed the maximum size of the list (defined per list type) then an HTTP 400 will be returned and nothing will be inserted.
 
If the item is *not* to be inserted at the beginning or the end of the list, then the **If-Match:versionNumber** header is required to be included in the request. The header is optional if the insertion is for the beginning or the end. If present, the header will be validated regardless of the insert location. In the header **VersionNumber** is the current version number of the list. If it is not included and required, or does not match the current list version number, then an HTTP 412 (precondition failed) status code will be returned and the body of the response will contain the latest metadata of the list that includes the current version number. This is to guard against updates from different clients trampling on one another.
 
Note that this call is not idempotent; repeated calls with the same data could result in multiple insertions. However, since no list currently supports duplicates, repeated calls will likely result in HTTP 400 codes being returned.
  
<a id="ID4ETB"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| xuid| string| Xbox User ID (XUID).| 
| listtype| string| Type of the list (how it is used and how it acts). Always "PINS" for these related methods.| 
| listname| string| Name of the list (which list of a given listtype to act on). Always "XBLPins" for items in Pins.| 
  
<a id="ID4E5B"></a>

 
## Query string parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | --- | --- | --- | 
| insertIndex| string| Optional. Defines where to insert items. Supported values: 0, positive integers, and "end". Any index value greater than the number of list items will add the new item at the bottom of the list, and will not insert "blank" space in the list. Default value: 0.| 
  
<a id="ID4EZC"></a>

 
## Authorization
 
This call expects an XSTS SAML token in the **Authorization** header. A Xuid claim must exist within that SAML token to identify the caller. This value is used to determine if the caller has access rights to the list data in question. The list itself will be identified by the Xuid as well and will be included in the URI for the list. Using this, we may in the future support shared access to lists, but that is not a feature at this time. Currently, all lists that a user accesses will be their own and there is no shared access. Thus the Xuid in the URI must match the Xuid in the SAML claims token. 

> **Note:**   
> Both XBL Auth 2.0 and 3.0 tokens are supported at present. 


  
<a id="ID4EGD"></a>

 
## HTTP status codes
 
The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).
 
| Code| Reason phrase| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
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
  
<a id="ID4EEAAC"></a>

 
## Required Request Headers
 
| Header| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| Authorization| Contains the STS token used to authenticate and authorize the request. Must be a token from XSTS service and include the XUID as one of the claims. | 
| X-XBL-Contract-Version| Specifies which API version is being requested (positive integers). Pins supports version 2. If this header is missing or the value is not supported then the service will return a 400 – Bad request with "Unsupported or missing contract version header" in the status description.| 
| Content-Type| Specifies whether the content of request/response bodies will be in json or xml. Supported values are "application/json" and "application/xml"| 
| If-Match| This header must contain the current version number of a list when making modify requests. Modify requests use PUT, POST, or DELETE verbs. If the version in the "If-Match" header does not match the current version of the list, the request will be rejected with an HTTP 412 – precondition failed return code. (optional) Can also be used for GETs, if present and the passed in version matches the current list version then no list data and an HTTP 304 – Not Modified code will be returned. | 
  
<a id="ID4E1BAC"></a>

 
## Sample request
 
**ContentType**, **ItemId** or **ProviderId**, **Provider** and **Locale** are mandatory.
 

```cpp
{"Items":
  [{
    "ContentType": "Movie",
    "ItemId": "3a5095a5-eac3-4215-944d-27bc051faa47",
    "ProviderId": "",
    "Provider": "",
    "ImageUrl": "http://www.bing.com/thumb/get?bid=Gw%2fsjCGSS4kAAQ584x800&bn=SANGAM&fbid=7wIR63+Clmj+0A&fbn=CC", 
    "AltImageUrl": null, 
    "Title": "The Dark Knight", 
    "SubTitle": null, 
    "Locale": "en-us",
    "DeviceType": "XboxOne"
  }]}
      
```

  
<a id="ID4EPCAC"></a>

 
## Response body
 
<a id="ID4EVCAC"></a>

 
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

   
<a id="ID4E6CAC"></a>

 
## See also
 
<a id="ID4EBDAC"></a>

 
##### Parent 

[/users/xuid(xuid)/lists/PINS/{listname}](uri-usersxuidlistspinslistname.md)

   