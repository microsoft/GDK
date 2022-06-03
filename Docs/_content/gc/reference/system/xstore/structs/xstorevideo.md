---
author: M-Stahl
title: XStoreVideo
description: Describes a store video.
kindex: XStoreVideo
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreVideo  

Describes a store video.  

## Syntax  
  
```cpp
typedef struct XStoreVideo {  
    const char* uri;  
    uint32_t height;  
    uint32_t width;  
    const char* caption;  
    const char* videoPurposeTag;  
    XStoreImage previewImage;  
} XStoreVideo  
```
  
### Members  
  
*uri*  
Type: const char*  
  
URI to the video.    
  
*height*  
Type: uint32_t  
  
Height of the video.  
  
*width*  
Type: uint32_t  
  
Width of the video.    
  
*caption*  
Type: const char*  
  
Caption for the video.    
  
*videoPurposeTag*  
Type: const char*  
  
String containing a tag indicating the purpose of the video.  
  
*previewImage*  
Type: [XStoreImage](xstoreimage.md)  
  
Preview image for the video.    
  
## Remarks
  
Aspects of the Microsoft store experience use videos to help describe the product, and this struct describes those videos. **XStoreVideo** is a member of the [XStoreProduct](xstoreproduct.md) struct. **XStoreVideo** is a member of the [XStoreSku](xstoresku.md) struct.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreProduct](xstoreproduct.md)  
[XStoreSku](xstoresku.md)  