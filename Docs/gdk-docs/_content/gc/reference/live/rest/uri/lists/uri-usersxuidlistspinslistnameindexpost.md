---
title: POST /users/xuid(xuid)/lists/PINS/{listname}/index({index})?insertIndex={insertIndex}
description: " POST /users/xuid(xuid)/lists/PINS/{listname}/index({index})?insertIndex={insertIndex}"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# POST /users/xuid(xuid)/lists/PINS/{listname}/index({index})?insertIndex={insertIndex}
Moves an item in a list to a different position within the list. 
The domain for these URIs is `eplists.xboxlive.com`.
 
  * [Remarks](#ID4EV)
  * [URI parameters](#ID4EEB)
  * [Query string parameters](#ID4EWC)
  * [Request body](#ID4EVD)
  * [HTTP status codes](#ID4EEE)
  * [Required Request Headers](#ID4E1BAC)
  * [Response body](#ID4EQDAC)
 
<a id="ID4EV"></a>

 
## Remarks 
 
This call is provided to allow the client to easily move an item to a different index within the list in a single operation. Only one item may be moved at a time. If the index of the item to be moved does not exist then an HTTP 400 will be returned. The index for the insertion point follows the same rules as a standard insert. It will default to 0 – the beginning of the list and any number greater than the number of items in the list will re-insert the item at the end of the list. Similarly the end of the list can be indicated by passing "end" for insertIndex. 
 
This call also allows you to identify the item to be moved by the itemId (or provider/providerId combo). In this case, the itemId must be passed in the body of the request and it must match an existing item in the list. If it does not, an HTTP 400 error will be returned with IndexOutOfRange in the description; for this special version of the call, use "-1" as the index of the item to be moved. 
 
This call requires an "If-Match:versionNumber" header to be included in the request if specifying the item by index. If using itemId to indicate which item to move, then the "If-Match" header is optional. If present, the "If-Match" header will always be validated. In the "if-Match" header, the versionNumber is the current version number of the list. If it is not included (and required), or does not match the current list version number, then an HTTP 412 – precondition failed status code will be returned and the body of the response will contain the latest metadata of the list which includes the current version number. This is done to guard against updates from different clients trampling on each other. 
  
<a id="ID4EEB"></a>

 
## URI parameters 
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| XUID| string| XUID of the user.| 
| listname| string| Name of the list to manipulate.| 
| index| string| Specifies the current index of the item to be moved. If the index value is zero or a positive integer, this refers to the current index of the item, and the request body of the call should be empty. However, if the index value is "-1", the item to be moved must be specified by ItemId or Provider/ProviderID in the request body of the call.| 
  
<a id="ID4EWC"></a>

 
## Query string parameters 
 
| Parameter| Type| Description| 
| --- | --- | --- | --- | --- | --- | 
| insertIndex| string| Specifies the list location to insert the item. Allowed values are zero, positive integers, and "end". "end" places the item at the end of the current list. If the specified value is beyond the end of the list, the item is inserted at the end of the list. | 
  
<a id="ID4EVD"></a>

 
## Request body 
 
A request body is sent only when specifying the item to move by itemId or by Provider/ProviderId.
 
<a id="ID4E6D"></a>

  
Sample Request 

```cpp
{
  "Item":
  {
    "ItemId":  "ed591a0c-dde3-563f-99af-530278a3c402",
    "ProviderId":  null,
    "Provider": null
  }
}
    
```

  
<a id="ID4EEE"></a>

 
## HTTP status codes 
 
The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).
 
| Code| Reason phrase| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | 
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
  
<a id="ID4E1BAC"></a>

 
## Required Request Headers
 
| Header| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| Authorization| Contains the STS token used to authenticate and authorize the request. Must be a token from XSTS service and include the XUID as one of the claims. | 
| X-XBL-Contract-Version| Specifies which API version is being requested (positive integers). Pins supports version 2. If this header is missing or the value is not supported then the service will return a 400 – Bad request with "Unsupported or missing contract version header" in the status description.| 
| Content-Type| Specifies whether the content of request/response bodies will be in json or xml. Supported values are "application/json" and "application/xml"| 
| If-Match| This header must contain the current version number of a list when making modify requests. Modify requests use PUT, POST, or DELETE verbs. If the version in the "If-Match" header does not match the current version of the list, the request will be rejected with an HTTP 412 – precondition failed return code. (optional) Can also be used for GETs, if present and the passed in version matches the current list version then no list data and an HTTP 304 – Not Modified code will be returned. | 
  
<a id="ID4EQDAC"></a>

 
## Response body 
 
If the call is successful, the service returns the latest metadata for the list. 
 
<a id="ID4E1DAC"></a>

 
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

   
<a id="ID4EIEAC"></a>