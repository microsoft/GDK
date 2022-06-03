---
title: GET (/media/{marketplaceId}/crossMediaGroupSearch)
description: " GET (/media/{marketplaceId}/crossMediaGroupSearch)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/media/{marketplaceId}/crossMediaGroupSearch)
Gets items from several different media groups. 
The domain for these URIs is `eds.xboxlive.com`.
 
  * [Remarks](#ID4EV)
  * [URI parameters](#ID4EEB)
  * [Query string parameters](#ID4EPB)
  * [Response body](#ID4ETC)
 
<a id="ID4EV"></a>

 
## Remarks
 
The cross-group API allows clients to search for items from several different media groups. This API requires the use of a forward-only continuation token for paging through results. This API accepts Query Refiners.
 
**SandboxId** is now retrieved from the claim in the XToken and enforced. If the **SandboxId** is not present, then Entertainment Discovery Services (EDS) will throw a 400 Bad request error.
  
<a id="ID4EEB"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| marketplaceId| string| Required. String value obtained from the <b>Windows.Xbox.ApplicationModel.Store.Configuration.MarketplaceId</b>.| 
  
<a id="ID4EPB"></a>

 
## Query string parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | --- | --- | --- | 
| continuationToken| string| Optional. See the ContinuationToken parameter.| 
| q| string| Required. Query term used in search.| 
  
<a id="ID4ETC"></a>

 
## Response body
 
<a id="ID4EZC"></a>

 
### Sample response
 
The JSON code below is in response to the call `/media/en-us/crossMediaGroupSearch?q=vector&maxItems=25&fields=all`.
 

```cpp
{
    "Items": [{
        "MediaGroup": "GameType",
        "MediaItemType": "DGame",
        "ID": "fd16e2fb-eca4-4182-8f69-a98fdd6e57a1",
        "Name": "Vector based massively multiplayer Tanks game.",
        "ReducedName": "Tanks",
        "ReleaseDate": "2013-03-15T00: 00: 00Z",
        "TitleId": "69A60C76",
        "VuiDisplayName": "Tanks",
        "DeveloperName": "Microsoft Studios",
        "Images": [{
            "ID": "32ebd9fe-6a22-4111-954e-564ec69d802a",
            "ResizeUrl": "http: //images-eds.dnet.xboxlive.com/image?url=RIJNAEIo6.u.tudW9rXJ2lWDOsMikqfNiHE2Sp4qbgNbH6_drY8Ek2cyHXEnnUKPUXAH_m8a3Oe4_wpV7CkKA0Snc9puIYOGxsIfyyncTBv.MIluDZX6UqAPsJYHE5go_J_BBfxNWW6yrK4.K75aMQ--",
            "Purposes": ["Box_Art"],
            "Purpose": "Box_Art",
            "Height": 300,
            "Width": 219,
            "Order": 1
        },
        {
            "ID": "32ebd9fe-6a22-4111-954e-564ec69d802a",
            "ResizeUrl": "http: //images-eds.dnet.xboxlive.com/image?url=RIJNAEIo6.u.tudW9rXJ2lWDOsMikqfNiHE2Sp4qbgNbH6_drY8Ek2cyHXEnnUKPUXAH_m8a3Oe4_wpV7CkKA0Snc9puIYOGxsIfyyncTBv.MIluDZX6UqAPsJYHE5go_J_BBfxNWW6yrK4.K75aMQ--",
            "Purposes": ["Box_Art"],
            "Purpose": "Box_Art",
            "Height": 120,
            "Width": 85,
            "Order": 1
        },
        {
            "ID": "32ebd9fe-6a22-4111-954e-564ec69d802a",
            "ResizeUrl": "http: //images-eds.dnet.xboxlive.com/image?url=RIJNAEIo6.u.tudW9rXJ2lWDOsMikqfNiHE2Sp4qbgNbH6_drY8Ek2cyHXEnnUKPUXAH_m8a3Oe4_wpV7CkKA0Snc9puIYOGxsIfyyncTBv.MIluDZX6UqAPsJYHE5go_J_BBfxNWW6yrK4.K75aMQ--",
            "Purposes": ["Image"],
            "Purpose": "Image",
            "Height": 720,
            "Width": 1280,
            "Order": 1
        }],
        "PublisherName": "Microsoft Studios",
        "RatingId": "10",
        "ParentalRating": "E",
        "ParentalRatingSystem": "ESRB",
        "SortName": "\n            Vector based massively multiplayer Tanks game.\n          ",
        "Capabilities": [{
            "NonLocalizedName": "onlineMultiplayerMin",
            "Value": "3"
        },
        {
            "NonLocalizedName": "onelineMultiplayerMax",
            "Value": "5"
        }],
        "KValue": "30",
        "KValueNamespace": "bingbox",
        "AllTimePlayCount": 30.0,
        "SevenDaysPlayCount": 30.0,
        "ThirtyDaysPlayCount": 30.0,
        "AllTimeRatingCount": 12.0,
        "ThirtyDaysRatingCount": 12.0,
        "SevenDaysRatingCount": 12.0,
        "AllTimeAverageRating": 0.8,
        "ThirtyDaysAverageRating": 0.8,
        "SevenDaysAverageRating": 0.8,
        "LegacyIds": [{
            "IdType": "TitleId",
            "Value": "69A60C76"
        }],
        "Availabilities": [{
            "AvailabilityID": "",
            "ContentId": "7AE9DAB2-1162-488D-9F80-B804EC5AF879",
            "Devices": [{
                "Name": "Durango"
            }]
        }],
        "Packages": [{
            "CdnFileLocation": [{
                "SortOrder": null,
                "Uri": "https: //update.dnet.xboxlive.com/test_cdn/tanks-randomkey.xvc"
            },
            {
                "SortOrder": null,
                "Uri": "https: //update.dnet.xboxlive.com/test_cdn/tanks-randomkey.xvc"
            },
            {
                "SortOrder": null,
                "Uri": "https: //update.dnet.xboxlive.com/test_cdn/tanks-randomkey.xvc"
            }],
            "ContentId": "7AE9DAB2-1162-488D-9F80-B804EC5AF879",
            "PackageType": "XVC",
            "LicenseType": "Xbox Live Games Machine and User"
        }],
        "SandboxId": "PART.Dev1"
    },
    {
        "MediaGroup": "MusicArtistType",
        "MediaItemType": "MusicArtist",
        "ID": "61cdf888-7b2b-5111-82f4-87e9c7a86504",
        "Name": "Vector",
        "Genres": [{
            "Name": "Hip Hop"
        }],
        "SortName": "Vector [2]",
        "KValue": "28",
        "KValueNamespace": "bingbox",
        "AmgId": "P   362877",
        "ZuneId": "89C90600-0200-11DB-89CA-0019B92A3933",
        "SubGenres": [{
            "Name": "Contemporary Hip Hop"
        }],
        "AllTimePlayCount": 995.0,
        "SevenDaysPlayCount": 2.0,
        "ThirtyDaysPlayCount": 57.0,
        "LegacyAmgId": "7D890500-0600-11DB-89CA-0019B92A3933",
        "LegacyIds": [{
            "IdType": "AmgId",
            "Value": "P   362877"
        },
        {
            "IdType": "ZuneId",
            "Value": "89C90600-0200-11DB-89CA-0019B92A3933"
        },
        {
            "IdType": "LegacyAmgId",
            "Value": "7D890500-0600-11DB-89CA-0019B92A3933"
        },
        {
            "IdType": "ArtistId",
            "Value": "444809"
        }]
    }],
    "ContinuationToken": "1-----1",
    "ImpressionGuid": "9e41e6e4-1b2e-4710-abe4-b01ffbaa7605"
}
         
```

   
<a id="ID4EID"></a>

 
## See also
 
<a id="ID4EKD"></a>

 
##### Parent 

[/media/{marketplaceId}/crossMediaGroupSearch](uri-localecrossmediagroupsearch.md)

  
<a id="ID4EUD"></a>

 
##### Further Information 

[EDS Common Headers](../../additional/edscommonheaders.md)

 [EDS Parameters](../../additional/edsparameters.md)

 [EDS Query Refiners](../../additional/edsqueryrefiners.md)

 [Marketplace URIs](atoc-reference-marketplace.md)

 [Additional Reference](../../additional/atoc-xboxlivews-reference-additional.md)

   