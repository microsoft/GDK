---
author: M-Stahl
title: XGameSaveFilesGetRemainingQuota
description: Returns the amount of data available to store save data using the XGameSaveFiles API.
kindex: XGameSaveFilesGetRemainingQuota
ms.author: kelcon
ms.topic: reference
edited: 00/00/0000
security: public
applies-to: pc-gdk
quality: good
---

# XGameSaveFilesGetRemainingQuota  

Returns the amount of data available to store save data using the XGameSaveFiles API.  

## Syntax  

```cpp
HRESULT XGameSaveFilesGetRemainingQuota(
  XUserHandle userContext,
  const char * configurationId,
  int64_t * remainingQuota
)
```

### Parameters  

`userContext`  
Type: _In_ XUserHandle  

Handle to an Xbox Live User.  

`configurationId`  
Type: _In_z_ const char *  

Service configuration ID (SCID).  

`remainingQuota`  
Type: _Out_ int64_t *  

Amount of data available to be used as game save storage.  

### Return value  

Type: HRESULT  

Function result.  

## Requirements  

**Header:** XGameSaveFiles.h  

## See also  

[XGameSaveFiles members](../xgamesavefiles_members.md)  
[Win32 file IO with Game Saves (XGameSaveFiles)](../../../../system/overviews/game-save/game-save-win32.md)

