---
title: GET (/users/xuid({xuid})/scids/{scid}/stats?include=valuemetadata)
description: " GET (/users/xuid({xuid})/scids/{scid}/stats?include=valuemetadata)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/users/xuid({xuid})/scids/{scid}/stats?include=valuemetadata)
Gets a list of specified statistics, including metadata associated with the statistic values, for a user in a specified service configuration.
The domain for these URIs is `userstats.xboxlive.com`.

  * [Remarks](#ID4EV)
  * [URI parameters](#ID4EAB)
  * [Query string parameters](#ID4ELB)
  * [Authorization](#ID4EWC)
  * [Required Request Headers](#ID4ERD)
  * [Optional Request Headers](#ID4EDF)
  * [Request body](#ID4EHG)
  * [HTTP status codes](#ID4ESG)
  * [Response body](#ID4EJCAC)


<a id="ID4EV"></a>

## Remarks

The ?include=valuemetadata query parameter allows the response to include any metadata associated with the user stat values, such as the model and color of a car used to achieve a time on a race track.

To include value metadata in the response, the request call must also set the header value X-Xbl-Contract-Version to 3.


<a id="ID4EAB"></a>

## URI parameters

| Parameter| Type| Description|
| --- | --- | --- |
| xuid| GUID| Xbox User ID (XUID) of the user on whose behalf to access the service configuration.|
| scid| GUID| Identifier of the service configuration that contains the resource being accessed.|


<a id="ID4ELB"></a>

## Query string parameters

| Parameter| Type| Description|
| --- | --- | --- | --- | --- | --- |
| statNames| string| A comma delimited list of user statistic names.For example, the following URI informs the service that four statistics are requested on behalf of the user id specified in the URI.{::nomakrdown}<br/><br/>`https://userstats.xboxlive.com/users/xuid({xuid})/scids/{scid}/stats/wins,kills,kdratio,headshots?include=valuemetadata`| 
| include=valuemetadata| string| Indicates that the response includes any value metadata associated with the uset stat values.|


<a id="ID4EWC"></a>

## Authorization

There is authorization logic implemented for content-isolation and access-control scenarios.

   * Both leaderboards and user statistics can be read from clients on any platform, provided that the caller submits a valid XSTS token with the request. Writes are limited to clients supported by the Player Data system.
   * Title developers can mark statistics as open or restricted with Partner Center. Leaderboards are open statistics. Open statistics can be accessed by Smartglass, as well as iOS, Android, Windows, Windows Phone, and web applications, as long as the user is authorized to the sandbox. User authorization to a sandbox is managed through Partner Center.

Pseudo-code for the check looks like this:

```cpp
If (!checkAccess(serviceConfigId, resource, CLAIM[userid, deviceid, titleid]))
{
        Reject request as Unauthorized
}

// else accept request.

```


<a id="ID4ERD"></a>

## Required Request Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Authorization| string| Authentication credentials for HTTP authentication. Example value: "XBL3.0 x=&lt;userhash>;&lt;token>".|
| X-Xbl-Contract-Version| string| Indicates which version of the API to use. This value must be set to "3" in order to include value metadata in the response.|


<a id="ID4EDF"></a>

## Optional Request Headers

| Header| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| X-RequestedServiceVersion|  | Build name/number of the service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the authentication token, and so on. Default value: 1.|


<a id="ID4EHG"></a>

## Request body

No objects are sent in the body of this request.


<a id="ID4ESG"></a>

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


<a id="ID4EJCAC"></a>

## Response body


<a id="ID4EPCAC"></a>

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
        "value": 40,
        "valuemetadata" : "{\"region\" : \"EU\", \"isRanked\" : true}"
      },
      {
        "statname": "Kills",
        "type": "Integer",
        "value": 700,
        "valuemetadata" : "{\"longestKillStreak" : 15, \"favoriteTarget\" : \"CrazyPigeon\"}"
      },
      {
        "statname": "KDRatio",
        "type": "Double",
        "value": 2.23,
        "valuemetadata" : "{\"totalKills\" : 700, \"totalDeaths\" : 314}"
      },
      {
        "statname": "Headshots",
        "type": "Integer",
        "value": 173,
        "valuemetadata" : ""
      }
    ],
  }
}

```


<a id="ID4EZCAC"></a>

## See also


<a id="ID4E2CAC"></a>

##### Parent

[/users/xuid({xuid})/scids/{scid}/stats](uri-usersxuidscidsscidstats.md)