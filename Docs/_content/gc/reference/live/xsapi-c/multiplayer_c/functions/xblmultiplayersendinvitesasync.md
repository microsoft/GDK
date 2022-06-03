---
author: joannaleecy
title: XblMultiplayerSendInvitesAsync
description: Invites the specified users to a session. This will result in a notification being shown to each invited user using standard invite text. If a user accepts that notification the title will be activated.
kindex: XblMultiplayerSendInvitesAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSendInvitesAsync  

Invites the specified users to a session. This will result in a notification being shown to each invited user using standard invite text. If a user accepts that notification the title will be activated.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSendInvitesAsync(  
         XblContextHandle xblContext,  
         const XblMultiplayerSessionReference* sessionReference,  
         const uint64_t* xuids,  
         size_t xuidsCount,  
         uint32_t titleId,  
         const char* contextStringId,  
         const char* customActivationContext,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*sessionReference* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionReference*](../structs/xblmultiplayersessionreference.md)  
  
An XblMultiplayerSessionReference object representing the session the target users will be invited to.  
  
*xuids* &nbsp;&nbsp;\_In\_  
Type: uint64_t*  
  
The list of xbox user IDs who will be invited.  
  
*xuidsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Size of the xuids array.  
  
*titleId* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The ID of the title that the invited user will activate in order to join the session.  
  
*contextStringId* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  
  
The custom context string ID. This string ID is defined during Xbox Live ingestion to identify the invitation text that is additional to the standard invitation text. The ID string must be prefixed with " /// ". Pass nullptr if you don't want a custom string added to the invite.  
  
*customActivationContext* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  
  
The activation context string. A game defined string that is passed to the invited game client and interpreted as desired. (Optional)  
  
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
  
  