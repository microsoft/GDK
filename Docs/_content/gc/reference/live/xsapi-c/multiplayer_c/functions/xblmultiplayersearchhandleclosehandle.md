---
author: joannaleecy
title: XblMultiplayerSearchHandleCloseHandle
description: Decrements the reference count to a local search handle details object.
kindex: XblMultiplayerSearchHandleCloseHandle
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSearchHandleCloseHandle  

Decrements the reference count to a local search handle details object.  

## Syntax  
  
```cpp
void XblMultiplayerSearchHandleCloseHandle(  
         XblMultiplayerSearchHandle handle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSearchHandle](../handles/xblmultiplayersearchhandle.md)  
  
Handle to the search handle details.  
  
  
### Return value  
Type: void
  

  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  