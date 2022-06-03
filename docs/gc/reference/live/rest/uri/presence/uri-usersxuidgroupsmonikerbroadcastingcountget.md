---
title: GET (/users/xuid({xuid})/groups/{moniker}/broadcasting/count )
description: " GET (/users/xuid({xuid})/groups/{moniker}/broadcasting/count )"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/users/xuid({xuid})/groups/{moniker}/broadcasting/count )
Retrieves the count of the broadcasting users specified by the groups moniker related to the XUID that appears in the URI. 
The domain for these URIs is `userpresence.xboxlive.com`.
 
  * [Remarks](#ID4EV)
  * [URI parameters](#ID4E5)
  * [Query string parameters](#ID4EJB)
  * [Authorization](#ID4EKC)
  * [Effect of privacy settings on resource](#ID4EQD)
  * [Required Request Headers](#ID4EEH)
  * [Optional Request Headers](#ID4EMBAC)
  * [Request body](#ID4EMCAC)
  * [HTTP status codes](#ID4EXCAC)
  * [Required Response Headers](#ID4E3GAC)
  * [Optional Response Headers](#ID4EMJAC)
  * [Response body](#ID4E5KAC)
 
<a id="ID4EV"></a>

 
## Remarks
 
Retrieves the count of the broadcasting users specified by the groups moniker related to the XUID that appears in the URI.
  
<a id="ID4E5"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| xuid| string| Xbox User ID (XUID) of the user related to the XUIDs in the Group.| 
| moniker| string| String defining the group of users. The only accepted moniker at present is "People" with an uppercase 'P'.| 
  
<a id="ID4EJB"></a>

 
## Query string parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | --- | --- | --- | 
| level| string| Returns the level of detail as specified by this query string. Valid options include "user", "device", "title", and "all".The level "user" is the PresenceRecord object without the DeviceRecord nested object. The level "device" is the PresenceRecord and DeviceRecord objects without the TitleRecord nested object. The level "title" is the PresenceRecord, DeviceRecord, and TitleRecord objects without the ActivityRecord nested object. The level "all" is the entire record, including all nested objects.If this parameter is not provided, the service defaults to the title level (that is, it returns presence for this user down to the details of title).| 
  
<a id="ID4EKC"></a>

 
## Authorization
 
Authorization claims used | Claim| Type| Required?| Example value| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| <b>Xuid</b>| 64-bit signed integer| yes| 1234567890| 
  
<a id="ID4EQD"></a>

 
## Effect of privacy settings on resource
 
The service will always return 200 OK if the request itself is well-formed. However, it will filter out information from the response when privacy checks do not pass.
 
Effect of Privacy Settings on Resource | Requesting User| Target User's Privacy Setting| Behavior| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| me| -| As described.| 
| friend| everyone| As described.| 
| friend| friends only| As described.| 
| friend| blocked| As described - the service will filter out data.| 
| non-friend user| everyone| As described.| 
| non-friend user| friends only| As described - the service will filter out data.| 
| non-friend user| blocked| As described - the service will filter out data.| 
| third-party site| everyone| As described - the service will filter out data.| 
| third-party site| friends only| As described - the service will filter out data.| 
| third-party site| blocked| As described - the service will filter out data.| 
  
<a id="ID4EEH"></a>

 
## Required Request Headers
 
| Header| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| Authorization| string| Authentication credentials for HTTP authentication. Example value: "XBL3.0 x=&lt;userhash>;&lt;token>".| 
| x-xbl-contract-version| string| Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, and so on. Example values: 3, vnext.| 
| Accept| string| Content-Types that are acceptable. The only one Presence supports is <b>application/json</b>, but it still must be specified in the header.| 
| Accept-Language| string| Acceptable locale for strings in the response. Example value: en-US.| 
| Host| string| Domain name of the server. Example value: userpresence.xboxlive.com.| 
  
<a id="ID4EMBAC"></a>

 
## Optional Request Headers
 
| Header| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| X-RequestedServiceVersion|  | Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, and so on. Default value: 1.| 
  
<a id="ID4EMCAC"></a>

 
## Request body
 
No objects are sent in the body of this request.
  
<a id="ID4EXCAC"></a>

 
## HTTP status codes
 
The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).
 
| Code| Reason phrase| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| 200| OK| The session was successfully retrieved.| 
| 400| Bad Request| Service could not understand malformed request. Typically an invalid parameter.| 
| 401| Unauthorized| The request requires user authentication.| 
| 403| Forbidden| The request is not allowed for the user or service.| 
| 404| Not Found| The specified resource could not be found.| 
| 405| Method Not Allowed| HTTP method was used on an unsupported content type.| 
| 406| Not Acceptable| Resource version is not supported.| 
| 500| Request Timeout| Service could not understand malformed request. Typically an invalid parameter.| 
| 503| Request Timeout| Service could not understand malformed request. Typically an invalid parameter.| 
  
<a id="ID4E3GAC"></a>

 
## Required Response Headers
 
| Header| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| x-xbl-contract-version| string| Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, and so on. Example values: 1, vnext.| 
| Content-Type| string| The mime type of the body of the request. Example value: <b>application/json</b>.| 
| Cache-Control| string| Polite request to specify caching behavior. Example values: "no-cache".| 
| X-XblCorrelationId| string| Service-generated value to correlate what the server returns and what is received by the client. Example value: "4106d0bc-1cb3-47bd-83fd-57d041c6febe".| 
| X-Content-Type-Option| string| Returns the SDL-compliant value. Example value: "nosniff".| 
| Date| string| The date/time the message was sent. Example value: "Tue, 17 Nov 2012 10:33:31 GMT".| 
  
<a id="ID4EMJAC"></a>

 
## Optional Response Headers
 
| Header| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| Retry-After| string| Returned on 503 HTTP errors. Lets client know how long to wait before retrying the call. Example values: "120".| 
| Content-Length| string| Length of response body. Example value: "527".| 
| Content-Encoding| string| Encoding type of the response. Example value: "gzip".| 
  
<a id="ID4E5KAC"></a>

 
## Response body
 
This API returns a count of the current number of broadcasts given the parameters.
 
<a id="ID4EGLAC"></a>

 
### Sample response
 

```cpp
{
    "count":42
 }

         
```

   
<a id="ID4EQLAC"></a>

 
## See also
 
<a id="ID4ESLAC"></a>

 
##### Parent 

[/users/xuid({xuid})/groups/{moniker}](uri-usersxuidgroupsmoniker.md)

   