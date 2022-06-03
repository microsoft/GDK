---
author: M-Stahl
title: XGameSaveBlob
description: Unit of information for XGameSave storage. Resides within a XGameSaveContainer.
kindex: XGameSaveBlob
ms.author: kelcon
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveBlob  

Unit of information for XGameSave storage. Resides within a XGameSaveContainer.  

## Syntax  
  
```cpp
typedef struct XGameSaveBlob {  
    XGameSaveBlobInfo info;  
    uint8_t* data;  
} XGameSaveBlob  
```
  
### Members  
  
*info*  
Type: [XGameSaveBlobInfo](xgamesaveblobinfo.md)  
  
Information about the XGameSaveBlob which includes the name of the XGameSaveBlob and its size.  
  
*data*  
Type: uint8_t*  
  
Pointer to the XGameSaveBlob data.  
  
## Remarks  
  
An XGameSaveBlob or simply a blob, is a buffer which contains data saved by a game. It also contains information about itself in the form of [XGameSaveBlobInfo](xgamesaveblobinfo.md). This info includes its name and size so that it can be read appropriately. Blobs reside inside of **XGameSaveContainers**. A container can hold multiple blobs and acts like a folder for groups of related blobs. In order to read, write, or delete a blob you must first identify the correct container for that blob. Once you've identified the correct container you can enumerate the blobs within it by calling [XGameSaveEnumerateBlobInfo](../functions/xgamesaveenumerateblobinfo.md) or [XGameSaveEnumerateBlobInfoByName](../functions/xgamesaveenumerateblobinfobyname.md). Blobs may be read by calling [XGameSaveReadBlobData](../functions/xgamesavereadblobdata.md) or [XGameSaveReadBlobDataAsync](../functions/xgamesavereadblobdataasync.md)  
  
## Requirements  
  
**Header:** XGameSave.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveEnumerateBlobInfo](../functions/xgamesaveenumerateblobinfo.md)  
[XGameSaveEnumerateBlobInfoByName](../functions/xgamesaveenumerateblobinfobyname.md)  
[XGameSaveReadBlobData](../functions/xgamesavereadblobdata.md)  
[XGameSaveReadBlobDataAsync](../functions/xgamesavereadblobdataasync.md)  