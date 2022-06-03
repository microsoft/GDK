---
author: joannaleecy
title: XblLocalStorageSetHandlers
description: Sets the storage handlers.
kindex: XblLocalStorageSetHandlers
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblLocalStorageSetHandlers  

Sets the storage handlers.  

## Syntax  
  
```cpp
HRESULT XblLocalStorageSetHandlers(  
         XTaskQueueHandle queue,  
         XblLocalStorageWriteHandler writeHandler,  
         XblLocalStorageReadHandler readHandler,  
         XblLocalStorageClearHandler clearHandler,  
         void* context  
)  
```  
  
### Parameters  
  
*queue* &nbsp;&nbsp;\_In\_opt\_  
Type: XTaskQueueHandle  
  
The async queue the callbacks should be invoked on.  
  
*writeHandler* &nbsp;&nbsp;\_In\_  
Type: XblLocalStorageWriteHandler  
  
Handler to be invoked when XSAPI needs to write to local storage.  
  
*readHandler* &nbsp;&nbsp;\_In\_  
Type: XblLocalStorageReadHandler  
  
Handler to be invoked when XSAPI needs to read from local storage.  
  
*clearHandler* &nbsp;&nbsp;\_In\_  
Type: XblLocalStorageClearHandler  
  
Handler to be invoked when XSAPI needs to clear local storage.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Client context to be passed back to the handlers.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Must be called before XblInitialize and all three handlers must be set together.
  
## Requirements  
  
**Header:** platform_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[platform_c](../platform_c_members.md)  
  
  