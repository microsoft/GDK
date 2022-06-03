---
author: joannaleecy
title: XblLocalStorageWriteComplete
description: Completes a local storage write operation. [XblLocalStorageWriteHandler](xbllocalstoragewritehandler.md)
kindex: XblLocalStorageWriteComplete
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblLocalStorageWriteComplete  

Completes a local storage write operation. [XblLocalStorageWriteHandler](xbllocalstoragewritehandler.md)  

## Syntax  
  
```cpp
HRESULT XblLocalStorageWriteComplete(  
         XblClientOperationHandle operation,  
         XblClientOperationResult result,  
         size_t dataSize  
)  
```  
  
### Parameters  
  
*operation* &nbsp;&nbsp;\_In\_  
Type: [XblClientOperationHandle](../handles/xblclientoperationhandle.md)  
  
The handle for this operation.  
  
*result* &nbsp;&nbsp;\_In\_  
Type: [XblClientOperationResult](../enums/xblclientoperationresult.md)  
  
The result of the operation.  
  
*dataSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The new size (in bytes) of the data associated with the requested key.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Should only be called by clients after completing (or failing to complete) a requested write operation.
  
## Requirements  
  
**Header:** platform_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[platform_c](../platform_c_members.md)  
  
  