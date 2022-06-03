---
author: joannaleecy
title: XblContextDuplicateHandle
description: Duplicates the XblContextHandle.
kindex: XblContextDuplicateHandle
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblContextDuplicateHandle  

Duplicates the XblContextHandle.  

## Syntax  
  
```cpp
HRESULT XblContextDuplicateHandle(  
         XblContextHandle xboxLiveContextHandle,  
         XblContextHandle* duplicatedHandle  
)  
```  
  
### Parameters  
  
*xboxLiveContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
The Xbox Live context handle.  
  
*duplicatedHandle* &nbsp;&nbsp;\_Out\_  
Type: [XblContextHandle*](../../types_c/handles/xblcontexthandle.md)  
  
Passes back the duplicated handle.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Use this method rather than creating a new context with the same user if the XblContextHandle is needed by multiple threads.
  
## Requirements  
  
**Header:** xbox_live_context_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[xbox_live_context_c](../xbox_live_context_c_members.md)  
  
  