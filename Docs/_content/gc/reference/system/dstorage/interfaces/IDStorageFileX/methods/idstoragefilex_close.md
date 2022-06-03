---
author: M-Stahl
title: Close
description: Closes the file.
kindex: Close
ms.author: mstahl
ms.topic: reference
edited: 04/24/2020
security: public
---

# IDStorageFileX::Close  

Closes the file.  

## Syntax  
  
```cpp
void Close(  
)  
```  
  
### Parameters  
  
This method has no parameters.
  
### Return value  
Type: void

## Remarks

This method explicitly closes the file, regardless of the reference count on the matching `IDStorageFileX` object. 

A file is implicitly closed when the last reference to the matching `IDStorageFileX` object is released.

Closing a file explicitly or implicitly will block until all outstanding I/O operations are complete. 

After an `IDStorageFileX` object is closed, it can no longer be used in DirectStorage requests. 

For more information, see the "IDStorageFileX" section in [DirectStorage overview](../../../../../../system/overviews/directstorage/directstorage-overview.md).
  
## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage_xs.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageFactoryX::OpenFile](../../IDStorageFactoryX/methods/idstoragefactoryx_openfile.md)  
[IDStorageFileX](../idstoragefilex.md)  
  