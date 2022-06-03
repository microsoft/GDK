---
title: POST (/batch)
description: " POST (/batch)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# POST (/batch)
POST method that functions as a GET method for complex batch requests for multiple player statistics across multiple titles. 
The domain for these URIs is `userstats.xboxlive.com`.
 
<a id="ID4ET"></a>

 
## Remarks
 
Title developers can mark statistics as open or restricted with Partner Center. Leaderboards are open statistics. Open statistics can be accessed by Smartglass, as well as iOS, Android, Windows, Windows Phone, and web applications, as long as the user is authorized to the sandbox. User authorization to a sandbox is managed through Partner Center.
  
  * [Remarks](#ID4ET)
  * [Description](#ID4EFB)
  * [Authorization](#ID4EUB)
  * [Required Request Headers](#ID4ETC)
  * [Optional Request Headers](#ID4E3D)
  * [Request body](#ID4EAF)
  * [HTTP status codes](#ID4EWF)
  * [Response body](#ID4ENBAC)
 
<a id="ID4EFB"></a>

 
## Description
 
The caller provides a message body with an array of users, service configuration IDs (SCIDs) and a list of statistic names per SCIDs for which to retrieve those statistics.
 
You may find it more useful to review the simple, single-statistic [GET](uri-usersxuidscidsscidstatsget.md) method before you read this more complex, batch-mode page.
  
<a id="ID4EUB"></a>

 
## Authorization
 
There is authorization logic implemented for content-isolation and access-control scenarios.
 
   * Both leaderboards and user statistics can be read from clients on any platform, provided that the caller submits a valid XSTS token with the request. Writes are obviously limited to clients supported by the .
   * Title developers can mark statistics as open or restricted with Partner Center. Leaderboards are open statistics. Open statistics can be accessed by Smartglass, as well as iOS, Android, Windows, Windows Phone, and web applications, as long as the user is authorized to the sandbox. User authorization to a sandbox is managed through Partner Center.
  
The following example is pseudo-code for the check:
 

```cpp
If (!checkAccess(serviceConfigId, resource, CLAIM[userid, deviceid, titleid]))
{
        Reject request as Unauthorized
}

// else accept request.
         
```

  
<a id="ID4ETC"></a>

 
## Required Request Headers
 
| Header| Type| Description| 
| --- | --- | --- | 
| Authorization| string| Authentication credentials for HTTP authentication. Example value: "XBL3.0 x=&lt;userhash>;&lt;token>".| 
  
<a id="ID4E3D"></a>

 
## Optional Request Headers
 
| Header| Type| Description| 
| --- | --- | --- | --- | --- | --- | 
| X-RequestedServiceVersion|  | Build name/number of the service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the authentication token, and so on. Default value: 1.| 
  
<a id="ID4EAF"></a>

 
## Request body
 
<a id="ID4EIF"></a>

 
### Sample request
 
the following POST body informs the service that four statistics are being requested from two different SCIDs for two different users.
 

```cpp
{    
"requestedusers": [
                1234567890123460,
                1234567890123234
            ],
            "requestedscids": [
                {
                    "scid": "c402ff50-3e76-11e2-a25f-0800200c1212",
                    "requestedstats": [
                        "Test4FirefightKills",
                        "Test4FirefightHeadshots"
                    ]
                },
                {
                    "scid": "c402ff50-3e76-11e2-a25f-0800200c0343",
                    "requestedstats": [
                        "OverallTestKills",
                        "TestHeadshots"
                    ]
                }
            ] 
}
      
```

   
<a id="ID4EWF"></a>

 
## HTTP status codes
 
The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).
 
| Code| Reason phrase| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| 200| OK| The session was successfully retrieved.| 
| 304| Not Modified| Resource not been modified since last requested.| 
| 400| Bad Request| Service could not understand malformed request. Typically an invalid parameter.| 
| 401| Unauthorized| The request requires user authentication.| 
| 403| Forbidden| The request is not allowed for the user or service.| 
| 404| Not Found| The specified resource could not be found.| 
| 406| Not Acceptable| Resource version is not supported.| 
| 408| Request Timeout| Resource version is not supported; should be rejected by the MVC layer.| 
  
<a id="ID4ENBAC"></a>

 
## Response body
 
<a id="ID4EXBAC"></a>

 
### Sample response
 

```cpp
{    
   "users":[          
       {    
	  "xuid": "123456789"
        "gamertag": "WarriorSaint",
        "scids":[
          {
             "scid":"c402ff50-3e76-11e2-a25f-0800200c1212",
             "stats":  [
		  {
		         "statname":"Test4FirefightKills",
		         "type":"Integer",
		         "value":7
             },
		  {
		         "statname":"Test4FirefightHeadshots",
		         "type":"Integer",
		         "value":4
             }]
                        },
          {
             "scid":"c402ff50-3e76-11e2-a25f-0800200c0343",
             "stats":  [
		  {
		         "statname":"OverallTestKills",
		         "type":"Integer",
		         "value":3434
             },
		  {
		         "statname":"TestHeadshots",
		         "type":"Integer",
		         "value":41
             }]
          }],
                   },
    {    
                   "gamertag":"TigerShark",
                   "xuid":1234567890123234
        "scids":[
          {
             "scid":"123456789",
             "stats":  [
		  {
		         "statname":"Test4FirefightKills",
		         "type":"Integer",
		         "value":63
             },
		  {
		         "statname":"Test4FirefightHeadshots",
		         "type":"Integer",
		         "value":12
             }]
                        },
          {
"scid":"987654321",
             "stats":  [
		  {
		         "statname":"OverallTestKills",
		         "type":"Integer",
		         "value":375
             },
		  {
		         "statname":"TestHeadshots",
		         "type":"Integer",
		         "value":34
             }]
          }],
                   }]
}
         
```

   
<a id="ID4EDCAC"></a>

 
## See also
 
<a id="ID4EFCAC"></a>

 
##### Parent 

[/batch](uri-batch.md)

   