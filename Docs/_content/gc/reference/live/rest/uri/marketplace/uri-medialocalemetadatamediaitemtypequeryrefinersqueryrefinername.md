---
title: "/media/{marketplaceId}/metadata/mediaItemTypes/{mediaitemtype}/queryrefiners/{queryrefinername}"
description: " /media/{marketplaceId}/metadata/mediaItemTypes/{mediaitemtype}/queryrefiners/{queryrefinername}"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /media/{marketplaceId}/metadata/mediaItemTypes/{mediaitemtype}/queryrefiners/{queryrefinername}
Accesses the acceptable values for the given query refiner name and given media item type. 
The domain for these URIs is `eds.xboxlive.com`.
 
  * [URI parameters](#ID4EV)
 
<a id="ID4EV"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| marketplaceId| string| Required. String value obtained from the <b>Windows.Xbox.ApplicationModel.Store.Configuration.MarketplaceId</b>.| 
| mediaitemtype| string| Required. One of the values from [GET (/media/{marketplaceId}/metadata/mediaGroups/{mediagroup}/mediaItemTypes)](uri-medialocalemetadatamediagroupsmediaitemtypesget.md).| 
| queryrefinername| string| Required. Name of the query refiner for which values are needed, such as "Genre" or "Decade". See QueryRefiners.| 
  
<a id="ID4EKC"></a>

 
## Valid methods

[GET (/media/{marketplaceId}/metadata/mediaItemTypes/{mediaitemtype}/queryrefiners/{queryrefinername})](uri-medialocalemetadatamediaitemtypequeryrefinersqueryrefinernameget.md)

&nbsp;&nbsp;Lists the acceptable values for the given query refiner name and given media item type.
 
<a id="ID4EUC"></a>

 
## See also
 
<a id="ID4EWC"></a>

 
##### Parent 

[Marketplace URIs](atoc-reference-marketplace.md)

  
<a id="ID4EAD"></a>

 
##### Further Information 

[EDS Common Headers](../../additional/edscommonheaders.md)

 [EDS Parameters](../../additional/edsparameters.md)

 [EDS Query Refiners](../../additional/edsqueryrefiners.md)

 [Additional Reference](../../additional/atoc-xboxlivews-reference-additional.md)

   