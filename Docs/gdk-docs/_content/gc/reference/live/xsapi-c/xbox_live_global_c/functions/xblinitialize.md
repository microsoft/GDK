---
author: joannaleecy
title: XblInitialize
description: Initializes the library instance.
kindex: XblInitialize
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblInitialize  

Initializes the library instance.  

## Syntax  
  
```cpp
HRESULT XblInitialize(  
         const XblInitArgs* args  
)  
```  
  
### Parameters  
  
*args* &nbsp;&nbsp;\_In\_  
Type: [XblInitArgs*](../structs/xblinitargs.md)  
  
Platform-specific args for XblInitialize.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This must be called before any other Xbl* method, except for XblMemSetFunctions() and XblMemGetFunctions(). Should have a corresponding call to XblCleanup().
  
## Requirements  
  
**Header:** xbox_live_global_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[xbox_live_global_c](../xbox_live_global_c_members.md)  
  
  