---
author: M-Stahl
title: XGameSaveContainerInfo
description: Information about a XGameSaveContainer.
kindex: XGameSaveContainerInfo
ms.author: kelcon
ms.topic: reference
edited: 01/06/2020
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveContainerInfo  

Information about a XGameSaveContainer.  

## Syntax  
  
```cpp
typedef struct XGameSaveContainerInfo {  
    const char* name;  
    const char* displayName;  
    uint32_t blobCount;  
    uint64_t totalSize;  
    time_t lastModifiedTime;  
    bool needsSync;  
} XGameSaveContainerInfo  
```
  
### Members  
  
*name*  
Type: const char*  
  
Name of the XGameSaveContainer.  
  
*displayName*  
Type: const char*  
  
Display name of the XGameSaveContainer.
  
*blobCount*  
Type: uint32_t  
  
The number of blobs in the XGameSaveContainer. 
  
*totalSize*  
Type: uint64_t  
  
The total size of the XGameSaveContainer.  
  
*lastModifiedTime*  
Type: time_t  
  
Last time the XGameSaveContainer was updated.  
  
*needsSync*  
Type: bool  
  
A boolean value that designates whether there is a difference between the local and server side game save data. 
> [!NOTE]
> This value will only ever be true if you called XGameSaveInitializeProviderAsync with syncOnDemand set to true. Any attempt to read or write data to a container with needsSync true may cause the sync UX to be displayed over the game. 

## Remarks  
  
This struct describes an **XGameSaveContainer** which may simply be referred to as a container. A container holds one or more pieces of data saved from a title with some common theme or purpose. It is equivalent to a folder in a file storage system. Containers are populated with [XGameSaveBlob](xgamesaveblob.md) objects which contain individual pieces of data. The GameSave APIs provide atomic updates at the container level such that for any operation applied to is completed as a total success or not at all. If you attempt to change multiple blobs inside of a container and one blob update fails then every blob in the container will remain unchanged at the end of the operation. You can find a title's containers by using the [XGameSaveEnumerateContainerInfo](../functions/xgamesaveenumeratecontainerinfo.md) or [XGameSaveEnumerateContainerInfoByName](../functions/xgamesaveenumeratecontainerinfobyname.md) function. **XGameSaveContainerInfo** is a parameter for [XGameSaveContainerInfoCallback](../functions/xgamesavecontainerinfocallback.md).
  
## Requirements  
  
**Header:** XGameSave.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveEnumerateContainerInfo](../functions/xgamesaveenumeratecontainerinfo.md)  
[XGameSaveEnumerateContainerInfoByName](../functions/xgamesaveenumeratecontainerinfobyname.md)  
[XGameSaveContainerInfoCallback](../functions/xgamesavecontainerinfocallback.md)  

  