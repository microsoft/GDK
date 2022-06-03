---
title: GET (/media/{marketplaceId}/metadata/mediaItemTypes/{mediaitemtype}/queryrefiners)
description: " GET (/media/{marketplaceId}/metadata/mediaItemTypes/{mediaitemtype}/queryrefiners)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/media/{marketplaceId}/metadata/mediaItemTypes/{mediaitemtype}/queryrefiners)
Lists the query refiners for the given media item type. 
The domain for these URIs is `eds.xboxlive.com`.
 
  * [URI parameters](#ID4EV)
 
<a id="ID4EV"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| marketplaceId| string| Required. String value obtained from the <b>Windows.Xbox.ApplicationModel.Store.Configuration.MarketplaceId</b>.| 
| mediaitemtype| string| Required. One of the values from [GET (/media/{marketplaceId}/metadata/mediaGroups/{mediagroup}/mediaItemTypes)](uri-medialocalemetadatamediagroupsmediaitemtypesget.md).| 
  
<a id="ID4EAB"></a>

 
## See also
 
<a id="ID4ECB"></a>

 
##### Parent 

[/media/{marketplaceId}/metadata/mediaItemTypes/{mediaitemtype}/queryrefiners](uri-medialocalemetadatamediaitemtypequeryrefiners.md)

  
<a id="ID4EMB"></a>

 
##### Further Information 

[EDS Common Headers](../../additional/edscommonheaders.md)

 [EDS Parameters](../../additional/edsparameters.md)

 [EDS Query Refiners](../../additional/edsqueryrefiners.md)

 [Marketplace URIs](atoc-reference-marketplace.md)

 [Additional Reference](../../additional/atoc-xboxlivews-reference-additional.md)

   