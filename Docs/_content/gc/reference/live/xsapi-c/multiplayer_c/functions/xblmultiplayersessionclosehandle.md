---
author: joannaleecy
title: XblMultiplayerSessionCloseHandle
description: Decrements the reference count to a local session object.
kindex: XblMultiplayerSessionCloseHandle
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSessionCloseHandle  

Decrements the reference count to a local session object.  

## Syntax  
  
```cpp
void XblMultiplayerSessionCloseHandle(  
         XblMultiplayerSessionHandle handle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
  
### Return value  
Type: void
  

  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  