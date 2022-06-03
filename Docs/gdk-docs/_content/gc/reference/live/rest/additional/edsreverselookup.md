---
title: EDS Reverse Lookup for Video
description: " EDS Reverse Lookup for Video"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# EDS Reverse Lookup for Video
 
  * [Reverse Lookup steps](#ID4EQ)
 
<a id="ID4EQ"></a>

 
## Reverse Lookup steps
 
Entertainment Discovery Services (EDS) Reverse Lookup is supported for all Video media types (**MediaItemType.Movie**, **MediaItemType.TVSeries**, **MediaItemType.TVEpisode**, **MediaItemType.TVSeason**, and **MediaItemType.TVShow**), as well as **MediaItemType.Unknown**.
 
Reverse lookup requires 4 parameters to be passed: 
   * `idType=ScopedMediaId`
   * `ids=` the provider media ID
   * `ScopeIdType=Title`
   * `ScopeId=` the provider title ID
 
 
Usually the reverse lookup requires 2 steps: 
   * Retrieve provider media id (for example, from a details call) if it's not available. 

```cpp
GET /media/en-us/details?ids=4eeaf5b4-9af2-56e4-a738-68b48e954494&desiredMediaItemTypes=Movie&desired=Providers
```

 
   * Issue the call for reverse lookup using the **ProviderMediaId** field from the previous response: 

```cpp
GET /media/en-us/details?ids=047d19ca-3a7d-462c-bdbb-163543125583&idType=ScopedMediaId&desiredMediaItemTypes=Movie&fields=all&ScopeIdType=Title&ScopeId=0x5848085B
```

 
  
 
If the **ProviderMediaId** field has not been retrieved from EDS then the field must be URL-encoded to be passed correctly to EDS.
  
<a id="ID4EOC"></a>

 
## See also
 
<a id="ID4EQC"></a>

 
##### Parent  

[Additional Reference](atoc-xboxlivews-reference-additional.md)

  
<a id="ID4E3C"></a>

 
##### Further Information 

[Marketplace URIs](../uri/marketplace/atoc-reference-marketplace.md)

   