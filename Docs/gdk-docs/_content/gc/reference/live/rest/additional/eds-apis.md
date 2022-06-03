---
title: Auxiliary EDS APIs
description: " Auxiliary EDS APIs"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Auxiliary EDS APIs

There are several Entertainment Discovery Services (EDS) APIs that don't directly provide information about content, but give general information about how to use the service or help drive common UI models.

<a id="ID4EQ"></a>


## Auxiliary APIs

| API| URI| Description|
| --- | --- | --- |
| API Parameter Values| /{locale}/metadata| Enumeration of possible values of parameters that can be used in calls to the service|
| Combined Content Rating Generator| /{locale}/contentRating| Creates a value that can be used in other APIs for filtering out potentially objectionable or explicit content. See below for more information.|
| Combined Field Name Generator| /{locale}/fields| Creates a value that can be used in the detail APIs to control which fields are returned. See below for more information.|

<a id="ID4EBC"></a>


### API Parameter Values

This API describes parameters that can be used with the service. The returned information is usable by the client UI because localized text accompanies each parameter.

None of the APIs below accept any query parameters.

| API| URI| Description|
| --- | --- | --- | --- | --- | --- |
| Types| /{locale}/metadata/mediaGroups| The full list of media groups|
| Media item types per Media group| /{locale}/metadata/mediaGroups/{mediaItemTypeGroup}/mediaItemTypes| The list of media item types contained within the given media group.|
| All Media item types| /{locale}/metadata/mediaItemTypes| The full list of media item types|
| Fields per Media item type| /{locale}/metadata/mediaItemTypes/{mediaItemType}/fields| The list of fields in a single media item type|
| Query Refiners| /{locale}/metadata/mediaItemTypes/{mediaItemType}/queryRefiners| The list of query refiners supported for the given media item type|
| All Query Refiner Values| /{locale}/metadata/mediaItemTypes/{mediaItemType}/queryRefiners/{queryRefiner}| The values for the specified query refiner for the given media item type|
| All Query Refiner Sub-Values| /{locale}/metadata/mediaItemTypes/{mediaItemType}/queryRefiners/{queryRefiner}/subQueryRefinerValues| The list of sub-values for a given query refiner value (e.g. "subgenres in a given genre"). The query refiner value is passed in as a query string parameter named "queryRefinerValue", which is done to allow query refiner values with characters forbidden in URI stems to be passed.|
| Sorts| /{locale}/metadata/mediaItemTypes/{mediaItemType}/sortOrders| The list of sort orders for the given media item type|

<a id="ID4EEF"></a>


### Combined Content Rating Generator

Enforcing parental controls over the content children are allowed to see is a complicated task. Not only does each media item type have its own rating system, but those rating systems can vary from country/region to country/region. This means that there are several different pieces of data that need to be specified to properly filter all items.

Instead of specifying all of the parameters in all API calls, this API generates a value to pass into combinedContentRating parameters in other APIs and still communicate the same information. This is designed to make the APIs easier to use and maintain, as the several parameters passed into this API are collapsed into a single, reusable value for the other APIs.

Although the exact values returned by this API may eventually change, they should change very infrequently (such as between releases of EDS) and thus could be cached for long periods of time. Any API accepting a combinedContentRating parameter will give a meaningful error message if the value passed in is invalid, which is an indication the caller merely needs to call this API again to get an updated value. If an API accepts a combinedContentRating parameter, but one isn't provided, no filtering of content will take place based on parental controls

> **Note:**  
> This doesn't mean that only "safe" content is returned--it means that all content is returned, including potentially explicit content).



<a id="ID4EWF"></a>


### Combined Field Name

The EDS APIs, by default, return a very small minimum set of fields for each item:

   * Media item type
   * Media group
   * Id
   * Name

To get more information, the APIs accept a "fields" parameter that specifies which additional pieces of data should be returned. Because there are many possible fields, specifying their name in full for each API call would greatly bloat the request. Instead, the names can be passed into this API which will generate a much smaller value that can be passed into the other APIs.

For any API that accepts this parameter, the provided value must be the superset of all fields in all specified media item types. It's not possible to specify different sets of fields for different media item types. However, if a field applies to one media item type but not another, it will only appear in the media item types where data exists (e.g. if "AvatarBodyType" is included in the call to the Combined Field Name API, only AvatarItems will contain the field).

The values returned from this API are highly cacheable--in fact, they should not change except between deployments of EDS. It's recommended that, if caching is desired, the cache last no longer than the session of the user.

In addition to accepting the actual field names, this API accepts "all" as a valid value. This will generate a value that contains each field it's possible to specify. The "all" value is likely to only be used for development, debugging, and testing purposes.

<a id="ID4ERG"></a>


## See also

<a id="ID4ETG"></a>


##### Parent  

[Additional Reference](atoc-xboxlivews-reference-additional.md)


<a id="ID4E6G"></a>


##### Further Information

[Marketplace URIs](../uri/marketplace/atoc-reference-marketplace.md)