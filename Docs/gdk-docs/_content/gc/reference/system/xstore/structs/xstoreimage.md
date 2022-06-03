---
author: M-Stahl
title: XStoreImage
description: Describes an image.
kindex: XStoreImage
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreImage  

Describes an image.  

## Syntax  
  
```cpp
typedef struct XStoreImage {  
    const char* uri;  
    uint32_t height;  
    uint32_t width;  
    const char* caption;  
    const char* imagePurposeTag;  
} XStoreImage  
```
  
### Members  
  
*uri*  
Type: const char*  
  
URI to the image.  
  
*height*  
Type: uint32_t  
  
Height of the image.  
  
*width*  
Type: uint32_t  
  
Width of the image.  
  
*caption*  
Type: const char*  
  
Caption for the image.  
  
*imagePurposeTag*  
Type: const char*  
  
A string containing a tag indicating the purpose of the image.  
  
## Remarks  

Aspects of the Microsoft store experience use images to help describe the product, and this struct describes those images. **XStoreImage** is a member of the 
[XStoreProduct](xstoreproduct.md) struct. **XStoreImage** is a member of the [XStoreSku](xstoresku.md) struct. **XStoreImage** is a member of the [XStoreVideo](xstorevideo.md) struct.

## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreProduct](xstoreproduct.md)  
[XStoreSku](xstoresku.md)  
[XStoreVideo](xstorevideo.md)  
  