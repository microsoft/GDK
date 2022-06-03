---
title: Marketplace URIs
description: " Marketplace URIs"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Marketplace URIs

This section provides detail about Universal Resource Identifier (URI) addresses and associated Hypertext Transport Protocol (HTTP) methods from Xbox Live Services for *marketplace* services, also known as Entertainment Discovery Services (EDS).

Only games running on an Xbox 360, on a Windows Phone device, or on Xbox.com can use this service.

The domains for these URIs are eds.xboxlive.com and inventory.xboxlive.com.

<a id="ID4EPB"></a>

 
## In this section

[/users/me/inventory](uri-inventory.md)

&nbsp;&nbsp;Accesses the set of inventory currently associated with the provided user.

[/users/me/consumables/{itemID}](uri-inventoryconsumablesitemurl.md)

&nbsp;&nbsp;Accesses the full set of details for a specific consumable inventory item.

[/inventory/{itemID}](uri-inventoryitemurl.md)

&nbsp;&nbsp;Accesses the full set of details for a specific inventory item.

[/media/{marketplaceId}/crossMediaGroupSearch](uri-localecrossmediagroupsearch.md)

&nbsp;&nbsp;Accesses items from several different media groups.

[/media/{marketplaceId}/browse](uri-medialocalebrowse.md)

&nbsp;&nbsp;Allows browsing for items within a single media group.

[/media/{marketplaceId}/contentRating](uri-medialocalecontentrating.md)

&nbsp;&nbsp;Access the content rating token.

[/media/{marketplaceId}/details](uri-medialocaledetails.md)

&nbsp;&nbsp;Returns offer details and metadata about one or more items.

[/media/{marketplaceId}/fields](uri-medialocalefields.md)

&nbsp;&nbsp;Accesses the fields token.

[/media/{marketplaceId}/metadata/mediaGroups](uri-medialocalemetadatamediagroups.md)

&nbsp;&nbsp;Lists all supported mediaGroups for the given EDS version.

[/media/{marketplaceId}/metadata/mediaGroups/{mediagroup}/mediaItemTypes](uri-medialocalemetadatamediagroupsmediaitemtypes.md)

&nbsp;&nbsp;Accesses the available mediaItemTypes per media group for the given version of EDS.

[/media/{marketplaceId}/metadata/mediaItemTypes/{mediaItemType}/fields](uri-medialocalemetadatamediaitemtypefields.md)

&nbsp;&nbsp;Accesses fields from which one can expect data, for a given mediaitemtype and a given version of EDS.

[/media/{marketplaceId}/metadata/mediaItemTypes/{mediaitemtype}/queryrefiners](uri-medialocalemetadatamediaitemtypequeryrefiners.md)

&nbsp;&nbsp;Accesses the query refiners for the given media item type.

[/media/{marketplaceId}/metadata/mediaItemTypes/{mediaitemtype}/queryrefiners/{queryrefinername}](uri-medialocalemetadatamediaitemtypequeryrefinersqueryrefinername.md)

&nbsp;&nbsp;Accesses the acceptable values for the given query refiner name and given media item type.

[/media/{marketplaceId}/metadata/mediaItemTypes/{mediaitemtype}/queryrefiners/{queryRefiner}/subQueryRefinerValues](uri-medialocalemediaitemtypequeryrefinersubqueryrefinervalues.md)

&nbsp;&nbsp;Access the list of sub-values for a given query refiner value (e.g., "subgenres in a given genre").

[/media/{marketplaceId}/metadata/mediaItemTypes](uri-medialocalemetadatamediaitemtypes.md)

&nbsp;&nbsp;Accesses all supported mediaItemTypes for the given EDS version.

[/media/{marketplaceId}/metadata/mediaItemTypes/{mediaitemtype}/sortorders](uri-medialocalemetadatamediaitemtypesortorders.md)

&nbsp;&nbsp;Accesses available sort orders for a given mediaitem type and a given version of EDS.

[/media/{marketplaceId}/singleMediaGroupSearch](uri-medialocalesinglemediagroupsearch.md)

&nbsp;&nbsp;Allows search for items within a single media group.

<a id="ID4EFD"></a>


## See also

<a id="ID4EHD"></a>


##### Parent

[Universal Resource Identifier (URI) Reference](../atoc-xboxlivews-reference-uris.md)


<a id="ID4ERD"></a>


##### Further Information

[Additional Reference](../../additional/atoc-xboxlivews-reference-additional.md)