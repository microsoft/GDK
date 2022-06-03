---
author: M-Stahl
title: XStoreProductKind
description: Indicates the product type.
kindex: XStoreProductKind
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreProductKind  

Indicates the product type.  

## Syntax  
  
```cpp
enum class XStoreProductKind  : uint32_t  
{  
    None = 0x00,  
    Consumable = 0x01,  
    Durable = 0x02,  
    Game = 0x04,  
    Pass = 0x08,  
    UnmanagedConsumable = 0x10,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | No product type. |  
| Consumable | A store managed consumable product (is assigned a quantity). |  
| Durable | Durable product. |  
| Game | A base game product. |  
| Pass | A store-managed subscription such as Xbox Game Pass. |  
| UnmanagedConsumable | A dev managed consumable product (requires fulfillment before re-purchase)

  
## Remarks

**XStoreProductKind** is used as a filter for many XStore queries to acquire information about products of a certain type.
**XStoreProductKind** is also a member of the [XStoreProduct](../structs/xstoreproduct.md) struct which describes a store product.
**XStoreProductKind** is a flag enum and its values can be combined to represent multiple types of product at once.

Add-on bundles are of type `Durable`, but Game bundles (the ones that are created at the same level as a game, are type `Game`)

`Pass` refers store managed subscriptions that are specially created and managed by Microsoft Account or Developer Partner Representatives, not the subscription type configured under a game's Add-on page in Partner Center. 

## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreQueryAssociatedProductsAsync](../functions/xstorequeryassociatedproductsasync.md)  
[XStoreQueryEntitledProductsAsync](../functions/xstorequeryentitledproductsasync.md)  
[XStoreQueryProductForPackageAsync](../functions/xstorequeryproductforpackageasync.md)  
[XStoreQueryProductsAsync](../functions/xstorequeryproductsasync.md)  
[XStoreProduct](../structs/xstoreproduct.md)  