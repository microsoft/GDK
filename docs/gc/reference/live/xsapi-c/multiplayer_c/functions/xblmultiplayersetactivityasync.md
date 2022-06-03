---
author: joannaleecy
title: XblMultiplayerSetActivityAsync
description: Sets the passed session as the user's current activity, which will be displayed in Xbox dashboard user experiences (e.g. friends and gamercard) as associated with the currently running title. If the session is joinable, it may also be displayed as such in those user experiences.
kindex: XblMultiplayerSetActivityAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSetActivityAsync  

Sets the passed session as the user's current activity, which will be displayed in Xbox dashboard user experiences (e.g. friends and gamercard) as associated with the currently running title. If the session is joinable, it may also be displayed as such in those user experiences.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSetActivityAsync(  
         XblContextHandle xblContext,  
         const XblMultiplayerSessionReference* sessionReference,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*sessionReference* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionReference*](../structs/xblmultiplayersessionreference.md)  
  
An XblMultiplayerSessionReference for the session of the activity.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  