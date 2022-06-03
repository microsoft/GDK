---
title: GET (/users/xuid({xuid})/scids/{scid}/stats)
description: " GET (/users/xuid({xuid})/scids/{scid}/stats)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/users/xuid({xuid})/scids/{scid}/stats)
Gets a service configuration scoped by a comma-delimited list of user statistic names on behalf of the specified user.
The domain for these URIs is `userstats.xboxlive.com`.

  * [Remarks](#ID4EV)
  * [URI parameters](#ID4EEB)
  * [Query string parameters](#ID4EPB)
  * [Authorization](#ID4EUC)
  * [Required Request Headers](#ID4EPD)
  * [Optional Request Headers](#ID4EYE)
  * [Request body](#ID4E3F)
  * [HTTP status codes](#ID4EHG)
  * [Response body](#ID4E5BAC)

<a id="ID4EV"></a>


## Remarks

clients need a way to read and write title statistics on behalf of players to our new player statistics system.

<a id="ID4EEB"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- |
| xuid| GUID| Xbox User ID (XUID) of the user on whose behalf to access the service configuration.|
| scid| GUID| Identifier of the service configuration that contains the resource being accessed.|

<a id="ID4EPB"></a>

 
## Query string parameters

| Parameter| Type| Description|
| --- | --- | --- | --- | --- | --- |
| statNames| string| The only query string parameter is the comma delimited user statistic name URI noun.For example, the following URI informs the service that four statistics are requested on behalf of the user id specified in the URI. `https://userstats.xboxlive.com/users/xuid({xuid})/scids/{scid}/stats/wins,kills,kdratio,headshots`There will be a limit on the number of statistics that can be requested in a single call, and that limit will carefully consider a "sweet spot" for developer convenience vs. URI length practicality. For example, the limit might be determined by either 600 characters worth of statistic name text (including the commas), or 10 statistics maximum. Enabling a simple GET like this enables HTTP caching for commonly requested statistics, which reduces call volume from chatty clients. |

<a id="ID4EUC"></a>


## Authorization

There is authorization logic implemented for content-isolation and access-control scenarios.

   * Both leaderboards and user statistics can be read from clients on any platform, provided that the caller submits a valid XSTS token with the request. Writes are obviously limited to clients supported by the Player Data system.
   * Title developers can mark statistics as open or restricted with Partner Center. Leaderboards are open statistics. Open statistics can be accessed by Smartglass, as well as iOS, Android, Windows, Windows Phone, and web applications, as long as the user is authorized to the sandbox. User authorization to a sandbox is managed through Partner Center.

Pseudo-code for the check looks like this:


```cpp
If (!checkAccess(serviceConfigId, resource, CLAIM[userid, deviceid, titleid]))
{
        Reject request as Unauthorized
}

// else accept request.

```


<a id="ID4EPD"></a>


## Required Request Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Authorization| string| Authentication credentials for HTTP authentication. Example value: "XBL3.0 x=&lt;userhash>;&lt;token>".|

<a id="ID4EYE"></a>


## Optional Request Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| X-RequestedServiceVersion|  | Build name/number of the service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the authentication token, and so on. Default value: 1.|

<a id="ID4E3F"></a>


## Request body

No objects are sent in the body of this request.

<a id="ID4EHG"></a>


## HTTP status codes

The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).

| Code| Reason phrase| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 200| OK| The session was successfully retrieved.|
| 304| Not Modified| Resource not been modified since last requested.|
| 400| Bad Request| Service could not understand malformed request. Typically an invalid parameter.|
| 401| Unauthorized| The request requires user authentication.|
| 403| Forbidden| The request is not allowed for the user or service.|
| 404| Not Found| The specified resource could not be found.|
| 406| Not Acceptable| Resource version is not supported.|
| 408| Request Timeout| Resource version is not supported; should be rejected by the MVC layer.|

<a id="ID4E5BAC"></a>


## Response body

<a id="ID4EECAC"></a>


### Sample response


```cpp
{
    "user": {
 	"xuid": "123456789",
        "gamertag": "WarriorSaint",
        "stats": [
            {
                "statname": "Wins",
                "type": "Integer",
                "value": 40
            },
            {
                "statname": "Kills",
                "type": "Integer",
                "value": 700
            },
            {
                "statname": "KDRatio",
                "type": "Double",
                "value": 2.23
            },
            {
                "statname": "Headshots",
                "type": "Integer",
                "value": 173
            }
        ],
    }
}

```


<a id="ID4EOCAC"></a>


## See also

<a id="ID4EQCAC"></a>


##### Parent

[/users/xuid({xuid})/scids/{scid}/stats](uri-usersxuidscidsscidstats.md)