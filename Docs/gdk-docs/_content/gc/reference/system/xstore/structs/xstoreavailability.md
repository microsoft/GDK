---
author: M-Stahl
title: XStoreAvailability
description: Describes the availability of a product.
kindex: XStoreAvailability
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreAvailability  

Describes the availability of a product.  

## Syntax  
  
```cpp
typedef struct XStoreAvailability {  
    const char* availabilityId;  
    XStorePrice price;  
    time_t endDate;  
} XStoreAvailability  
```
  
### Members  
  
*availabilityId*  
Type: const char*  
  
ID for the product/SKU combination.  
  
*price*  
Type: [XStorePrice](xstoreprice.md)  
  
The price of the product.  
  
*endDate*  
Type: time_t  
  
Availability end date.  
  
## Remarks

Products in the Store are organized in a hierarchy of *product*, *SKU*, and *availability* objects. Products are represented by [XStoreProduct](xstoreproduct.md) objects. The SKUs for each product are represented by [XStoreSku](xstoresku.md) objects, and the availabilities for each SKU are represented by **XStoreAvailability** objects. **XStoreAvailability** is a member of the [XStoreSku](xstoresku.md) struct.
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreSku](xstoresku.md)  
[XStoreProduct](xstoreproduct.md)  