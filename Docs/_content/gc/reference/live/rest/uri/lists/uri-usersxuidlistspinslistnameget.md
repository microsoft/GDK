---
title: GET (/users/xuid(xuid)/lists/PINS/{listname})
description: " GET (/users/xuid(xuid)/lists/PINS/{listname})"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/users/xuid(xuid)/lists/PINS/{listname})
Returns the contents of a list. 
The domain for these URIs is `eplists.xboxlive.com`.
 
  * [Remarks](#ID4EV)
  * [URI parameters](#ID4EIB)
  * [Query string parameters](#ID4ETB)
  * [Authorization](#ID4ESD)
  * [Required Request Headers](#ID4E6D)
  * [Request body](#ID4EVF)
  * [HTTP status codes](#ID4EAG)
  * [Response body](#ID4E5CAC)
 
<a id="ID4EV"></a>

 
## Remarks
 
The **listCount** field in the data returned indicates how many items are in the total list maintained by the service -- as such, it can be used to determine where the end of the list is, and this is potentially a different number from how many specific items were returned by the request.
 
If the list does not yet exist, then the results will contain no list items, the **listCount** will be zero and the **listVersion** will be zero.
  
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
| skipItems| 32-bit signed integer| Optional. Number of items to skip in the enumeration before returning results. Default value: 0.| 
| maxItems| 32-bit signed integer| Optional. Maximum number of items to return. The default is 25 items if no maximum is specified in the request. The service does not place a maximum on this value; if the value is greater than the number of items in the list, then all items will be returned with no error.| 
| filterItemId| string| Optional. Specifies the item to find in the list. Returns all instances of the item in the list. Allows the client to quickly determine if and where an item is in a list. Handy for large lists to determine all instances of an item without iterating through the entire list. Default value: null.| 
| filterContentType| string| Optional. Specifies a comma-separated list of content types to return (will not return types not in the list). Used to only get certain content types from a list. A comma-separated list of content types is used for this filter. (Multiple content types can be queried in one call.) Content types supported include all the media types defined by Entertainment Discovery Services (EDS). Default value: null (all content types).| 
| filterDeviceType| string| Optional. Specifies a comma-separated list of device types to return (will not return types not in the list). Filters the return set to only return items which have been inserted from a specific set of device types. A comma-separated list of device types is used for this filter (multiple device types can be queried in one call). Possible values: XboxOne, MCapensis, WindowsPhone, WindowsPhone7, Web, PC, MoLive. Default value: null (all content types).| 
  
<a id="ID4ESD"></a>

 
## Authorization
 
This call expects an XSTS SAML token in the **Authorization** header. A Xuid claim must exist within that SAML token to identify the caller. This value is used to determine if the caller has access rights to the list data in question. The list itself will be identified by the Xuid as well and will be included in the URI for the list. Using this, we may in the future support shared access to lists, but that is not a feature at this time. Currently, all lists that a user accesses will be their own and there is no shared access. Thus the Xuid in the URI must match the Xuid in the SAML claims token. 

> **Note:**   
> Both XBL Auth 2.0 and 3.0 tokens are supported at present. 


  
<a id="ID4E6D"></a>

 
## Required Request Headers
 
| Header| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| Authorization| Contains the STS token used to authenticate and authorize the request. Must be a token from XSTS service and include the XUID as one of the claims. | 
| X-XBL-Contract-Version| Specifies which API version is being requested (positive integers). Pins supports version 2. If this header is missing or the value is not supported then the service will return a 400 – Bad request with "Unsupported or missing contract version header" in the status description.| 
| Content-Type| Specifies whether the content of request/response bodies will be in json or xml. Supported values are "application/json" and "application/xml"| 
| If-Match| This header must contain the current version number of a list when making modify requests. Modify requests use PUT, POST, or DELETE verbs. If the version in the "If-Match" header does not match the current version of the list, the request will be rejected with an HTTP 412 – precondition failed return code. (optional) Can also be used for GETs, if present and the passed in version matches the current list version then no list data and an HTTP 304 – Not Modified code will be returned. | 
  
<a id="ID4EVF"></a>

 
## Request body
 
No objects are sent in the body of this request.
  
<a id="ID4EAG"></a>

 
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
  
<a id="ID4E5CAC"></a>

 
## Response body
 
<a id="ID4EEDAC"></a>

 
### Sample response
 

```cpp
{ 
"ListMetadata":
  {"ListVersion": 12,
   "ListCount": 6,
   "MaxListSize": 200,
   "AccessSetting": "OwnerOnly",
   "AllowDuplicates": true
  },
"ListItems":
  [{ 
   "Index": 0,
   "DateAdded": "\/Date(1198908717056)/",
   "DateModified": "\/Date(1198908717056)/",
   "HydrationResult": "Indeterminate",
   "HydratedItem": null

   "Item":
   {
     "ContentType": "Movie",
     "ItemId": "3a5095a5-eac3-4215-944d-27bc051faa47",
     "ProviderId": null,
     "Provider": null,
     "ImageUrl": "http://www.bing.com/thumb/get?bid=Gw%2fsjCGSS4kAAQ584x800&bn=SANGAM&fbid=7wIR63+Clmj+0A&fbn=CC",
     "Title": "The Dark Knight",
     "SubTitle": null,
     "Locale": "en-us",
     "AltImageUrl": null,
     "DeviceType": "XboxOne"
    }
  }]
}
         
```

   
<a id="ID4EODAC"></a>

 
## See also
 
<a id="ID4EQDAC"></a>

 
##### Parent 

[/users/xuid(xuid)/lists/PINS/{listname}](uri-usersxuidlistspinslistname.md)

  
<a id="ID4E1DAC"></a>

 
##### Further Information 

[Marketplace URIs](../marketplace/atoc-reference-marketplace.md)

 [Additional Reference](../../additional/atoc-xboxlivews-reference-additional.md)

   