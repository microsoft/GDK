---
title: GET (/scids/{scid}/leaderboards/{leaderboardname}?include=valuemetadata)
description: " GET (/scids/{scid}/leaderboards/{leaderboardname}?include=valuemetadata)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/scids/{scid}/leaderboards/{leaderboardname}?include=valuemetadata)
 
Gets a predefined global leaderboard along with any metadata associated with the leaderboard values.
 
The domain for these URIs is `leaderboards.xboxlive.com`.
 
  * [Remarks](#ID4EY)
  * [URI parameters](#ID4EHB)
  * [Query string parameters](#ID4ESB)
  * [Authorization](#ID4EVD)
  * [Effect of privacy settings on resource](#ID4EQE)
  * [Required Request Headers](#ID4EZE)
  * [Optional Request Headers](#ID4EOG)
  * [HTTP status codes](#ID4EOH)
  * [Response headers](#ID4EFDAC)
  * [Response body](#ID4ECFAC)
 
<a id="ID4EY"></a>

 
## Remarks
 
The ?include=valuemetadata query parameter allows the response to include any metadata associated with the leaderboard values. The value metadata contains client specified data associated with the value, such as the model and color of a car used to achieve a best time on a race track.
 
Value metadata is defined on the user stat that the leaderboard is based on, not on the leaderboard itself.
 
Leaderboard APIs are all read-only and therefore only support the GET verb. They reflect ranked and sorted "pages" of indexed player stats that are derived from individual user stats that were written via the Player Data system. Full leaderboard indexes can be quite large, and callers will never ask to see one in its entirety, therefore this URI supports several query string arguments that allow a caller to be specific about what kind of view it wants to see against that leaderboard.
 
GET operations won't modify any resources so this will produce the same results if executed once or multiple times.
  
<a id="ID4EHB"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| scid| GUID| Identifier of the service configuration which contains the resource being accessed.| 
| leaderboardname| string| Unique identifier of the predefined leaderboard resource being accessed.| 
  
<a id="ID4ESB"></a>

 
## Query string parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | --- | --- | --- | 
| include=valuemetadata| string| Indicates that the response includes any value metadata associated with the leaderboard values.| 
| maxItems| 32-bit unsigned integer| Maximum number of leaderboard records to return in a page of results. If not specified, a default number will be returned (10). The max value for maxItems is still undefined, but we want to avoid large data sets, so this value should probably target the largest set that a tuner UI could handle per call.| 
| skipToRank| 32-bit unsigned integer| Return a page of results starting with the specified leaderboard rank. The rest of the results will be in sort order by rank. This query string can return a continuation token which can be fed back into a subsequent query to get "the next page" of results.| 
| skipToUser| string| Return a page of leaderboard results around the specified gamer xuid, regardless of that user's rank or score. The page will be ordered by percentile rank with the specified user in the last position of the page for predefined views, or in the middle for stat leaderboard views. There is no continuationToken provided for this type of query.| 
| continuationToken| string| If a previous call returned a continuationToken, then the caller can pass back that token "as is" in a query string to get the next page of results.| 
  
<a id="ID4EVD"></a>

 
## Authorization
 
There is authorization logic implemented for content-isolation and access-control scenarios.
 
   * Both leaderboards and user stats can be read from clients on any platform, provided that the caller submits a valid XSTS token with the request. Writes are obviously limited to clients supported by the Player Data system.
   * Title developers can mark statistics as open or restricted with Partner Center. Leaderboards are open statistics. Open statistics can be accessed by Smartglass, as well as iOS, Android, Windows, Windows Phone, and web applications, as long as the user is authorized to the sandbox. User authorization to a sandbox is managed through Partner Center.
  
Pseudo-code for the check looks like this:
 

```cpp
If (!checkAccess(serviceConfigId, resource, CLAIM[userid, deviceid, titleid]))
{
        Reject request as Unauthorized
}

// else accept request.
         
```

  
<a id="ID4EQE"></a>

 
## Effect of privacy settings on resource
 
No privacy checks are performed when reading leaderboard data.
  
<a id="ID4EZE"></a>

 
## Required Request Headers
 
| Header| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | 
| Authorization| String. Authentication credentials for HTTP authentication. Example value: <b>XBL3.0 x=&lt;userhash>;&lt;token></b>| 
| X-Xbl-Contract-Version| String. Indicates which version of the API to use. This value must be set to "3" in order to include value metadata in the response.| 
| X-RequestedServiceVersion| String. Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, etc. Default value: 1.| 
| Accept| String. Content-Types that are acceptable. Example value: <b>application/json</b>| 
  
<a id="ID4EOG"></a>

 
## Optional Request Headers
 
| Header| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| If-None-Match| String. Entity tag, used if client supports caching. Example value: <b>"686897696a7c876b7e"</b>|  | 
  
<a id="ID4EOH"></a>

 
## HTTP status codes
 
The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).
 
| Code| Reason phrase| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| 200| OK| The session was successfully retrieved.| 
| 304| Not Modified| Resource not been modified since last requested.| 
| 400| Bad Request| Service could not understand malformed request. Typically an invalid parameter.| 
| 401| Unauthorized| The request requires user authentication.| 
| 403| Forbidden| The request is not allowed for the user or service.| 
| 404| Not Found| The specified resource could not be found.| 
| 406| Not Acceptable| Resource version is not supported.| 
| 408| Request Timeout| Resource version is not supported; should be rejected by the MVC layer.| 
  
<a id="ID4EFDAC"></a>

 
## Response headers
 
| Header| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| Content-Type| string| Required. The MIME type of the body of the response. Example: <b>application/json</b>.| 
| Content-Length| string| Required. The number of bytes being sent in the response. Example: <b>232</b>.| 
| ETag| string| Optional. Used for cache optimization. Example: <b>686897696a7c876b7e</b>.| 
  
<a id="ID4ECFAC"></a>

 
## Response body
 
<a id="ID4EIFAC"></a>

 
### Response Members
 
pagingInfo | pagingInfo| section| Optional. Only present when maxItems is specified in the request.| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| continuationToken| 64-bit unsigned integer| Required. Specifies what value to feed back into the <b>skipItems</b> query parameter to get the next page of results for that URI if desired. If no <b>pagingInfo</b> is returned then there is no next page of data to be obtained.| 
| totalItems| 64-bit unsigned integer| Required. Total number of entries in the leaderboard. Example value: 1234567890| 
 
leaderboardInfo | leaderboardInfo| section| Required. Always returned. Contains the metadata about the leaderboard requested.| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| displayName| string| Not used.| 
| totalCount| string (64-bit unsigned integer)| Required. Total number of entries in the leaderboard. Example value: 1234567890| 
| columnDefinition| JSON object| Required. Describes the column in the leaderboard.| 
| columnDefinition.displayName| string| Required. A descriptive name of the column in the leaderboard.| 
| columnDefinition.statName| string| Required. The name of the user stat that the leaderboard is based on.| 
| columnDefinition.type| string| Required. The data type of the user stat in the column.| 
 
userList | userList| section| Required. Always returned. Contains the actual user scores for the leaderboard requested.| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| gamertag| string| Required. The gamertag of the user in the leaderboard entry.| 
| xuid| 64-bit unsigned integer| Required. The Xbox user ID of the user in the leaderboard entry.| 
| percentile| string| Required. The user's percentile rank in the leaderboard.| 
| rank| string| Required. The user's numeric rank in the leaderboard.| 
| value| string| Required. The user's value of the stat on which the leaderboard is based.| 
| valueMetadata| string| Required. A string of comma separated string pairs, in the format "\"name\" : \"value\", ..."

If there is no metadata, this value is an empty string.| 
  
<a id="ID4EGLAC"></a>

 
### Sample response
 
The following request URI depicts skipping to rank on a global leaderboard.
 

```cpp
https://leaderboards.xboxlive.com/scids/0FA0D955-56CF-49DE-8668-05D82E6D45C4/leaderboards/TotalFlagsCaptured?include=valuemetadata&maxItems=3&skipToRank=15000
         
```

 
In order to return value metadata, the following header must also be specified.
 

```cpp
X-Xbl-Contract-Version : 3
          
```

 
The URI above returns the following JSON response.
 

```cpp
{
    "pagingInfo": {
        "continuationToken": "15003",
        "totalItems": 23437
    },
    "leaderboardInfo": {
        "displayName": "Total flags captured",
        "totalCount": 23437,
        "columnDefinition" : 
            {
                "displayName": "Flags Captured",
                "statName": "flagscaptured",
                "type": "Integer"
            }
    },
    "userList": [
        {
            "gamertag": "WarriorSaint",
            "xuid": "1234567890123444",
            "percentile": 0.64,
            "rank": 15000,
            "value": "1002",
            "valuemetadata" : "{\"color\" : \"silver\",\"weight\" : 2000, \"israining\" : false}"
        },
        {
            "gamertag": "xxxSniper39",
            "xuid": "1234567890123555",
            "percentile": 0.64,
            "rank": 15001,
            "value": "993",
            "valuemetadata" : "{\"color\" : \"silver\",\"weight\" : 2020, \"israining\" : true}"
 
        },
        {
            "gamertag": "WhockaWhocka",
            "xuid": "1234567890123666",
            "percentile": 0.64,
            "rank": 15002,
            "value": "700",
            "valuemetadata" : "{\"color\" : \"red\",\"weight\" : 300, \"israining\" : false}"
        }
    ]
}
         
```

   
<a id="ID4E6LAC"></a>

 
## See also
 
<a id="ID4EBMAC"></a>

 
##### Parent 

[/scids/{scid}/leaderboards/{leaderboardname}](uri-scidsscidleaderboardsleaderboardname.md)

   