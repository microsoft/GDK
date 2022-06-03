---
author: joannaleecy
title: XblMultiplayerGetActivitiesForSocialGroupAsync
description: >-
  DEPRECATED - Call [XblMultiplayerGetActivitiesWithPropertiesForSocialGroupAsync](xblmultiplayergetactivitieswithpropertiesforsocialgroupasync.md), which also populates `CustomSessionProperties` in the result.<br /> Queries for the current activity for a social group of players associated with a particular "owner" player.
kindex: XblMultiplayerGetActivitiesForSocialGroupAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerGetActivitiesForSocialGroupAsync  

DEPRECATED - Call [XblMultiplayerGetActivitiesWithPropertiesForSocialGroupAsync](xblmultiplayergetactivitieswithpropertiesforsocialgroupasync.md), which also populates `CustomSessionProperties` in the result.<br /> Queries for the current activity for a social group of players associated with a particular "owner" player.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerGetActivitiesForSocialGroupAsync(  
         XblContextHandle xboxLiveContext,  
         const char* scid,  
         uint64_t socialGroupOwnerXuid,  
         const char* socialGroup,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox Live context for the local player.  
  
*scid* &nbsp;&nbsp;\_In\_  
Type: char*  
  
The service configuration identifier (SCID) within which to query for activities. The SCID is case-sensitive, so paste it directly from Partner Center.  
  
*socialGroupOwnerXuid* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The player whose social group will be used for the query.  
  
*socialGroup* &nbsp;&nbsp;\_In\_  
Type: char*  
  
The social group (such as "people" or "favorites") to use to get the list of users.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The `XAsyncBlock` for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
No paging or continuation is available. The Multiplayer service limits the number of items returned to 100.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  