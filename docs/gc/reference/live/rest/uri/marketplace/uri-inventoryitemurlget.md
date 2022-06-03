---
title: GET (/inventory/{itemID})
description: " GET (/inventory/{itemID})"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/inventory/{itemID})
Provides the full set of details for a specific inventory item. 
The domain for these URIs is `inventory.xboxlive.com`.
 
  * [Remarks](#ID4EX)
  * [URI parameters](#ID4EAB)
  * [Response body](#ID4ELB)
 
<a id="ID4EX"></a>

 
## Remarks
 
No policy checks, enforcement, or filtering will occur as a part of this call.
  
<a id="ID4EAB"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| itemID| string| the ID unique to each user for a singular inventory item| 
  
<a id="ID4ELB"></a>

 
## Response body
 
<a id="ID4ERB"></a>

 
### Sample response
 
The response to a GET request, assuming it passes authentication and is assigned the appropriate authorization context, is a single inventory item with the full set of item properties.
 

```cpp
{inventoryItem}
         
```

   
<a id="ID4E4B"></a>

 
## See also
 
<a id="ID4E6B"></a>

 
##### Parent 

GET (/inventory/{itemID})

  
<a id="ID4EJC"></a>

 
##### Further Information 

[EDS Common Headers](../../additional/edscommonheaders.md)

 [EDS Parameters](../../additional/edsparameters.md)

 [EDS Query Refiners](../../additional/edsqueryrefiners.md)

 [Marketplace URIs](atoc-reference-marketplace.md)

 [Additional Reference](../../additional/atoc-xboxlivews-reference-additional.md)

   