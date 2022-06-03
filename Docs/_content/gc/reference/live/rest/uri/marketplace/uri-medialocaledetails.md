---
title: "/media/{marketplaceId}/details"
description: " /media/{marketplaceId}/details"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /media/{marketplaceId}/details
Returns offer details and metadata about one or more items. 
The domain for these URIs is `eds.xboxlive.com`.
 
The details API differs from the Related API and the Browse API (when passin in an ID) as those APIs return information about other items that are associated with the fiven ID, either explicitly or implicitly, whereas the details API returns additional information about the same item.
 
Multiple IDs of different media item types can be passed into a single call (as long as they're not of type ProviderContentID - see below), but they all must belong to the same media group. However, there are a couple of client scenarios where the caller doesn't know the media group. The API supports this by allowing a sepcial value of "Unknown" for the media group in the following situations:
 
   * idType = XboxHexTitle, which will yield either AppType or GameType items
   * idType = ProviderContentId, which will yield MovieType or TVType items
  
The following chart summarizes the entire mapping of which ID types can be provided with which media groups:
 
| ID Type| AppType| GameType| MovieType| MusicArtistType| MusicType| TVType| WebVideoType| Unknown| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| Canonical| Y| Y| Y| Y| Y| Y| Y| N| 
| ZuneCatalog| N| N| Y| Y| Y| Y| N| N| 
| ZuneMediaInstance| N| N| Y| N| Y| Y| N| N| 
| Offer| Y| Y| Y| N| Y| Y| N| N| 
| AMG| N| N| N| N| Y| N| N| N| 
| MediaNet| N| N| N| N| Y| N| N| N| 
| XboxHexTitle| Y| Y| N| N| N| N| N| Y| 
| ProviderContentId| N| N| Y| N| N| Y| N| Y| 
 
  * [Parameter Notes](#ID4EEH)
  * [URI parameters](#ID4EUH)
 
<a id="ID4EEH"></a>

 
## Parameter Notes
 
<a id="ID4EIH"></a>

 
### ProviderContentId
 
This is used to lookup provider specific Id. E.g. Netflix Id or Hulu Id.
 
When idType is ProviderContentId, only a single value is accepted. This is because ProviderContentIds are the only type of ID that can contain the '.' character. Since the '.' character is also the separator that we use between IDs, there's ambiguity between what's a delimieter between IDs and what's part of the ID itself. The rest of the API works the same way for ProviderContentIds, except for the bulk lookup functionality.
   
<a id="ID4EUH"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| marketplaceId| string| Required. String value obtained from the <b>Windows.Xbox.ApplicationModel.Store.Configuration.MarketplaceId</b>.| 
  
<a id="ID4EWAAC"></a>

 
## Valid methods

[GET (/media/{marketplaceId}/details)](uri-medialocaledetailsget.md)

&nbsp;&nbsp;Returns offer details and metadata about one or more items. 
 
<a id="ID4EABAC"></a>

 
## See also
 
<a id="ID4ECBAC"></a>

 
##### Parent 

[Marketplace URIs](atoc-reference-marketplace.md)

  
<a id="ID4EMBAC"></a>

 
##### Further Information 

[EDS Common Headers](../../additional/edscommonheaders.md)

 [EDS Parameters](../../additional/edsparameters.md)

 [EDS Query Refiners](../../additional/edsqueryrefiners.md)

 [Additional Reference](../../additional/atoc-xboxlivews-reference-additional.md)

   