---
title: GET (/media/{marketplaceId}/metadata/mediaItemTypes/{mediaitemtype}/queryrefiners/{queryRefiner}/subQueryRefinerValues)
description: " GET (/media/{marketplaceId}/metadata/mediaItemTypes/{mediaitemtype}/queryrefiners/{queryRefiner}/subQueryRefinerValues)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/media/{marketplaceId}/metadata/mediaItemTypes/{mediaitemtype}/queryrefiners/{queryRefiner}/subQueryRefinerValues)
Get the list of sub-values for a given query refiner value (e.g., "subgenres in a given genre"). 
The domain for these URIs is `eds.xboxlive.com`.
 
  * [Remarks](#ID4EV)
  * [URI parameters](#ID4EDB)
 
<a id="ID4EV"></a>

 
## Remarks
 
The query refiner value is passed in as a query string parameter named **queryRefinerValue**, which is done to allow query refiner values with characters forbidden in URI stems to be passed.
 
This API is only supported for Music.
  
<a id="ID4EDB"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| marketplaceId| string| Required. String value obtained from the <b>Windows.Xbox.ApplicationModel.Store.Configuration.MarketplaceId</b>.| 
  
<a id="ID4EOB"></a>

 
## See also
 
<a id="ID4EQB"></a>

 
##### Parent 

[/media/{marketplaceId}/metadata/mediaItemTypes/{mediaitemtype}/queryrefiners/{queryRefiner}/subQueryRefinerValues](uri-medialocalemediaitemtypequeryrefinersubqueryrefinervalues.md)

  
<a id="ID4E1B"></a>

 
##### Further Information 

[EDS Common Headers](../../additional/edscommonheaders.md)

 [EDS Parameters](../../additional/edsparameters.md)

 [EDS Query Refiners](../../additional/edsqueryrefiners.md)

 [Marketplace URIs](atoc-reference-marketplace.md)

 [Additional Reference](../../additional/atoc-xboxlivews-reference-additional.md)

   