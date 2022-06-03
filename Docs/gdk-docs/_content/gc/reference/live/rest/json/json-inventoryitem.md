---
title: inventoryItem (JSON)
description: " inventoryItem (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# inventoryItem (JSON)
The core inventory item represents the standard item on which an entitlement can be granted.
<a id="ID4EN"></a>


## inventoryItem

The inventoryItem object has the following specification.

| Member| Type| Description|
| --- | --- | --- |
| url| string| Unique identifier for this specific inventory item.|
| itemType| string| Type of the item. Current values are <ul><li><b>Unknown</b></li><li><b>Game</b></li><li><b>Movie</b></li><li> <b>TVShow</b></li><li><b>MusicVideo</b></li><li><b>GameTrial</b></li><li><b>ViralVideo</b></li><li><b>TVEpisode</b></li><li><b>TVSeason</b></li><li><b>TVSeries</b></li><li><b>VideoPreview</b></li><li><b>Poster</b></li><li><b>Podcast</b></li><li><b>Image</b></li><li><b>BoxArt</b></li><li><b>ArtistPicture</b></li><li><b>GameContent</b></li><li><b>GameDemo</b></li><li><b>Theme</b></li><li><b>XboxOriginalGame</b></li><li><b>GamerTile</b></li><li><b>ArcadeGame</b></li><li><b>GameConsumable</b></li><li><b>Album</b></li><li><b>AlbumDisc</b></li><li><b>AlbumArt</b></li><li><b>GameVideo</b></li><li><b>BackgroundArt</b></li><li><b>TVTrailer</b></li><li><b>GameTrailer</b></li><li><b>VideoShort</b></li><li><b>Bundle</b></li><li><b>XnaCommunityGame</b></li><li><b>Promotional</b></li><li><b>MovieTrailer</b></li><li><b>SlideshowPreviewImage</b></li><li><b>ServerBackedGames</b></li><li><b>Marketplace</b></li><li><b>AvatarItem</b></li><li><b>LiveApp</b></li><li><b>WebGame</b></li><li><b>MobileGame</b></li><li><b>MobilePdlc</b></li><li><b>MobileConsumable</b></li><li><b>App</b></li><li><b>MetroGame</b></li><li><b>MetroGameContent</b></li><li><b>MetroGameConsumable</b></li><li><b>GameLayer</b></li><li><b>GameActivity</b></li><li><b>GameV2</b></li><li><b>SubscriptionV2</b></li><li><b>Subscription</b><br/><br/> **Note:** Games are designated by **GameV2**, consumables are **GameConsumable**, and durable DLC is **GameContent**. |
  | containers | string | This is the set of "containers" that contain this item. A user's inventory can be queried for items that belong to a specific container. These containers are determined when the item is added to the inventory by purchase. |
  | obtained | DateTime | Date and time the item was added to the user's inventory. |
  | startDate | DateTime | Date and time the item became or will become available for use. |
  | endDate | DateTime | Date and time the item became or will become unusable. |
  | state | string | The state of the item. Allowed values are **Enabled**, **Suspended**, **Expired**, **Canceled**, **Renewed**.  |
  | trial | Boolean value | Required. True if this entitlement is a trial; otherwise, false. If you buy the trial version of an entitlement and then buy the full version, you will receive both. |
  | trialTimeRemaining | TimeSpan | Nullable. How much time is remaining on the trial, in minutes. |
  | consumable | array | If the items is consumable, this contains an inline representation of the unique identifier (link) for the consumable inventory item, as well as its current quantity. |

<a id="ID4EMAAC"></a>


## Sample JSON syntax


```json
inventoryItem {
  "url": string,
  "itemType": "Music" | "Video" | "Game" | "AvatarItem" | "Subscription" | "DLC" | "Consumable" | ...,
  "obtained": DateTime,
  "beginDate": DateTime,
  "endDate": DateTime,
  "state": "Unavailable" | "Available" | "Suspended" | "Expired",
  "trial": true,
  "trialTimeRemaining":"23:12:14",
  ("consumable": {"url": string, "quantity": int})
}

```


<a id="ID4EVAAC"></a>


## Consumable inventory item

The consumable entity presents the minimal set of properties for a consumable item.

| Member| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| url| string| Unique identifier for the specific consumable inventory item.|
| quantity| 32-bit signed integer| The current quantity of this inventory item.|


```json
consumableInventoryItem {
  "url": string,
  "quantity": int
}

```


<a id="ID4E4BAC"></a>


## See also

<a id="ID4E6BAC"></a>


##### Parent

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)


<a id="ID4EJCAC"></a>


##### Reference

[/users/me/inventory](../uri/marketplace/uri-inventory.md)

 [/inventory/consumables/{itemID}](../uri/marketplace/uri-inventoryconsumablesitemurl.md)

 [/inventory/{itemID}](../uri/marketplace/uri-inventoryitemurl.md)