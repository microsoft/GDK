---
author: M-Stahl
title: XPersistentLocalStorageSpaceInfo
description: Contains details about the state of Persistent Local Storage (PLS), returned by [XPersistentLocalStorageGetSpaceInfo](../functions/xpersistentlocalstoragegetspaceinfo.md)
kindex: XPersistentLocalStorageSpaceInfo
ms.author: brianhud
ms.topic: reference
security: public
edited: 02/02/2021
applies-to: pc-gdk
---

# XPersistentLocalStorageSpaceInfo

Contains details about the state of Persistent Local Storage (PLS), returned by [XPersistentLocalStorageGetSpaceInfo](../functions/xpersistentlocalstoragegetspaceinfo.md).

<a id="syntaxSection"></a>

## Syntax

```cpp
typedef struct XPersistentLocalStorageSpaceInfo {
    uint64_t availableFreeBytes;
    uint64_t totalFreeBytes;
    uint64_t usedBytes;
    uint64_t totalBytes;
} XPersistentLocalStorageSpaceInfo
```

<a id="membersSection"></a>

### Members

*availableFreeBytes*  
Type: uint64_t

The amount of available storage space, in bytes.

*totalFreeBytes*  
Type: uint64_t

The amount of space left after PLS allocation. You might have to prompt the user to free up space to make these bytes available. For more information, see [XPersistentLocalStoragePromptUserForSpaceAsync](../functions/xpersistentlocalstoragepromptuserforspaceasync.md).

*usedBytes*  
Type: uint64_t

The amount of storage space currently in use, in bytes.

*totalBytes*  
Type: uint64_t

The total amount of storage space (in bytes) that the user can use.

<a id="remarksSection"></a>

## Remarks

If your title uses Growable Persistent Local Storage, then you can call the [XPersistentLocalStorageGetSpaceInfo](../functions/xpersistentlocalstoragegetspaceinfo.md) function to determine how much storage space is available.

When the `XPersistentLocalStorageGetSpaceInfo` function call returns, check the [XPersistentLocalStorageSpaceInfo](xpersistentlocalstoragespaceinfo.md) object for the storage details.

Storage details include the amount of space in use, how much is available to the title, and whether the user should be prompted to free up space.

<a id="requirementsSection"></a>

## Requirements

**Header:** XPersistentLocalStorage.h

**Library:** xgameruntime.lib

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[XPersistentLocalStorage](../xpersistentlocalstorage_members.md)  
[XPersistentLocalStorageGetSpaceInfo](../functions/xpersistentlocalstoragegetspaceinfo.md)  
[XPersistentLocalStoragePromptUserForSpaceAsync](../functions/xpersistentlocalstoragepromptuserforspaceasync.md).  