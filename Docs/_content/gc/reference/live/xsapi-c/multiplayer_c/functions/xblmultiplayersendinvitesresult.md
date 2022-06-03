---
author: joannaleecy
title: XblMultiplayerSendInvitesResult
description: Invites the specified users to a session. This will result in a notification being shown to each invited user using standard invite text. If a user accepts that notification the title will be activated.
kindex: XblMultiplayerSendInvitesResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSendInvitesResult  

Invites the specified users to a session. This will result in a notification being shown to each invited user using standard invite text. If a user accepts that notification the title will be activated.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSendInvitesResult(  
         XAsyncBlock* async,  
         size_t handlesCount,  
         XblMultiplayerInviteHandle* handles  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
*handlesCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The number of handles in the handles array. Size should be equal to the number of invites requested.  
  
*handles* &nbsp;&nbsp;\_Out\_writes\_(handlesCount)  
Type: [XblMultiplayerInviteHandle*](../structs/xblmultiplayerinvitehandle.md)  
  
A caller allocated array to pass back the invite handle results. The handle ID strings corresponding to the invites that have been sent.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  