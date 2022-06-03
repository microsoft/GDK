---
author: M-Stahl
title: XGameSaveBlobInfoCallback
description: Callback function to retrieve the results of [XGameSaveEnumerateBlobInfo](xgamesaveenumerateblobinfo.md).
kindex: XGameSaveBlobInfoCallback
ms.author: kelcon
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveBlobInfoCallback  

Callback function to retrieve the results of [XGameSaveEnumerateBlobInfo](xgamesaveenumerateblobinfo.md) or [XGameSaveEnumerateBlobInfoByName](xgamesaveenumerateblobinfobyname.md).  

## Syntax  
  
```cpp
bool XGameSaveBlobInfoCallback(  
         const XGameSaveBlobInfo* info,  
         void* context  
)  
```  
  
### Parameters  
  
*info* &nbsp;&nbsp;\_In\_  
Type: [XGameSaveBlobInfo*](../structs/xgamesaveblobinfo.md)  

  
XGameSaveBlobInfo that was enumerated  


*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

Optional object containing relevant information for the function. Usually the calling object is passed in using this parameter.  
  
### Return value
Type: bool
  
Return false to stop the enumeration.  
  
## Remarks  
  
This callback function is passed into [XGameSaveEnumerateBlobInfo](xgamesaveenumerateblobinfo.md) or [XGameSaveEnumerateBlobInfoByName](xgamesaveenumerateblobinfobyname.md). While those functions are called to enumerate the blob information, this callback function is where enumerated blobs are actually acted upon. Use this function to store blob information for active players or to do some work with the retrieved information.
  
## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveEnumerateBlobInfo](xgamesaveenumerateblobinfo.md)  
[XGameSaveEnumerateBlobInfoByName](xgamesaveenumerateblobinfobyname.md)  
[Game saves errors](../../../../system/overviews/game-save/game-saves-errors.md)