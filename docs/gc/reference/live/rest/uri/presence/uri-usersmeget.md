---
title: GET (/users/me)
description: " GET (/users/me)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/users/me)
Obtain the current user's [PresenceRecord](../../json/json-presencerecord.md) without having to know the user's XUID.
The domain for these URIs is `userpresence.xboxlive.com`.

  * [Query string parameters](#ID4EZ)
  * [Authorization](#ID4EIC)
  * [Required Request Headers](#ID4ELD)
  * [Optional Request Headers](#ID4EPF)
  * [Request body](#ID4EPG)
  * [Response body](#ID4E1G)

<a id="ID4EZ"></a>


## Query string parameters

| Parameter| Type| Description|
| --- | --- | --- |
| level| string| Optional. <ul><li><b>user</b>: Returns only the user node.</li><li><b>device</b>: Returns user node and device nodes.</li><li><b>title</b>: Default. Returns the whole tree except activity.</li><li><b>all</b>: Returns the whole tree, including activity-level presence.</li></ul> | 

<a id="ID4EIC"></a>


## Authorization

| Type| Required| Description| Response if missing|
| --- | --- | --- | --- | --- | --- | --- |
| XUID| Yes| Xbox User ID (XUID) of the caller| 403 Forbidden|

<a id="ID4ELD"></a>


## Required Request Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Authorization| string| Authentication credentials for HTTP authentication. Example value: "XBL3.0 x=&lt;userhash>;&lt;token>".|
| x-xbl-contract-version| string| Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, and so on. Example values: 3, vnext.|
| Accept| string| Content-Types that are acceptable. The only one supported by Presence is application/json, but it must be specified in the header.|
| Accept-Language| string| Acceptable locale for strings in the response. Example values: en-US.|
| Host| string| Domain name of the server. Example value: presencebeta.xboxlive.com.|

<a id="ID4EPF"></a>


## Optional Request Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| X-RequestedServiceVersion|  | Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, and so on. Default value: 1.|

<a id="ID4EPG"></a>


## Request body

No objects are sent in the body of this request.

<a id="ID4E1G"></a>


## Response body

<a id="ID4EAH"></a>


### Sample response

This method returns a [PresenceRecord](../../json/json-presencerecord.md).


```cpp
{
  xuid:"0123456789",
  state:"online",
  devices:
  [{
    type:"D",
    titles:
    [{
      id:"12341234",
      name:"Contoso 5",
      state:"active",
      placement:"fill",
      timestamp:"2012-09-17T07:15:23.4930000",
      activity:
      {
        richPresence:"Team Deathmatch on Nirvana"
      }
    },
    {
      id:"12341235",
      name:"Contoso Waypoint",
      timestamp:"2012-09-17T07:15:23.4930000",
      placement:"snapped",
      state:"active",
      activity:
      {
        richPresence:"Using radar"
      }
    }]
  },
  {
    type:W8,
    titles:
    [{
      id:"23452345",
      name:"Contoso Gamehelp",
      state:"active",
      placement:"full",
      timestamp:"2012-09-17T07:15:23.4930000",
      activity:
      {
        richPresence:"Nirvana page",
      }
    }]
  }]
}

```


<a id="ID4EQH"></a>


## See also

<a id="ID4ESH"></a>


##### Parent

[/users/me](uri-usersme.md)