---
author: M-Stahl
title: XGameSaveFilesGetFolderWithUiResult
description: Returns a folder that can be used to contain directories and files for storage in the cloud.
kindex: XGameSaveFilesGetFolderWithUiResult
ms.author: kelcon
ms.topic: reference
edited: 00/00/0000
security: public
applies-to: pc-gdk
quality: good
---

# XGameSaveFilesGetFolderWithUiResult  

Returns a folder that can be used to contain directories and files for storage in the cloud.  

## Syntax  

```cpp
HRESULT XGameSaveFilesGetFolderWithUiResult(
  XAsyncBlock * async,
  size_t folderSize,
  char * folderResult
)
```

### Parameters  

`async`  
Type: _In_ XAsyncBlock *  

Contains the information for the Async call.  

`folderSize`  
Type: _In_ size_t  

Size of the folder path, in bytes.  

`folderResult`  
Type: _Out_writes_bytes_(folderSize) char *  

Folder to contain directories and files for storage in the cloud.  

### Return value  

Type: HRESULT  
  
Function result.  
  
## Remarks  

Titles are expected to create directories and files in the returned folder. Any files that are not in a sub-path (i.e. container) will be ignored as all items are supposed to be within a container to store in the cloud.  

## Requirements  

**Header:** XGameSaveFiles.h  

## See also  

[XGameSaveFiles members](../xgamesavefiles_members.md)  
[Win32 file IO with Game Saves (XGameSaveFiles)](../../../../system/overviews/game-save/game-save-win32.md)

