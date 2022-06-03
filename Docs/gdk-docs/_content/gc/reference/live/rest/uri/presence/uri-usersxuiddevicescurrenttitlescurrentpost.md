---
title: POST (/users/xuid({xuid})/devices/current/titles/current)
description: " POST (/users/xuid({xuid})/devices/current/titles/current)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# POST (/users/xuid({xuid})/devices/current/titles/current)
Update a title with a user's presence. 
The domain for these URIs is `userpresence.xboxlive.com`.
 
  * [Remarks](#ID4EV)
  * [URI parameters](#ID4EEB)
  * [Authorization](#ID4EPB)
  * [Required Request Headers](#ID4ENE)
  * [Optional Request Headers](#ID4ERG)
  * [Request body](#ID4ERH)
  * [Response body](#ID4EKAAC)
 
<a id="ID4EV"></a>

 
## Remarks
 
This URI can be used by all titles on non-console platforms to add and update the presence, rich presence, and media presence data for a title.
 
**SandboxId** is now retrieved from the claim in the XToken and enforced. If the **SandboxId** is not present, then Entertainment Discovery Services (EDS) will throw a 400 Bad request error.
  
<a id="ID4EEB"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| xuid| 64-bit unsigned integer| Xbox User ID (XUID) of the target user.| 
  
<a id="ID4EPB"></a>

 
## Authorization
 
| Type| Required| Description| Response if missing| 
| --- | --- | --- | --- | --- | --- | --- | 
| XUID| Yes| Xbox User ID (XUID) of the caller| 403 Forbidden| 
| titleId| Yes| titleId of the title| 403 Forbidden| 
| deviceId| Yes for all except Windows and Web| deviceId of the caller| 403 Forbidden| 
| deviceType| Yes for all except Web| deviceType of the caller| 403 Forbidden| 
| sandboxId| Yes for calls coming from | sandbox of the caller| 403 Forbidden| 
  
<a id="ID4ENE"></a>

 
## Required Request Headers
 
| Header| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| Authorization| string| Authentication credentials for HTTP authentication. Example value: "XBL3.0 x=&lt;userhash>;&lt;token>".| 
| x-xbl-contract-version| string| Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, and so on. Example values: 3, vnext.| 
| Content-Type| string| The mime type of the body of the request Example value: application/json.| 
| Content-Length| string| The length of the request body. Example value: 312.| 
| Host| string| Domain name of the server. Example value: presencebeta.xboxlive.com.| 
  
<a id="ID4ERG"></a>

 
## Optional Request Headers
 
| Header| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| X-RequestedServiceVersion|  | Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, and so on. Default value: 1.| 
  
<a id="ID4ERH"></a>

 
## Request body
 
The request object is a [TitleRequest](../../json/json-titlerequest.md). Only the properties actually present in the body are updated. Any properties that are not part of the body but exist on the server will not be modified.
 
<a id="ID4EAAAC"></a>

 
### Sample request
 

```cpp
{
  id:"12341234",
  placement:"snapped",
  state:"active"
}
      
```

   
<a id="ID4EKAAC"></a>

 
## Response body
 
In case of success, an HTTP status code of 200 or 201 Created is returned, as appropriate.
 
In case of an error (HTTP 4xx or 5xx), appropriate error information is returned in the response body.
  
<a id="ID4EVAAC"></a>

 
## See also
 
<a id="ID4EXAAC"></a>

 
##### Parent 

[/users/xuid({xuid})/devices/current/titles/current](uri-usersxuiddevicescurrenttitlescurrent.md)

  
<a id="ID4EBBAC"></a>

 
##### Further Information 

[Marketplace URIs](../marketplace/atoc-reference-marketplace.md)

 [Additional Reference](../../additional/atoc-xboxlivews-reference-additional.md)

   