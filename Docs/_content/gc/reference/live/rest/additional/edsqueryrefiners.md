---
title: EDS Query Refiners
description: " EDS Query Refiners"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# EDS Query Refiners
 
<a id="ID4EO"></a>

  
 
The following parameters can be used to refine an Entertainment Discovery Services (EDS) query to a more targeted set of items. None of these parameters are required in any API, but they're accepted in any API that accepts query refiners.
 
The parameter names can be passed in as values into any "queryRefiners" parameter. This will then return the number of items that would be returned if the request were repeated with the query refiner applied, broken down by each value of the query refiner.
 
Here's how this might work in practice:
 
   * A call to the browse API is made, including the parameter "queryRefiners=genre".
   * The API returns eight games. In addition to the items, a list of each genre that has items will be returned, along with how many items belong to that genre. For a game, this might be "Shooter: 3, Puzzle: 5".
   * A second query is made. It's identical to the first, except that "genre=Shooter" is added.
   * The response now contains only three games, all of which belong to the "Shooter" category.
  
| Parameter| Data Type| Description| 
| --- | --- | --- | 
| <b>decade</b>| string| The decade in which all items must have been released.| 
| <b>genre</b>| array of string| The list of genres that all items must have.| 
| <b>labelOwner</b>| string| The music label associated with the artist, album, or track.| 
| <b>network</b>| array of string| The network that created the items.| 
| <b>studio</b>| array of string| The studio that created the items.| 
| <b>xboxAppCategories</b>| array of string| The list of categories that all Xbox Apps must have.| 
| <b>xboxAvatarClothes</b>| array of string| The list of clothing types all Xbox Avatar items must have.| 
| <b>xboxAvatarStores</b>| array of string| The list of stores to which all Xbox avatar items must belong.| 
| <b>xboxGamePublisherBits</b>| array of string| The list of game publisher bits that must be set on all GameType items or AppType items.| 
| <b>xboxIsBrowsable</b>| Boolean value| If <b>true</b>, will return full games which are not directly actionable in addition to actionable content. Defaults to <b>false</b>.| 
| <b>xboxHasChildMediaItemTypes</b>| array of string| All returned items with a media group of Game must have children whose media item type is one of the provided values.| 
  
<a id="ID4EEF"></a>

 
## See also
 
<a id="ID4EGF"></a>

 
##### Parent  

[Additional Reference](atoc-xboxlivews-reference-additional.md)

  
<a id="ID4ESF"></a>

 
##### Further Information 

[Marketplace URIs](../uri/marketplace/atoc-reference-marketplace.md)

   