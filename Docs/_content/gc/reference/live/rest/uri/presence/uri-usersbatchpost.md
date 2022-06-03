---
title: POST (/users/batch)
description: " POST (/users/batch)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# POST (/users/batch)
Get presence for a batch of users.
The domain for these URIs is `userpresence.xboxlive.com`.

  * [Remarks](#ID4EV)
  * [Authorization](#ID4EAB)
  * [Effect of privacy settings on resource](#ID4EDC)
  * [Required Request Headers](#ID4EYF)
  * [Optional Request Headers](#ID4EGAAC)
  * [Request body](#ID4EGBAC)
  * [Response body](#ID4ESEAC)

<a id="ID4EV"></a>


## Remarks

This method should be used by any client, service, or title wanting to learn presence information for a batch of users.

The responses for this batch request can be filters by depth and path. Consumers can use this to find out and display the presence about a set of users. The filters on this API work as ORs in a property, but ANDs across properties.

<a id="ID4EAB"></a>


## Authorization

| Type| Required| Description| Response if missing|
| --- | --- | --- | --- |
| XUID| Yes| Xbox User ID (XUID) of the caller| 403 Forbidden|

<a id="ID4EDC"></a>


## Effect of privacy settings on resource

This method always returns 200 OK, but might not return content in the response body.

| Requesting User| Target User's Privacy Setting| Behavior|
| --- | --- | --- | --- | --- | --- | --- |
| me| -| 200 OK|
| friend| everyone| 200 OK|
| friend| friends only| 200 OK|
| friend| blocked| 200 OK|
| non-friend user| everyone| 200 OK|
| non-friend user| friends only| 200 OK|
| non-friend user| blocked| 200 OK|
| third-party site| everyone| 200 OK|
| third-party site| friends only| 200 OK|
| third-party site| blocked| 200 OK|

<a id="ID4EYF"></a>


## Required Request Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Authorization| string| Authentication credentials for HTTP authentication. Example value: "XBL3.0 x=&lt;userhash>;&lt;token>".|
| x-xbl-contract-version| string| Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, and so on. Example values: 3, vnext.|
| Accept| string| Content-Types that are acceptable. The only one supported by Presence is application/json, but it must be specified in the header.|
| Accept-Language| string| Acceptable locale for strings in the response. Example values: en-US.|
| Host| string| Domain name of the server. Example value: presencebeta.xboxlive.com.|
| Content-Length| string| The length of the request body. Example value: 312.|

<a id="ID4EGAAC"></a>


## Optional Request Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| X-RequestedServiceVersion|  | Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, and so on. Default value: 1.|

<a id="ID4EGBAC"></a>


## Request body

<a id="ID4EMBAC"></a>


### Required members

| Member| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| users| List XUIDs of users whose presence you want to learn, with a maximum of 1100 XUIDs at a time.|

<a id="ID4EHCAC"></a>


### Optional members

| Member| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| deviceTypes| List of device types used by the users you want to know about. If the array is left empty, it defaults to all possible device types (that is, none are filtered out).|
| titles| List of device types whose users you want to know about. If the array is left empty, it defaults to all possible titles (that is, none are filtered out).|
| level| Possible values: <ul><li>user - get user nodes</li><li>device - get user and device nodes</li><li>title - get basic title level information</li><li>all - get rich presence information, media information, or both</li></ul><br> The default is "title".|
| onlineOnly| If this property is true, the batch operation will filter out records for offline users (including cloaked ones). If it is not supplied, both online and offline users will be returned.|

<a id="ID4E4DAC"></a>


### Prohibited members

All other members are prohibited in a request.

<a id="ID4EIEAC"></a>


### Sample request


```cpp
{
  users:
  [
    "1234567890",
    "4567890123",
    "7890123456"
  ]
}

```


<a id="ID4ESEAC"></a>


## Response body

<a id="ID4E1EAC"></a>


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


<a id="ID4EKFAC"></a>


## See also

<a id="ID4EMFAC"></a>


##### Parent

[/users/batch](uri-usersbatch.md)