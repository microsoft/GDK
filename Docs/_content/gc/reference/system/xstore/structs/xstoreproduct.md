---
author: M-Stahl
title: XStoreProduct
description: Describes a store product.
kindex: XStoreProduct
ms.author: shanede
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XStoreProduct  

Describes a store product.  

## Syntax  
  
```cpp
typedef struct XStoreProduct {  
    const char* storeId;  
    const char* title;  
    const char* description;  
    const char* language;  
    const char* inAppOfferToken;  
    char* linkUri;  
    XStoreProductKind productKind;  
    XStorePrice price;  
    bool hasDigitalDownload;  
    bool isInUserCollection;  
    uint32_t keywordsCount;  
    const char** keywords;  
    uint32_t skusCount;  
    XStoreSku* skus;  
    uint32_t imagesCount;  
    XStoreImage* images;  
    uint32_t videosCount;  
    XStoreVideo* videos;  
} XStoreProduct  
```
  
### Members  
  
*storeId*  
Type: const char*  
  
The product ID.    
  
*title*  
Type: const char*  
  
The title of the product.   
  
*description*  
Type: const char*  
  
A description of the store product.    
  
*language*  
Type: const char*  
  
The International Organization of Standards (ISO) identifier representing the language the title and description strings are. See https://msdn.microsoft.com/library/ms693062(v=vs.85).aspx
  
*inAppOfferToken*  
Type: const char*  
  
Game defined offer token that you can use to map items internally. For example: com.company.product.itemname.    
  
*linkUri*  
Type: char*  
  
URI to the product.  

*productKind*  
Type: [XStoreProductKind](../enums/xstoreproductkind.md)  
  
Indicates the type of store product.  
  
*price*  
Type: [XStorePrice](xstoreprice.md)  
  
Price information for the store product.   
  
*hasDigitalDownload*  
Type: bool  
  
Indicates whether the store product has a digital download.    
  
*isInUserCollection*  
Type: bool  
  
Indicates if the product is in the user collection.    
  
*keywordsCount*  
Type: uint32_t  
  
The number of keywords in **keywords**.    
  
*keywords*  
Type: const char**  
  
Keywords associated with the store product.    
  
*skusCount*  
Type: uint32_t  
  
The number of SKUs in **skus**.    
  
*skus*  
Type: [XStoreSku*](xstoresku.md)  
  
An array of SKUs associated with the product.  
  
*imagesCount*  
Type: uint32_t  
  
The number of images in **images**.    
  
*images*  
Type: [XStoreImage*](xstoreimage.md)  
  
Images associated with the product.    
  
*videosCount*  
Type: uint32_t  
  
The number of videos in **videos**.    
  
*videos*  
Type: [XStoreVideo*](xstorevideo.md)  
  
Videos associated with the product.
  
## Remarks

Products in the Store are organized in a hierarchy of *product*, *SKU*, and *availability* objects. Products are represented by **XStoreProduct** objects. The SKUs for each product are represented by [XStoreSku](xstoresku.md) objects, and the availabilities for each SKU are represented by [XStoreAvailability](xstoreavailability.md) objects.

## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
  
  