---
author: joannaleecy
title: XblMultiplayerSearchHandleGetSessionClosed
description: Get whether or not the session associated with the search handle is temporaraly closed for joining.
kindex: XblMultiplayerSearchHandleGetSessionClosed
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSearchHandleGetSessionClosed  

Get whether or not the session associated with the search handle is temporaraly closed for joining.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSearchHandleGetSessionClosed(  
         XblMultiplayerSearchHandle handle,  
         bool* closed  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSearchHandle](../handles/xblmultiplayersearchhandle.md)  
  
Handle to the search handle details.  
  
*closed* &nbsp;&nbsp;\_Out\_  
Type: bool*  
  
Passes back whether the session is closed or not.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  