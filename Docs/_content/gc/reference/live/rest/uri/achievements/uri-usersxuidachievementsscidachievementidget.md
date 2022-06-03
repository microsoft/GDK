---
title: GET (/users/xuid({xuid})/achievements/{scid}/{achievementid})
description: " GET (/users/xuid({xuid})/achievements/{scid}/{achievementid})"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/users/xuid({xuid})/achievements/{scid}/{achievementid})
Gets the details of the Achievement. 
The domain for these URIs is `achievements.xboxlive.com`.
 
  * [URI parameters](#ID4EV)
  * [Authorization](#ID4EAB)
  * [Effect of privacy settings on resource](#ID4E4C)
  * [Required Request Headers](#ID4EPG)
  * [Optional Request Headers](#ID4EPH)
  * [Request body](#ID4ECBAC)
  * [HTTP status codes](#ID4ENBAC)
  * [Response body](#ID4EBGAC)
 
<a id="ID4EV"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| xuid| 64-bit unsigned integer| Xbox User ID (XUID) of the user whose resource is being accessed. Must match the XUID of the authenticated user.| 
| scid| GUID| Unique identifier of the service configuration whose achievement is being accessed.| 
| achievementid| 32-bit unsigned integer| Unique (within the specified SCID) identifier of the achievement that is being accessed.| 
  
<a id="ID4EAB"></a>

 
## Authorization
 
Authorization claims used | Claim| Required?| Description| Behavior if missing| 
| --- | --- | --- | --- | --- | --- | --- | 
| User| Yes| A valid user on Xbox LIVE for whom the request is being made.| 403 Forbidden| 
| Title| No| The calling title.| Depends on AuthZ. As of May 1, 2013, AuthZ does not supply a claim when missing and will therefore deny access to any SCIDs not marked as public.| 
| Sandbox| No| The sandbox from which the results should be retrieved.| Depends on AuthZ. As of May 1, 2013, AuthZ does not supply a default claim when missing.| 
  
<a id="ID4E4C"></a>

 
## Effect of privacy settings on resource
 
Effect of Privacy Settings on Resource | Requesting User| Target User's Privacy Setting| Behavior| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| me| -| As described.| 
| friend| everyone| OK| 
| friend| friends only| OK| 
| friend| blocked| Forbidden.| 
| non-friend user| everyone| OK| 
| non-friend user| friends only| Forbidden.| 
| non-friend user| blocked| Forbidden.| 
| third-party site| everyone| OK| 
| third-party site| friends only| Forbidden.| 
| third-party site| blocked| Forbidden.| 
  
<a id="ID4EPG"></a>

 
## Required Request Headers
 
| Header| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| Authorization| string| Authentication credentials for HTTP authentication. Example value: "XBL3.0 x=&lt;userhash>;&lt;token>".| 
  
<a id="ID4EPH"></a>

 
## Optional Request Headers
 
| Header| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| X-RequestedServiceVersion| string| Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, and so on. Default value: 1.| 
| x-xbl-contract-version| string| Defaults to V1.| 
| Accept-Language| string| List of desired locales and fallbacks (e.g., fr-FR, fr, en-GB, en-WW, en-US). The Achievements service will work through the list until it finds matching localized strings. If none are found, it attempts to match the location defined in the user token, which comes from the user's IP address. If still no matching localized strings are found, it uses the default strings provided by the title developer/publisher. | 
  
<a id="ID4ECBAC"></a>

 
## Request body
 
No objects are sent in the body of this request.
  
<a id="ID4ENBAC"></a>

 
## HTTP status codes
 
The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).
 
| Code| Reason phrase| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| 200| OK| The session was successfully retrieved.| 
| 301| Moved Permanently| The service has moved to a different URI.| 
| 307| Temporary Redirect| The URI for this resource has temporarily changed.| 
| 400| Bad Request| Service could not understand malformed request. Typically an invalid parameter.| 
| 401| Unauthorized| The request requires user authentication.| 
| 403| Forbidden| The request is not allowed for the user or service.| 
| 404| Not Found| The specified resource could not be found.| 
| 406| Not Acceptable| Resource version is not supported; should be rejected by the MVC layer.| 
| 408| Request Timeout| The request took too long to complete.| 
| 410| Gone| The requested resource is no longer available.| 
  
<a id="ID4EBGAC"></a>

 
## Response body
 
<a id="ID4EHGAC"></a>

 
### Sample response
 

```cpp
{
    "achievement":
    {
        "id":"3",
        "serviceConfigId":"b5dd9daf-0000-0000-0000-000000000000",
        "name":"Default NameString for Microsoft Achievements Sample Achievement 3",
        "titleAssociations":
        [{
                "name":"Microsoft Achievements Sample",
                "id":3051199919,
                "version":"abc"
        }],
        "progressState":"Achieved",
        "progression":
        {
                "requirements":null,
                "timeUnlocked":"2013-01-17T03:19:00.3087016Z",
        },
        "mediaAssets":
        [{
                "name":"Icon Name",
                "type":"Icon",
                "url":"http://www.xbox.com"
        }],
        "platform":"D",
        "isSecret":true,
        "description":"Default DescriptionString for Microsoft Achievements Sample Achievement 3",
        "lockedDescription":"Default UnachievedString for Microsoft Achievements Sample Achievement 3",
        "productId":"12345678-1234-1234-1234-123456789012",
        "achievementType":"Challenge",
        "participationType":"Individual",
        "timeWindow":
        {
                "startDate":"2013-02-01T00:00:00Z",
                "endDate":"2100-07-01T00:00:00Z"
        },
        "rewards":
        [{
                "name":null,
                "description":null,
                "value":"10",
                "type":"Gamerscore",
                "valueType":"Int"
        },
        {
                "name":"Default Name for InAppReward for Microsoft Achievements Sample Achievement 3",
                "description":"Default Description for InAppReward for Microsoft Achievements Sample Achievement 3",
                "value":"1",
                "type":"InApp",
                "valueType":"String"
        }],
        "estimatedTime":"06:12:14",
        "deeplink":"aWFtYWRlZXBsaW5r",
        "isRevoked":false
    }
}
         
```

   
<a id="ID4ERGAC"></a>

 
## See also
 
<a id="ID4ETGAC"></a>

 
##### Parent 

[/users/xuid({xuid})/achievements/{scid}/{achievementid}](uri-usersxuidachievementsscidachievementid.md)

   