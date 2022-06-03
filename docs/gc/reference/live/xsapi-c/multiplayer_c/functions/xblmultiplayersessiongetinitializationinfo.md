---
author: joannaleecy
title: XblMultiplayerSessionGetInitializationInfo
description: Get the info about session initialization.
kindex: XblMultiplayerSessionGetInitializationInfo
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionGetInitializationInfo  

Get the info about session initialization.  

## Syntax  
  
```cpp
const XblMultiplayerSessionGetInitializationInfo(  
         XblMultiplayerSessionHandle handle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
  
### Return value  
Type: const
  
The initialization info used to create the session.
  
## Remarks  
  
If the session is not doing member initialization, nullptr will be returned.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  