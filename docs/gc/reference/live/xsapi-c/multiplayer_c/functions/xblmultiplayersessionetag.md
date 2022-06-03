---
author: joannaleecy
title: XblMultiplayerSessionEtag
description: The ETag returned with this session.
kindex: XblMultiplayerSessionEtag
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSessionEtag  

The ETag returned with this session.  

## Syntax  
  
```cpp
const XblMultiplayerSessionEtag(  
         XblMultiplayerSessionHandle handle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
  
### Return value  
Type: const
  
The ETag. The memory for the returned pointer will remain valid for the life of the XblMultiplayerSessionHandle object until it is closed.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  