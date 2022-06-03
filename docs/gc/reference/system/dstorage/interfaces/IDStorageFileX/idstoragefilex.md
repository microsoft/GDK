---
author: M-Stahl
title: IDStorageFileX (Interface contents)
description: Represents a file to be accessed by DirectStorage.
kindex: IDStorageFileX
ms.author: mstahl
ms.topic: reference
edited: 04/24/2020
security: public
---

# IDStorageFileX  

Represents a file to be accessed by DirectStorage.  

## Syntax  
  
```cpp  
class IDStorageFileX : public IUnknown  
```  
  
  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [Close](methods/idstoragefilex_close.md) | Closes the file. |  
| [GetHandle](methods/idstoragefilex_gethandle.md) | Gets a Win32 handle to the file represented by the object. |  

  
## Remarks  

To create an object that implements the `IDStorageFileX` interface, call the [IDStorageFactoryX::OpenFile](../IDStorageFactoryX/methods/idstoragefactoryx_openfile.md) method. This is analogous to using `CreateFile` in the Win32 API interfaces.  

For more information, see the "API overview" section in [DirectStorage overview](../../../../../system/overviews/directstorage/directstorage-overview.md).

## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageFactoryX::OpenFile](../IDStorageFactoryX/methods/idstoragefactoryx_openfile.md)  
[DStorage](../../dstorage_members.md)  
  