---
author: joannaleecy
title: XblMultiplayerSearchHandleGetCreationTime
description: Get the creation time of the search handle.
kindex: XblMultiplayerSearchHandleGetCreationTime
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSearchHandleGetCreationTime  

Get the creation time of the search handle.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSearchHandleGetCreationTime(  
         XblMultiplayerSearchHandle handle,  
         time_t* creationTime  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSearchHandle](../handles/xblmultiplayersearchhandle.md)  
  
Handle to the search handle details.  
  
*creationTime* &nbsp;&nbsp;\_Out\_  
Type: time_t*  
  
Passes back the time the serach handle was created in MPSD (not the local object).  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  