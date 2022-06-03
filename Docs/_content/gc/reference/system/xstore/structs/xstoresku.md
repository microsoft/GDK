---
author: M-Stahl
title: XStoreSku
description: Describes a store SKU.
kindex: XStoreSku
ms.author: shanede
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XStoreSku  

Describes a store SKU.  

## Syntax  
  
```cpp
typedef struct XStoreSku {  
    const char* skuId;  
    const char* title;  
    const char* description;  
    const char* language;  
    XStorePrice price;  
    bool isTrial;  
    bool isInUserCollection;  
    XStoreCollectionData collectionData;  
    bool isSubscription;  
    XStoreSubscriptionInfo subscriptionInfo;  
    uint32_t bundledSkusCount;  
    const char** bundledSkus;  
    uint32_t imagesCount;  
    XStoreImage* images;  
    uint32_t videosCount;  
    XStoreVideo* videos;  
    uint32_t availabilitiesCount;  
    XStoreAvailability* availabilities;  
} XStoreSku  
```
  
### Members  
  
*skuId*  
Type: const char*  
  
ID of the store SKU.    
  
*title*  
Type: const char*  
  
Title of the SKU.    
  
*description*  
Type: const char*  
  
Description of the SKU.  

*language*  
Type: const char*  
  
The International Organization of Standards (ISO) identifier representing the language the title and description strings are. See https://msdn.microsoft.com/library/ms693062(v=vs.85).aspx

*price*  
Type: [XStorePrice](xstoreprice.md)  
  
Price information for the store product

*isTrial*  
Type: bool  
  
Indicates if the store SKU is a trial.    
  
*isInUserCollection*  
Type: bool  
  
Indicates whether the SKU is in the user collection.  
  
*collectionData*  
Type: [XStoreCollectionData](xstorecollectiondata.md)  
  
Additional data related to the product within the user's collection including quantity if the product is a consumable.
  
*isSubscription*  
Type: bool  
  
Indicates if the store SKU is a subscription.  
  
*subscriptionInfo*  
Type: [XStoreSubscriptionInfo](xstoresubscriptioninfo.md)  
  
Subscription information for the SKU.    
  
*bundledSkusCount*  
Type: uint32_t  
  
The number of elements in **bundledSkus**.    
  
*bundledSkus*  
Type: const char**  
  
An array of bundled SKUs.    
  
*imagesCount*  
Type: uint32_t  
  
The number of images in **images**.    
  
*images*  
Type: [XStoreImage*](xstoreimage.md)  
  
Images associated with the SKU.    
  
*videosCount*  
Type: uint32_t  
  
Number of videos in **videos**.    
  
*videos*  
Type: [XStoreVideo*](xstorevideo.md)  
  
Videos associated with the SKU.  
  
*availabilitiesCount*  
Type: uint32_t  
  
The number of elements in **availabilities**.    
  
*availabilities*  
Type: [XStoreAvailability*](xstoreavailability.md)  
  
Availabilities of the SKUs.  
  
## Remarks
  
A SKU is a code that uniquely identifies a particular version of a product or service. It is a very common term used in the field of inventory management. Products in the Store are organized in a hierarchy of *product*, *SKU*, and *availability objects*. Products are represented by [XStoreProduct](xstoreproduct.md) objects. The SKUs for each product are represented by **StoreSku** objects, and the availabilities for each SKU are represented by [XStoreAvailability](xstoreavailability.md) objects.
To access the SKUs for a product, use the SKUs property of the [XStoreProduct](xstoreproduct.md) for the product in which you are interested.

Member of [XStoreProduct](xstoreproduct.md).  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreProduct](xstoreproduct.md)  
[XStoreAvailability](xstoreavailability.md)  
  