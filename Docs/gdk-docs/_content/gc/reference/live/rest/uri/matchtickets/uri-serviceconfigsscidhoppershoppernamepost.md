---
title: POST (/serviceconfigs/{scid}/hoppers/{hoppername})
description: " POST (/serviceconfigs/{scid}/hoppers/{hoppername})"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# POST (/serviceconfigs/{scid}/hoppers/{hoppername})

Creates the specified match ticket.

> **Important:**  
> This method is intended for use with contract 103 or later, and requires a header element of X-Xbl-Contract-Version: 103 or later on every request.

  * [Remarks](#ID4ET)
  * [URI parameters](#ID4E5)
  * [Authorization](#ID4EJB)
  * [HTTP status codes](#ID4E3C)
  * [Request body](#ID4EFD)
  * [Response body](#ID4E3G)

<a id="ID4ET"></a>


## Remarks

This HTTP/REST method creates a match ticket for a hopper with a particular name at the service configuration ID (SCID) level. This method can be wrapped by the **Microsoft.Xbox.Services.Matchmaking.MatchmakingService.CreateMatchTicketAsync** method.  
<a id="ID4E5"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- | --- |
| scid| GUID| The service configuration identifier (SCID) for the session.|
| hoppername | string | The name of the hopper. |

<a id="ID4EJB"></a>


## Authorization

| Type| Required| Description| Response if missing|
| --- | --- | --- | --- | --- | --- | --- | --- |
| Privileges and Device Type| yes| When the user's deviceType is set to console, only users with the multiplayer privilege in their claims are allowed to make calls to the matchmaking service. | 403|
| Device Type| yes| When the user's deviceType is absent or set to non-console, the title being matched into must not be a console-only title. | 403|
| Title ID/Proof of Purchase/Device Type| yes| The title that is being matched into must allow matchmaking for the specified title claim, device type combination. | 403|

<a id="ID4E3C"></a>


## HTTP status codes
The service returns an HTTP status code as it applies to MPSD.  
<a id="ID4EFD"></a>


## Request body

<a id="ID4ELD"></a>


### Required members

| Member| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| serviceConfig| GUID| SCID for the session.|
| hopperName| string| Name of the hopper.|
| giveUpDuration| 32-bit signed integer| Maximum wait time (integral number of seconds).|
| preserveSession| enumeration| A value indicating if the session is reused as the session into which to match. Possible values are "always" and "never". |
| ticketSessionRef| MultiplayerSessionReference| The MultiplayerSessionReference object for the session in which the player or group is currently playing. |
| ticketAttributes| collection of objects| Attributes and values provided by the user about the group of players.|

<a id="ID4EXF"></a>


### Prohibited members

All other members are prohibited in a request.

<a id="ID4ECG"></a>


### Sample request

The session referred to by the **ticketSessionRef** object must be created before a match ticket can be created, and the session must contain the players to be matched, along with their player-specific attributes. Each player must create or join the session against the MPSD, adding associated match attributes to the session. The match attributes are placed in a custom property field called matchAttrs on each player.

A create or join request is submitted to **https://sessiondirectory.xboxlive.com/serviceconfigs/{scid}/sessiontemplates/{templatename}/sessions/{sessionname}** and might look like this:


```cpp
{
   "members": {
     "me": {
       "constants": {
         "system": {
           "xuid": 2535285330879750
         }
      },
      "properties": {
         "custom": {
           "matchAttrs": {
             "skill": 5,
             "ageRange": "teenager"
           }
         }
      }
    }
  }
}

```


Once the session has been created, the title can call the matchmaking service to create the ticket for that session.


> **Note:**   
> A title can enable a user to retry this call, but should not retry it automatically if the data fails.  



```cpp
POST /serviceconfigs/{scid}/hoppers/{hoppername}

{
  "giveUpDuration":10,
  "preserveSession": "never",
  "ticketSessionRef": {
     "scid": "ABBACDDC-0000-0000-0000-000000000001",  
     "templateName": "TestTemplate",
     "name": "5E55104-0000-0000-0000-000000000001"
  },
  "ticketAttributes": {
    "desiredMap": "Test Map",
    "desiredGameType": "Test GameType"
  }
}

```


<a id="ID4E3G"></a>


## Response body

| Member| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| ticketId| GUID| The ID for the ticket being created.|
| waitTime| 32-bit signed integer| The average wait time for the hopper (integral number of seconds).|


```cpp
{
  "ticketId":"0584338f-a2ff-4eb9-b167-c0e8ddecae72",
  "waitTime":60
}

```


<a id="ID4EHAAC"></a>


## See also

<a id="ID4EJAAC"></a>


##### Parent  

[/serviceconfigs/{scid}/hoppers/{hoppername}](uri-serviceconfigsscidhoppershoppername.md)