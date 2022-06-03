---
author: M-Stahl
title: OpenFile
description: Opens a file for DirectStorage access.
kindex: OpenFile
ms.author: mstahl
ms.topic: reference
edited: 04/28/2020
security: public
---

# IDStorageFactoryX::OpenFile  

Opens a file for DirectStorage access. 

## Syntax  
  
```cpp
HRESULT OpenFile(  
         const WCHAR *path,  
         REFIID riid,  
         void **ppv  
)  
```  
  
### Parameters  
  
*path* &nbsp;&nbsp;\_In\_z\_  
Type: WCHAR \*  
  
Path of the file to be opened.    
  
*riid*  
Type: REFIID  
  
Specifies the DirectStorage file interface, such as `__uuidof(IDStorageFileX)`.  
  
*ppv* &nbsp;&nbsp;\_COM\_Outptr\_  
Type: void \*\*  
  
Receives an object representing the opened file.  
  
### Return value  
Type: HRESULT
  
Standard HRESULT error code.
  
## Remarks

The specified file must be stored on an NVM Express (NVMe) device that is supported by DirectStorage. 

A file is implicitly closed when the last reference to the matching `IDStorageFileX` object is released. To explicitly close a file, call [IDStorageFileX::Close](../../IDStorageFileX/methods/idstoragefilex_close.md). 

For more information, see the "IDStorageFileX" section in [DirectStorage overview](../../../../../../system/overviews/directstorage/directstorage-overview.md). 
  
## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage_xs.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageFactoryX](../idstoragefactoryx.md)  
[DStorage](../../../dstorage_members.md)  
  