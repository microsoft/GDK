---
title: GET (/scids/{scid}/leaderboards/{leaderboardname})
description: " GET (/scids/{scid}/leaderboards/{leaderboardname})"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/scids/{scid}/leaderboards/{leaderboardname})
 
Gets a predefined global leaderboard.
 
The domain for these URIs is `leaderboards.xboxlive.com`.
 
  * [Remarks](#ID4EY)
  * [URI parameters](#ID4EDB)
  * [Query string parameters](#ID4EOB)
  * [Authorization](#ID4EID)
  * [Effect of privacy settings on resource](#ID4EDE)
  * [Required Request Headers](#ID4EME)
  * [Optional Request Headers](#ID4E1F)
  * [HTTP status codes](#ID4E1G)
  * [Response headers](#ID4ERCAC)
  * [Response body](#ID4EOEAC)
 
<a id="ID4EY"></a>

 
## Remarks
 
Leaderboard APIs are all read-only and therefore only support the GET verb. They reflect ranked and sorted "pages" of indexed player stats that are derived from individual user stats that were written via the Player Data system. Full leaderboard indexes can be quite large, and callers will never ask to see one in its entirety, therefore this URI supports several query string arguments that allow a caller to be specific about what kind of view it wants to see against that leaderboard.
 
GET operations won't modify any resources so this will produce the same results if executed once or multiple times.
  
<a id="ID4EDB"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| scid| GUID| Identifier of the service configuration which contains the resource being accessed.| 
| leaderboardname| string| Unique identifier of the predefined leaderboard resource being accessed.| 
  
<a id="ID4EOB"></a>

 
## Query string parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | --- | --- | --- | 
| maxItems| 32-bit unsigned integer| Maximum number of leaderboard records to return in a page of results. If not specified, a default number will be returned (10). The max value for maxItems is still undefined, but we want to avoid large data sets, so this value should probably target the largest set that a tuner UI could handle per call.| 
| skipToRank| 32-bit unsigned integer| Return a page of results starting with the specified leaderboard rank. The rest of the results will be in sort order by rank. This query string can return a continuation token which can be fed back into a subsequent query to get "the next page" of results.| 
| skipToUser| string| Return a page of leaderboard results around the specified gamer xuid, regardless of that user's rank or score. The page will be ordered by percentile rank with the specified user in the last position of the page for predefined views, or in the middle for stat leaderboard views. There is no continuationToken provided for this type of query.| 
| continuationToken| string| If a previous call returned a continuationToken, then the caller can pass back that token "as is" in a query string to get the next page of results.| 
  
<a id="ID4EID"></a>

 
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

  
<a id="ID4EDE"></a>

 
## Effect of privacy settings on resource
 
No privacy checks are performed when reading leaderboard data.
  
<a id="ID4EME"></a>

 
## Required Request Headers
 
| Header| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | 
| Authorization| String. Authentication credentials for HTTP authentication. Example value: <b>XBL3.0 x=&lt;userhash>;&lt;token></b>| 
| X-RequestedServiceVersion| String. Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, etc. Default value: 1.| 
| Accept| String. Content-Types that are acceptable. Example value: <b>application/json</b>| 
  
<a id="ID4E1F"></a>

 
## Optional Request Headers
 
| Header| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| If-None-Match| String. Entity tag, used if client supports caching. Example value: <b>"686897696a7c876b7e"</b>|  | 
  
<a id="ID4E1G"></a>

 
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
  
<a id="ID4ERCAC"></a>

 
## Response headers
 
| Header| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| Content-Type| string| Required. The MIME type of the body of the response. Example: <b>application/json</b>.| 
| Content-Length| string| Required. The number of bytes being sent in the response. Example: <b>232</b>.| 
| ETag| string| Optional. Used for cache optimization. Example: <b>686897696a7c876b7e</b>.| 
  
<a id="ID4EOEAC"></a>

 
## Response body
 
<a id="ID4EUEAC"></a>

 
### Response Members
 
pagingInfo | pagingInfo| section| Optional. Only present when maxItems is specified in the request.| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| continuationToken| 64-bit unsigned integer| Required. Specifies what value to feed back into the <b>skipItems</b> query parameter to get the next page of results for that URI if desired. If no <b>pagingInfo</b> is returned then there is no next page of data to be obtained.| 
| totalCount| 64-bit unsigned integer| Required. Total number of entries in the leaderboard. Example value: 1234567890| 
 
leaderboardInfo | leaderboardInfo| section| Required. Always returned. Contains the metadata about the leaderboard requested.| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| displayName| string| Not used.| 
| totalCount| string (64-bit unsigned integer)| Required. Total number of entries in the leaderboard. Example value: 1234567890| 
| columns| array| Required. Columns in the leaderboard.| 
| displayName| string| Required. Corresponds to a column in the leaderboard.| 
| statName| string| Required. Corresponds to a column in the leaderboard.| 
| type| string| Required. Corresponds to a column in the leaderboard.| 
 
userList | userList| section| Required. Always returned. Contains the actual user scores for the leaderboard requested.| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| gamertag| string| Required. Corresponds to the user in the leaderboard entry.| 
| xuid| 64-bit unsigned integer| Required. Corresponds to the user in the leaderboard entry.| 
| percentile| string| Required. Corresponds to the user in the leaderboard entry.| 
| rank| string| Required. Corresponds to the user in the leaderboard entry.| 
| values| array| Required. Each comma-separated value corresponds to a column in the leaderboard.| 
  
<a id="ID4EGKAC"></a>

 
### Sample response
 
The following request URI depicts skipping to rank on a global leaderboard.
 

```cpp
https://leaderboards.xboxlive.com/scids/0FA0D955-56CF-49DE-8668-05D82E6D45C4/leaderboards/TotalFlagsCaptured/columns/deaths?maxItems=3&skipToRank=15000
         
```

 
The URI above returns the following JSON response.
 

```cpp
{
    "pagingInfo": {
        "continuationToken": "152",
        "totalItems": 23437
    },
    "leaderboardInfo": {
        "displayName": "Total flags captured",
        "totalCount": 23437,
        "columns": [
            {
                "displayName": "Flags Captured",
                "statName": "flagscaptured",
                "type": "Integer"
            },
            {
                "displayName": "Deaths",
                "statName": "deaths",
                "type": "Integer"
            }
        ]
    },
    "userList": [
        {
            "gamertag": "WarriorSaint",
            "xuid": 1234567890123444,
            "percentile": 0.64,
            "rank": 15000,
            "values": [
                1000,
                47
            ]
        },
        {
            "gamertag": "xxxSniper39",
            "xuid": 1234567890123555,
            "percentile": 0.64,
            "rank": 15001,
            "values": [
                998,
                17
            ]
        },
        {
            "gamertag": "WhockaWhocka",
            "xuid": 1234567890123666,
            "percentile": 0.64,
            "rank": 15002,
            "values": [
                996,
                2
            ]
        }
    ]
}
         
```

 
The following request URI depicts skipping to the user on a global leaderboard.
 

```cpp
https://leaderboards.xboxlive.com/scids/0FA0D955-56CF-49DE-8668-05D82E6D45C4/leaderboards/totalflagscaptured?maxItems=3&skipToUser=2343737892734237
         
```

 
The URI above returns the following JSON response.
 

```cpp
{
    "leaderboardInfo": 
    {	
       "displayName": "Total flags captured",
       "totalCount": 23437,
       "columns": [
              {
                  "displayName": "Flags Captured",
                  "statName": "flagscaptured",
                  "type": "Integer"
              }
       ]
    },
    "userList": [
        {
            "gamertag": "AverageJoe",
            "percentile": 55.00,
            "rank": 11718,
            "value": 1219,
            "xuid": 1234567890123444
        },
        {
            "gamertag": "AreUWatchinMe",
            "percentile": 60.00,
            "rank": 14162,
            "value": 1062,
            "xuid": 2343737892734333
        },
         {
            "gamertag": "WarriorSaint",
            "percentile": 64.39,
            "rank": 15000,
            "value ": 1000,
            "xuid": 1234567890123455
        }
    ]
}
         
```

   
<a id="ID4E5KAC"></a>

 
## See also
 
<a id="ID4EALAC"></a>

 
##### Parent 

[/scids/{scid}/leaderboards/{leaderboardname}](uri-scidsscidleaderboardsleaderboardname.md)

   