---
author: joannaleecy
title: XblMultiplayerSessionConstantsSetMaxMembersInSession
description: Sets the maximum number of members in this session.
kindex: XblMultiplayerSessionConstantsSetMaxMembersInSession
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSessionConstantsSetMaxMembersInSession  

Sets the maximum number of members in this session.  

## Syntax  
  
```cpp
void XblMultiplayerSessionConstantsSetMaxMembersInSession(  
         XblMultiplayerSessionHandle handle,  
         uint32_t maxMembersInSession  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*maxMembersInSession* &nbsp;&nbsp;  
Type: uint32_t  
  
Value to set for max members.  
  
  
### Return value  
Type: void
  

  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  