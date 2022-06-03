---
title: "/media/{marketplaceId}/singleMediaGroupSearch"
description: " /media/{marketplaceId}/singleMediaGroupSearch"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /media/{marketplaceId}/singleMediaGroupSearch
Allows search for items within a single media group. 
Note that pages of data returned from this search can be accessed non-sequentially using the skipItems parameter instead of using the continuation token. This API accepts Query Refiners.
 
The domain for these URIs is `eds.xboxlive.com`.
 
  * [URI parameters](#ID4EX)
 
<a id="ID4EX"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| marketplaceId| string| Required. String value obtained from the <b>Windows.Xbox.ApplicationModel.Store.Configuration.MarketplaceId</b>.| 
  
<a id="ID4EYB"></a>

 
## Valid methods

[GET (media/{marketplaceId}/singleMediaGroupSearch)](uri-medialocalesinglemediagroupsearchget.md)

&nbsp;&nbsp;Allows search for items within a single media group. 
 
<a id="ID4ECC"></a>

 
## See also
 
<a id="ID4EEC"></a>

 
##### Parent 

[Marketplace URIs](atoc-reference-marketplace.md)

  
<a id="ID4EOC"></a>

 
##### Further Information 

[EDS Common Headers](../../additional/edscommonheaders.md)

 [EDS Parameters](../../additional/edsparameters.md)

 [EDS Query Refiners](../../additional/edsqueryrefiners.md)

 [Additional Reference](../../additional/atoc-xboxlivews-reference-additional.md)

   