---
title: "/media/{marketplaceId}/metadata/mediaItemTypes"
description: " /media/{marketplaceId}/metadata/mediaItemTypes"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /media/{marketplaceId}/metadata/mediaItemTypes
Accesses all supported mediaItemTypes for the given EDS version. 
The domain for these URIs is `eds.xboxlive.com`.
 
  * [URI parameters](#ID4EV)
 
<a id="ID4EV"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| marketplaceId| string| Required. String value obtained from the <b>Windows.Xbox.ApplicationModel.Store.Configuration.MarketplaceId</b>.| 
  
<a id="ID4EUB"></a>

 
## Valid methods

[GET (/media/{marketplaceId}/metadata/mediaItemTypes)](uri-medialocalemetadatamediaitemtypesget.md)

&nbsp;&nbsp;Lists all supported mediaItemTypes for the given EDS version.
 
<a id="ID4E5B"></a>

 
## See also
 
<a id="ID4EAC"></a>

 
##### Parent 

[Marketplace URIs](atoc-reference-marketplace.md)

  
<a id="ID4EKC"></a>

 
##### Further Information 

[EDS Common Headers](../../additional/edscommonheaders.md)

 [EDS Parameters](../../additional/edsparameters.md)

 [EDS Query Refiners](../../additional/edsqueryrefiners.md)

 [Additional Reference](../../additional/atoc-xboxlivews-reference-additional.md)

   