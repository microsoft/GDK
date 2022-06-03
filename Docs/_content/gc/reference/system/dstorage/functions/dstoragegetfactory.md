---
author: M-Stahl
title: DStorageGetFactory
description: Returns the static DirectStorage factory object.
kindex: DStorageGetFactory
ms.author: mstahl
ms.topic: reference
edited: 04/28/2020
security: public
---

# DStorageGetFactory  

Returns the static DirectStorage factory object.  

## Syntax  
  
```cpp
HRESULT DStorageGetFactory(  
         REFIID riid,  
         void **ppv  
)  
```  
  
### Parameters  
  
*riid* &nbsp;&nbsp;  
Type: REFIID  
  
Specifies the DirectStorage factory interface, such as `__uuidof(IDStorageFactoryX1)`.  
  
*ppv* &nbsp;&nbsp;  
Type: void \*\* 
  
Pointer that receives a reference to the static DirectStorage factory object.    
  
### Return value
Type: HRESULT
  
Standard HRESULT error code.

## Remarks

This function returns the static DirectStorage factory object ([IDStorageFactoryX1](../interfaces/IDStorageFactoryX1/idstoragefactoryx1.md)). Use the object to create DirectStorage queues, open files for DirectStorage access, and perform global operations. 

For more information, see the "IDStorageFactoryX" and "IDStorageFactoryX1" sections
of [DirectStorage overview](../../../../system/overviews/directstorage/directstorage-overview.md). 

## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage_xs.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageFactoryX](../interfaces/IDStorageFactoryX/idstoragefactoryx.md)  
[IDStorageFactoryX1](../interfaces/IDStorageFactoryX1/idstoragefactoryx1.md)  
[DStorage](../dstorage_members.md)  
  