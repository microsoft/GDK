---
author: joannaleecy
title: XblContextCreateHandle
description: Creates an XblContextHandle used to access Xbox Live services.
kindex: XblContextCreateHandle
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblContextCreateHandle  

Creates an XblContextHandle used to access Xbox Live services.  

## Syntax  
  
```cpp
HRESULT XblContextCreateHandle(  
         XblUserHandle user,  
         XblContextHandle* context  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XblUserHandle  
  
The user associated with this Xbox Live context.  
  
*context* &nbsp;&nbsp;\_Out\_  
Type: [XblContextHandle*](../../types_c/handles/xblcontexthandle.md)  
  
Passes back the Xbox Live context handle.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** xbox_live_context_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[xbox_live_context_c](../xbox_live_context_c_members.md)  
  
  