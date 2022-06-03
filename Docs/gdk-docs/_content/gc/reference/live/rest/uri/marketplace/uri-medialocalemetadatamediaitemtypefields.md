---
title: "/media/{marketplaceId}/metadata/mediaItemTypes/{mediaItemType}/fields"
description: " /media/{marketplaceId}/metadata/mediaItemTypes/{mediaItemType}/fields"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /media/{marketplaceId}/metadata/mediaItemTypes/{mediaItemType}/fields
Accesses fields from which one can expect data, for a given mediaitemtype and a given version of EDS. 
The domain for these URIs is `eds.xboxlive.com`.
 
  * [URI parameters](#ID4EV)
 
<a id="ID4EV"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| marketplaceId| string| Required. String value obtained from the <b>Windows.Xbox.ApplicationModel.Store.Configuration.MarketplaceId</b>.| 
| mediaitemtype| string| Required. One of the values from [GET (/media/{marketplaceId}/metadata/mediaGroups/{mediagroup}/mediaItemTypes)](uri-medialocalemetadatamediagroupsmediaitemtypesget.md).| 
  
<a id="ID4EBC"></a>

 
## Valid methods

[GET (/media/{marketplaceId}/metadata/mediaItemTypes/{mediaItemType}/fields)](uri-medialocalemetadatamediaitemtypefieldsget.md)

&nbsp;&nbsp;Lists fields from which one can expect data, for a given mediaitemtype and a given version of EDS.
 
<a id="ID4ELC"></a>

 
## See also
 
<a id="ID4ENC"></a>

 
##### Parent 

[Marketplace URIs](atoc-reference-marketplace.md)

  
<a id="ID4EXC"></a>

 
##### Further Information 

[EDS Common Headers](../../additional/edscommonheaders.md)

 [EDS Parameters](../../additional/edsparameters.md)

 [EDS Query Refiners](../../additional/edsqueryrefiners.md)

 [Additional Reference](../../additional/atoc-xboxlivews-reference-additional.md)

   