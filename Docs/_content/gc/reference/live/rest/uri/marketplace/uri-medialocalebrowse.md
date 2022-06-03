---
title: "/media/{marketplaceId}/browse"
description: " /media/{marketplaceId}/browse"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /media/{marketplaceId}/browse
Allows browsing for items within a single media group. 
The browse API allows clients to browse for items from within a single media group. Pages of data can be accessed non-sequentially using the skipItems parameter instead of using the continuation token.
 
This API also allows browsing within the children of a given item. For example, by passing in an ID and a MediaItemType parameter for an Xbox 360 Game, this allows browsing and diltering on the children of that item, such as Avatar items or DLC for the game.
 
This API accepts Query Refiners.
 
Some scenarios for retrieving children include:
 
   * Album to Tracks
   * Series to Seasons
   * Seasons to Episodes
   * Track to Music Video
   * Artist to Albums
   * Games to Game Add-ons (DLC, Avatar, Themes, etc.)
  
The domain for these URIs is `eds.xboxlive.com`.
 
  * [URI parameters](#ID4EMB)
 
<a id="ID4EMB"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| marketplaceId| string| Required. String value obtained from the <b>Windows.Xbox.ApplicationModel.Store.Configuration.MarketplaceId</b>.| 
  
<a id="ID4ENC"></a>

 
## Valid methods

[GET (media/{marketplaceId}/browse)](uri-medialocalebrowseget.md)

&nbsp;&nbsp;Allows browsing for items within a single media group. 
 
<a id="ID4EXC"></a>

 
## See also
 
<a id="ID4EZC"></a>

 
##### Parent 

[Marketplace URIs](atoc-reference-marketplace.md)

  
<a id="ID4EDD"></a>

 
##### Further Information 

[EDS Common Headers](../../additional/edscommonheaders.md)

 [EDS Parameters](../../additional/edsparameters.md)

 [EDS Query Refiners](../../additional/edsqueryrefiners.md)

 [Additional Reference](../../additional/atoc-xboxlivews-reference-additional.md)

   