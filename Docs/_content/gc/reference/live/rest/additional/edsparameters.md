---
title: EDS Parameters
description: EDS Parameters
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# EDS Parameters

<a id="ID4EO"></a>


## Query string parameters

These query parameters are not necessarily accepted by all [Entertainment Discovery Services (EDS) APIs](../uri/marketplace/atoc-reference-marketplace.md), but all are accepted by more than one API.

| Parameter| Type| Description|
| --- | --- | --- |
| combinedContentRating| string| Optional. See [GET (/media/{marketplaceId}/contentRating)](../uri/marketplace/uri-medialocalecontentratingget.md).|
| continuationToken| string| Optional. The continuation token is an opaque blob that contains information the service needs for pagination in certain scenarios. If the value is omitted, the first page of results is returned (where page size is determined by the maxItems parameter), along with a continuation token that can be used to obtain the second page of results. The second page would contain the continuation token for the third page of results, and so on.|
| Desired| string| Optional. See the Combined Field Name API.|
| desiredMediaItemTypes| array of string| Optional. This parameter determines the types of items to be returned in the response.|
| Domain| string| Optional. The Domain parameter determines the game and app marketplace context in which client is calling for. By default the domain is "Modern", indicating the client can only ask for Xbox One (or later) content. If the client wants to switch the domain to surface Xbox 360 content, it must specify Domain as "Xbox360". Currently, cross domain results are not supported. Possible values are: <ul><li>Xbox360</li><li>Modern</li></ul> The "Xbox360" value is only supported for singleMediaGroupSearch. Browse and Details are supported. crossMediaGroupSearch is not supported and will return a 400 error.|
| fields| string| Optional. See [GET (/media/{marketplaceId}/fields)](../uri/marketplace/uri-medialocalefieldsget.md).|
| firstPartyOnly| Boolean value| Optional filter parameter. Determines whether only first-party content is returned or whether both first- and third-party content are returned from the query. |
| freeOnly| Boolean value| Optional filter parameter. Restricts results to only free content.|
| GroupBy| TK| The groupBy parameter is used to help categorize the result set into groups, rather than a single result set. Specifying this parameter will modify the result set to return multiple lists of items, where the number of items in each bucket is determined by the maxItems parameter. <ul><li>MediaGroup - The results are grouped by MediaGroup.</li></ul> |
| hasTrailer| Boolean value| Optional filter parameter. Determines whether the returned items must contain a trailer or if having a trailer is optional. If the value is true, all items must have trailers.|
| id| string| Optional. If provided, restricts the results to only be children of the item with the given ID. If this parameter is provided, MediaItemType must also be specified. |
| ids| array of string| Required. All of the IDs (up to 10) for which details will be returned. Note that any ID that contains characters illegal to put in a URL (the ProviderContentId-type IDs are normally full URLs themselves and thus contain illegal characters) must be URL-encoded to be properly sent to EDS.|
| idType| string| Optional. The type of the IDs which are passed in to the ids parameter. Valid values include: <ul><li>Canonical (Bing/Marketplace)</li><li>XboxHexTitle (App playing on the console)</li></ul>  All provided IDs must share the same idType. If this value is omitted, all IDs are assumed to be Canonical.|
| latestOnly| Boolean value| Optional filter parameter. Restricts results to only the ones with the newest release date.|
| maxItems| 32-bit signed integer| Optional. Determines the maximum number of items which should be returned from a call. Valid values are numbers between 1 and 25, inclusive. The parameter defaults to 25 if omitted.|
| mediaGroup| string| Optional. The media group of the IDs. All provided IDs must share the same media group.|
| MediaItemType| string| Optional. The type of the item whose ID was specified in the id parameter. If the id parameter is provided, this parameter must also be specified.|
| orderBy| string| Required. The orderBy parameter determines how the items being returned should be sorted. The common values for this field are listed here, but some APIs may support additional values.<ul><li>playCountDaily - By count of times media played, for the most recent day.</li><li>freeAndPaidCountDaily - By count of free and paid purchases, for the most recent day.</li><li>paidCountAllTime - By count of only paid purchases, for all time.</li><li>paidCountDaily - By count of only paid purchases, for the most recent day.</li><li>digitalReleaseDate - By date available for download.</li><li>releaseDate - By date available in stores, falling back to digital release date (if available).</li><li>userRatings - By average user ratings.</li></ul> |
| preferredProvider| string| Optional. If the user has a preferred content provider, such as Comcast Xfinity or Verizon FIOS, that provider's ID can be passed in. While the actual ordering of the items won't change, for each item, the specified provider's information will be displayed at the top of the list of providers (if the preferred content provider has the item available).|
| q| string| Required. Query term used in search.|
| queryRefiners| array of string| Optional. See the list of [EDS Query Refiners](edsqueryrefiners.md).|
| relationship| string| Optional. Filter that uses the ID parameter as the base to search for other products that match the relationship type specified: <ul><li>bundledWith - Find bundle products where the ID parameter is included as part of those bundles.</li><li>bundledProducts - Find the products that are included in the bundle specified by the ID parameter.</li></ul>  Only products that are visible in the marketplace (can be returned in a browse call) will be returned with this parameter. If a bundle has a hidden product, it is still part of the bundle but not returned in these results.|
  | ScopeId | string | This parameter is used in reverse lookup scenarios for video media. |
  | ScopeIdType | string | This parameter is used in reverse lookup scenarios for video media. Possible values: Title. |
  | skipItems | 32-bit signed integer | Optional. For paging in non-cross-group scenarios, the skipItems parameter is used to determine how many items have already been seen (and thus what item should be displayed first in the result set). The value is 0-based, so skipItems=0 (or simply not supplying skipItems) begins retrieval at the start of the list. skipItems=3 would skip the first three items in the list and begin retrieval with the fourth item. |
  | subscriptionLevel | array of string | Optional filter parameter. The subscriptionLevel parameter determines the type of subscription the user has (such as whether a user has a paid subscription or a free subscription). Possible values are as follows. <ul><li>gold: The user has a paid subscription</li><li>silver: The user has a free subscription.</li></ul>  |
| TargetDevices| string| EDS provides the flexibility to filter offers for target devices. The Offers (ProviderContent or Availability) returned for the Item can be restricted to a target device.|
| topRatedOnly| Boolean value| Optional filter parameter. Restricts results to only the best-rated content.|

<a id="ID4EGEAC"></a>


## See also

<a id="ID4EIEAC"></a>


### Parent

[Additional Reference](atoc-xboxlivews-reference-additional.md)


<a id="ID4EUEAC"></a>


### Further Information

[Marketplace URIs](../uri/marketplace/atoc-reference-marketplace.md)