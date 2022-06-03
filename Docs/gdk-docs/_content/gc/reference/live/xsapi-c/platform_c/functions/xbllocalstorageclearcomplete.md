---
author: joannaleecy
title: XblLocalStorageClearComplete
description: Completes a local storage clear operation. [XblLocalStorageClearHandler](xbllocalstorageclearhandler.md)
kindex: XblLocalStorageClearComplete
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblLocalStorageClearComplete  

Completes a local storage clear operation. [XblLocalStorageClearHandler](xbllocalstorageclearhandler.md)  

## Syntax  
  
```cpp
HRESULT XblLocalStorageClearComplete(  
         XblClientOperationHandle operation,  
         XblClientOperationResult result  
)  
```  
  
### Parameters  
  
*operation* &nbsp;&nbsp;\_In\_  
Type: [XblClientOperationHandle](../handles/xblclientoperationhandle.md)  
  
The handle for this operation.  
  
*result* &nbsp;&nbsp;\_In\_  
Type: [XblClientOperationResult](../enums/xblclientoperationresult.md)  
  
The result of the operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Should only be called by clients after completing (or failing to complete) a requested clear operation. If the requested key cannot be found, the operation should be completed with XblClientOperationResult::Success.
  
## Requirements  
  
**Header:** platform_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[platform_c](../platform_c_members.md)  
  
  