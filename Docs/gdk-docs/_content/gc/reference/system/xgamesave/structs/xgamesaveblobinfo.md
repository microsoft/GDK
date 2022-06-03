---
author: M-Stahl
title: XGameSaveBlobInfo
description: Information about the XGameSaveBlob.
kindex: XGameSaveBlobInfo
ms.author: kelcon
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveBlobInfo  

Information about the XGameSaveBlob.  

## Syntax  
  
```cpp
typedef struct XGameSaveBlobInfo {  
    const char* name;  
    uint32_t size;  
} XGameSaveBlobInfo  
```
  
### Members  
  
*name*  
Type: const char*  
  
Name of the XGameSaveBlob.  
  
*size*  
Type: uint32_t  
  
Size of the XGameSaveBlob.  
  
## Remarks  
  
**XGameSaveBlobInfo** describes the properties of an [XGameSaveBlob](xgamesaveblob.md). The name property helps assure that you are reading the correct blob. The size property allows you to read it with a sufficiently large buffer. **XGameSaveBlobInfo** is a parameter of [XGameSaveBlobInfoCallback](../functions/xgamesaveblobinfocallback.md).  
  
## Requirements  
  
**Header:** XGameSave.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveBlob](xgamesaveblob.md)  
[XGameSaveBlobInfoCallback](../functions/xgamesaveblobinfocallback.md)  