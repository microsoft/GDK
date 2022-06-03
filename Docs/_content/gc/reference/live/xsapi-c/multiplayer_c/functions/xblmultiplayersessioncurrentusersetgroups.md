---
author: joannaleecy
title: XblMultiplayerSessionCurrentUserSetGroups
description: Sets a string vector of group names for the current user indicating which groups that user was part of during a multiplayer session.
kindex: XblMultiplayerSessionCurrentUserSetGroups
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSessionCurrentUserSetGroups  

Sets a string vector of group names for the current user indicating which groups that user was part of during a multiplayer session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionCurrentUserSetGroups(  
         XblMultiplayerSessionHandle handle,  
         const char** groups,  
         size_t groupsCount  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*groups* &nbsp;&nbsp;\_In\_reads\_(groupsCount)  
Type: char**  
  
Array of group names.  
  
*groupsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Size of the groups array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  