---
author: M-Stahl
title: GetHandle
description: Gets a Win32 handle to the file represented by the object.
kindex: GetHandle
ms.author: mstahl
ms.topic: reference
edited: 04/24/2020
security: public
---

# IDStorageFileX::GetHandle  

Gets a Win32 handle to the file represented by the object.  

## Syntax  
  
```cpp
HANDLE GetHandle(
)
```  
  
### Parameters  
  
This method has no parameters.
  
### Return value  
Type: HANDLE

## Remarks

The handle is opened with `GENERIC_READ` permissions and `FILE_SHARE_READ` sharing mode. It can be used for querying information about the file, such as its size.  

Call `CloseHandle` to close the handle when it's no longer needed.

For more information, see the "IDStorageFileX" section in [DirectStorage overview](../../../../../../system/overviews/directstorage/directstorage-overview.md).
  
## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage_xs.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageFactoryX::OpenFile](../../IDStorageFactoryX/methods/idstoragefactoryx_openfile.md)  
[IDStorageFileX](../idstoragefilex.md)  
  