---
author: M-Stahl
title: XGameSaveFilesGetFolderWithUiAsync
description: Returns a folder that can be used to contain directories and files for storage.
kindex: XGameSaveFilesGetFolderWithUiAsync
ms.author: kelcon
ms.topic: reference
edited: 00/00/0000
security: public
applies-to: pc-gdk
quality: good
---

# XGameSaveFilesGetFolderWithUiAsync  

Returns a folder that can be used to contain directories and files for storage.  

## Syntax  

```cpp
HRESULT XGameSaveFilesGetFolderWithUiAsync(
  XUserHandle requestingUser,
  const char * configurationId,
  XAsyncBlock * async
)
```

### Parameters  

`requestingUser`  
Type: _In_ XUserHandle  

Handle to an Xbox Live user.  

`configurationId`  
Type: _In_z_ const char *  

Service configuration ID (SCID).  

`async`  
Type: _In_ XAsyncBlock *  

Contains the information for the Async call.  

### Return value  

Type: HRESULT  
  
Function result.

### Remarks

Games cannot mix the usage of XGameSaveFiles with the usage of XGameSave. Games much choose which cloud save system
they want to use. If the game is using XGameSaveFiles and later calls XGameSaveInitializeProvider, it will error out 
with E_GS_PROVIDER_MISMATCH. Equally, if the game was using XGameSave and later calls XGameSaveFilesGetFolderWithUiAsync,
that will also error out with E_GS_PROVIDER_MISMATCH.

## Requirements  

**Header:** XGameSaveFiles.h  

## See also  

[XGameSaveFiles members](../xgamesavefiles_members.md)  
[Win32 file IO with Game Saves (XGameSaveFiles)](../../../../system/overviews/game-save/game-save-win32.md)

