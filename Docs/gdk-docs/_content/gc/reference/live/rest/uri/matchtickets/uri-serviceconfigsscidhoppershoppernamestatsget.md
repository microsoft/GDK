---
title: GET (/serviceconfigs/{scid}/hoppers/{name}/stats)
description: " GET (/serviceconfigs/{scid}/hoppers/{name}/stats)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/serviceconfigs/{scid}/hoppers/{name}/stats)

Gets the statistics for a hopper.

> **Important:**  
> This method is intended for use with contract 103 or later, and requires a header element of X-Xbl-Contract-Version: 103 or later on every request.

  * [Remarks](#ID4ET)
  * [URI parameters](#ID4E5)
  * [Authorization](#ID4EJB)
  * [HTTP status codes](#ID4E3C)
  * [Request body](#ID4EFD)
  * [Response body](#ID4EQD)

<a id="ID4ET"></a>


## Remarks
This HTTP/REST method gets statistics from the named hopper at the service configuration ID (SCID) level. This method can be wrapped by the **Microsoft.Xbox.Services.Matchmaking.MatchmakingService.GetHopperStatisticsAsync** API.  
<a id="ID4E5"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- | --- |
| scid| GUID| The service configuration identifier (SCID) for the session.|
| name| string| The name of the hopper.|

<a id="ID4EJB"></a>


## Authorization

| Type| Required| Description| Response if missing|
| --- | --- | --- | --- | --- | --- | --- | --- |
| XUID (user ID)| yes| The user making the request must be a member of the ticket session referred to by the ticket. | 403|
| Privileges and Device Type| yes| When the user's deviceType is set to console, only users with the multiplayer privilege in their claims are allowed to make calls to the matchmaking service. | 403|
| Title ID/Proof of Purchase/Device Type| yes| The title that is being matched into must allow matchmaking for the specified title claim, device type combination. | 403|

<a id="ID4E3C"></a>


## HTTP status codes
The service returns an HTTP status code as it applies to MPSD.  
<a id="ID4EFD"></a>


## Request body

No objects are sent in the body of this request.

<a id="ID4EQD"></a>


## Response body

| Member| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| hopperName| string| The name of the selected hopper.|
| waitTime| 32-bit signed integer| Average matching time for the hopper (an integral number of seconds). |
| population| 32-bit signed integer| The number of people waiting for matches in the hopper.|

<a id="ID4E1D"></a>


### Sample response


```cpp
{
      "hopperName":"contosoawesome2",
      "waitTime":30,
      "population":1
    }


```


<a id="ID4EJE"></a>


## See also

<a id="ID4ELE"></a>


##### Parent  

[/serviceconfigs/{scid}/hoppers/{name}/stats](uri-serviceconfigsscidhoppershoppernamestats.md)