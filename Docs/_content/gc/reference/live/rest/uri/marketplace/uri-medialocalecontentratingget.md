---
title: GET (/media/{marketplaceId}/contentRating)
description: " GET (/media/{marketplaceId}/contentRating)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/media/{marketplaceId}/contentRating)
Get the content rating token. 
The domain for these URIs is `eds.xboxlive.com`.
 
  * [Remarks](#ID4EV)
  * [URI parameters](#ID4ELB)
  * [Query string parameters](#ID4EWB)
 
<a id="ID4EV"></a>

 
## Remarks
 
Enforcing parental controls over the content children are allowed to see is a complicated task. Not only does each media item type have its own rating system, but those rating systems can vary from country/region to country/region. This means that there are several different pieces of data that need to be specified to properly filter all items.
 
Instead of specifying all of the parameters in all API calls, this API generates a value to pass into **combinedContentRating** parameters in other APIs and still communicate the same information. This is designed to make the APIs easier to use and maintain, as the several parameters passed into this API are collapsed into a single, reusable value for the other APIs.
 
Although the exact values returned by this API may eventually change, they should change very infrequently (such as between releases of Entertainment Discovery Services (EDS)) and thus could be cached for long periods of time. Any API accepting a **combinedContentRating** parameter will give a meaningful error message if the value passed in is invalid, which is an indication the caller merely needs to call this API again to get an updated value. If an API accepts a **combinedContentRating** parameter, but one isn't provided, no filtering of content will take place based on parental controls. 

> **Note:**   
> This doesn't mean that only "safe" content is returned -- it means that all content is returned, including potentially explicit content. 


  
<a id="ID4ELB"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | --- | 
| marketplaceId| string| Required. String value obtained from the <b>Windows.Xbox.ApplicationModel.Store.Configuration.MarketplaceId</b>.| 
  
<a id="ID4EWB"></a>

 
## Query string parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | 
| filterExplicit| Boolean value| Optional. Filters explicit music.| 
| filterFamilyOnlyApps| Boolean value| Optional. Filter apps not marked as family friendly.| 
| filterUnrated| Boolean value| Optional. Determines whether content that is unrated should be included in the response or not.| 
| maxGameRating| 32-bit signed integer| Optional. Filters games.| 
| maxMovieRating| 32-bit signed integer| Optional. Filters movies above a specific level.| 
| maxTVRating| 32-bit signed integer| Optional. Filters TV.| 
  
<a id="ID4E5D"></a>

 
## See also
 
<a id="ID4EAE"></a>

 
##### Parent 

[/media/{marketplaceId}/contentRating](uri-medialocalecontentrating.md)

  
<a id="ID4EKE"></a>

 
##### Further Information 

[EDS Common Headers](../../additional/edscommonheaders.md)

 [EDS Parameters](../../additional/edsparameters.md)

 [EDS Query Refiners](../../additional/edsqueryrefiners.md)

 [Marketplace URIs](atoc-reference-marketplace.md)

 [Additional Reference](../../additional/atoc-xboxlivews-reference-additional.md)

   