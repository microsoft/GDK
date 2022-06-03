---
author: joannaleecy
title: XblMultiplayerGetActivitiesForUsersAsync
description: DEPRECATED - Call [XblMultiplayerGetActivitiesWithPropertiesForUsersAsync](xblmultiplayergetactivitieswithpropertiesforusersasync.md), which also populates `CustomSessionProperties` in the result.<br /> Queries for the current activity for a set of players specified by Xbox user ID.
kindex: XblMultiplayerGetActivitiesForUsersAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerGetActivitiesForUsersAsync  

DEPRECATED - Call [XblMultiplayerGetActivitiesWithPropertiesForUsersAsync](xblmultiplayergetactivitieswithpropertiesforusersasync.md), which also populates `CustomSessionProperties` in the result.<br /> Queries for the current activity for a set of players specified by Xbox user ID.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerGetActivitiesForUsersAsync(  
         XblContextHandle xblContext,  
         const char* scid,  
         const uint64_t* xuids,  
         size_t xuidsCount,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox Live context for the local user.  
  
*scid* &nbsp;&nbsp;\_In\_  
Type: char*  
  
The service configuration identifier (SCID) within which to query for activities. The SCID is case-sensitive, so paste it directly from Partner Center.  
  
*xuids* &nbsp;&nbsp;\_In\_reads\_(xuidsCount)  
Type: uint64_t*  
  
The list of Xbox user IDs to find activities for.  
  
*xuidsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the `xuids` array.  
  
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
  
  