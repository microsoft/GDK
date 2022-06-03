---
title: GET (/media/{marketplaceId}/fields)
description: " GET (/media/{marketplaceId}/fields)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/media/{marketplaceId}/fields)
Gets the fields token. 
The domain for these URIs is `eds.xboxlive.com`.
 
  * [Remarks](#ID4EV)
  * [URI parameters](#ID4EGC)
  * [Query string parameters](#ID4ERC)
 
<a id="ID4EV"></a>

 
## Remarks
 
The Entertainment Discovery Services (EDS) APIs, by default, returns a very small minimum set of fields for each item:
 
   * Media item type
   * Media group
   * Id
   * Name
  
To get more information, the APIs accept a **fields** parameter that specifies which additional pieces of data should be returned. Because there are many possible fields, specifying their name in full for each API call would greatly bloat the request. Instead, the names can be passed into this API which will generate a much smaller value that can be passed into the other APIs.
 
For any API that accepts this parameter, the provided value must be the superset of all fields in all specified media item types. It's not possible to specify different sets of fields for different media item types. However, if a field applies to one media item type but not another, it will only appear in the media item types where data exists (for example, if "AvatarBodyType" is included in the call to `GET (/media/{marketplaceId}/fields)`, only AvatarItems will contain the field).
 
The values returned from this API are highly cacheable -- in fact, they should not change except between deployments of EDS. It's recommended that, if caching is desired, the cache last no longer than the session of the user.
 
In addition to accepting the actual field names, this API accepts "all" as a valid value. This will generate a value that contains each field it's possible to specify. Use of the "all" value is recommended only for development, debugging, and testing purposes.
 
Alternatively, you can send `desired={list of fields separated by a '.'}` to any API that accepts the **fields** token.
 
You cannot pass in both **desired** and **fields** together.
  
<a id="ID4EGC"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| marketplaceId| string| Required. String value obtained from the <b>Windows.Xbox.ApplicationModel.Store.Configuration.MarketplaceId</b>.| 
  
<a id="ID4ERC"></a>

 
## Query string parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | --- | --- | --- | 
| desired| string| Required. The '.'-separated list of fields that should be returned in addition to the minimum set. Not all fields specified are guaranteed to be returned for each object (data may simply not exist for certain items), but no fields outside the minimum set that aren't specified here will be returned. | 
  
<a id="ID4EMD"></a>

 
## See also
 
<a id="ID4EOD"></a>

 
##### Parent 

[/media/{marketplaceId}/fields](uri-medialocalefields.md)

  
<a id="ID4EYD"></a>

 
##### Further Information 

[EDS Common Headers](../../additional/edscommonheaders.md)

 [EDS Parameters](../../additional/edsparameters.md)

 [EDS Query Refiners](../../additional/edsqueryrefiners.md)

 [Marketplace URIs](atoc-reference-marketplace.md)

 [Additional Reference](../../additional/atoc-xboxlivews-reference-additional.md)

   