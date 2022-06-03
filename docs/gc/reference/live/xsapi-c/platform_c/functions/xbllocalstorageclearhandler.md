---
author: joannaleecy
title: XblLocalStorageClearHandler
description: Invoked by XSAPI to request the client to perform a local storage clear operation.
kindex: XblLocalStorageClearHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblLocalStorageClearHandler  

Invoked by XSAPI to request the client to perform a local storage clear operation.  

## Syntax  
  
```cpp
void XblLocalStorageClearHandler(  
         void* context,  
         XblClientOperationHandle operation,  
         XblUserHandle user,  
         const char* key  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Optional pointer to data used by the event handler.  
  
*operation* &nbsp;&nbsp;\_In\_  
Type: [XblClientOperationHandle](../handles/xblclientoperationhandle.md)  
  
The handle for this operation.  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XblUserHandle  
  
The user for which XSAPI is requesting the clear.  
  
*key* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
Identifies the data being read.  
  
  
### Return value  
Type: void
  

  
## Remarks  
  
When the operation is complete, XblLocalStorageClearComplete should be called. Apart from context, all parameters are owned by XSAPI and are guaranteed to be valid until the operation is complete.
  
## Requirements  
  
**Header:** platform_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[platform_c](../platform_c_members.md)  
  
  