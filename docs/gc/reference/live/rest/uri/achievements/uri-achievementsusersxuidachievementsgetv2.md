---
title: GET (/users/xuid({xuid})/achievements)
description: " GET (/users/xuid({xuid})/achievements)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/users/xuid({xuid})/achievements)
Gets the list of achievements defined on the title, those unlocked by the user, or those the user has in progress. 
The domain for these URIs is `achievements.xboxlive.com`.
 
  * [URI parameters](#ID4EX)
  * [Query string parameters](#ID4ECB)
  * [Authorization](#ID4ENF)
  * [Required Request Headers](#ID4ESG)
  * [Optional Request Headers](#ID4ESH)
  * [Request body](#ID4EIBAC)
  * [Response body](#ID4ETBAC)
 
<a id="ID4EX"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| xuid| 64-bit unsigned integer| Xbox User ID (XUID) of the user whose (resource) is being accessed. Must match the XUID of the authenticated user.| 
  
<a id="ID4ECB"></a>

 
## Query string parameters
 
| Parameter| Required| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | 
| <b>skipItems</b>| No| 32-bit signed integer| Return items beginning after the given number of items. For example, <b>skipItems="3"</b> will retrieve items beginning with the fourth item retrieved. | 
| <b>continuationToken</b>| No| string| Return the items starting at the given continuation token. | 
| <b>maxItems</b>| No| 32-bit signed integer| Maximum number of items to return from the collection, which can be combined with <b>skipItems</b> and <b>continuationToken</b> to return a range of items. The service may provide a default value if <b>maxItems</b> is not present, and may return fewer than <b>maxItems</b>, even if the last page of results has not yet been returned. | 
| <b>titleId</b>| No| string| A filter for the returned results. Accepts one or more comma-delimited, decimal title identifiers.| 
| <b>unlockedOnly</b>| No| Boolean value| Filter for the returned results. If set to <b>true</b>, will only return the achievements unlocked for the user. Defaults to <b>false</b>.| 
| <b>possibleOnly</b>| No| Boolean value| Filter for the returned results. If set to <b>true</b>, will return all possible results but not unlocked metadata - just the achievement information from XMS. Defaults to <b>false</b>.| 
| <b>types</b>| No| string| A filter for the returned results. Can be "Persistent" or "Challenge". Default is all supported types.| 
| <b>orderBy</b>| No| string| Specifies the order in which to return the results. Can be "Unordered", "Title", "UnlockTime", or "EndingSoon". The default is "Unordered".| 
  
<a id="ID4ENF"></a>

 
## Authorization
 
| Claim| Required?| Description| Behavior if missing| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| User| Caller is an authorized Xbox LIVE user.| The caller needs to be a valid user on Xbox LIVE.| 403 Forbidden| 
  
<a id="ID4ESG"></a>

 
## Required Request Headers
 
| Header| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| Authorization| string| Authentication credentials for HTTP authentication. Example value: "XBL3.0 x=&lt;userhash>;&lt;token>".| 
  
<a id="ID4ESH"></a>

 
## Optional Request Headers
 
| Header| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| <b>X-RequestedServiceVersion</b>| string| Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, etc. Default value: 1.| 
| <b>x-xbl-contract-version</b>| 32-bit unsigned integer| If present and set to 2, the V2 version of this API will be used. Otherwise, V1.| 
| <b>Accept-Language</b>| string| List of desired locales and fallbacks (e.g., fr-FR, fr, en-GB, en-WW, en-US). The Achievements service will work through the list until it finds matching localized strings. If none are found, it attempts to match the location defined in the user token, which comes from the user's IP address. If still no matching localized strings are found, it uses the default strings provided by the title developer/publisher. | 
  
<a id="ID4EIBAC"></a>

 
## Request body
 
No objects are sent in the body of this request.
  
<a id="ID4ETBAC"></a>

 
## Response body
 
If the call is successful, the service returns an array of [Achievement (JSON)](../../json/json-achievementv2.md) objects and a [PagingInfo (JSON)](../../json/json-paginginfo.md) object.
 
<a id="ID4ECCAC"></a>

 
### Sample response
 

```cpp
{
    "achievements":
    [{
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
                "achievementState":"Achieved",
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
        }],
        "pagingInfo":
        {
                "continuationToken":null,
                "totalRecords":1
        }
}
         
```

   
<a id="ID4EPCAC"></a>

 
## See also
 
<a id="ID4ERCAC"></a>

 
##### Parent 

[/users/xuid({xuid})/achievements](uri-achievementsusersxuidachievementsv2.md)

  
<a id="ID4E2CAC"></a>

 
##### Reference 

[Achievement (JSON)](../../json/json-achievementv2.md)

 [PagingInfo (JSON)](../../json/json-paginginfo.md)

 [Paging Parameters](../../additional/pagingparameters.md)

   