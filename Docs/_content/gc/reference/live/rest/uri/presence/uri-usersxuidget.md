---
title: GET (/users/xuid({xuid}))
description: " GET (/users/xuid({xuid}))"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/users/xuid({xuid}))
Discover the presence of another user or client.
The domain for these URIs is `userpresence.xboxlive.com`.

  * [Remarks](#ID4EV)
  * [URI parameters](#ID4EDB)
  * [Query string parameters](#ID4EOB)
  * [Authorization](#ID4E4C)
  * [Effect of privacy settings on resource](#ID4EAE)
  * [Required Request Headers](#ID4EVH)
  * [Optional Request Headers](#ID4E1BAC)
  * [Request body](#ID4E1CAC)
  * [Response body](#ID4EFDAC)

<a id="ID4EV"></a>


## Remarks

The response can be filtered to provide part of the [PresenceRecord](../../json/json-presencerecord.md) if the consumer is not interested in the entire object.

> **Note:**   
> The data returned is constrained by privacy and content isolation rules.



<a id="ID4EDB"></a>

 
## URI parameters

| Parameter| Type| Description|
| --- | --- | --- | --- |
| xuid| 64-bit unsigned integer| Xbox User ID (XUID) of the target user.|

<a id="ID4EOB"></a>


## Query string parameters

| Parameter| Type| Description|
| --- | --- | --- | --- | --- | --- | --- |
| level| string| Optional. <ul><li><b>user</b>: Returns only the user node.</li><li><b>device</b>: Returns user node and device nodes.</li><li><b>title</b>: Default. Returns the whole tree except activity.</li><li><b>all</b>: Returns the whole tree, including activity-level presence.</li></ul> |

<a id="ID4E4C"></a>


## Authorization

| Type| Required| Description| Response if missing|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| XUID| Yes| Xbox User ID (XUID) of the caller| 403 Forbidden|

<a id="ID4EAE"></a>


## Effect of privacy settings on resource

This method always returns 200 OK, but might not return content in the response body.

| Requesting User| Target User's Privacy Setting| Behavior|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
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

<a id="ID4EVH"></a>


## Required Request Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Authorization| string| Authentication credentials for HTTP authentication. Example value: "XBL3.0 x=&lt;userhash>;&lt;token>".|
| x-xbl-contract-version| string| Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, and so on. Example values: 3, vnext.|
| Accept| string| Content-Types that are acceptable. The only one supported by Presence is application/json, but it must be specified in the header.|
| Accept-Language| string| Acceptable locale for strings in the response. Example values: en-US.|
| Host| string| Domain name of the server. Example value: presencebeta.xboxlive.com.|

<a id="ID4E1BAC"></a>


## Optional Request Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| X-RequestedServiceVersion|  | Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, and so on. Default value: 1.|

<a id="ID4E1CAC"></a>


## Request body

No objects are sent in the body of this request.

<a id="ID4EFDAC"></a>


## Response body

<a id="ID4ELDAC"></a>


### Sample response

If there is no existing record for the user, a record with no devices is returned.


```json
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


<a id="ID4EXDAC"></a>


## See also

<a id="ID4EZDAC"></a>


##### Parent

[/users/xuid({xuid})](uri-usersxuid.md)