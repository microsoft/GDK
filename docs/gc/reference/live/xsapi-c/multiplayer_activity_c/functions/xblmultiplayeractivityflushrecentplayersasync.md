---
author: joannaleecy
title: XblMultiplayerActivityFlushRecentPlayersAsync
description: Immediately writes any pending recent-players updates to Xbox Live.
kindex: XblMultiplayerActivityFlushRecentPlayersAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerActivityFlushRecentPlayersAsync  

Immediately writes any pending recent-players updates to Xbox Live.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerActivityFlushRecentPlayersAsync(  
         XblContextHandle xblContext,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox Live context for the local user.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The `XAsyncBlock` for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Calling this API is optional; updates are periodically uploaded from a background task queue. <br /><br /> When this API is used, the upload happens on the task queue supplied in this call. <br /><br /> To get the result of the asynchronous operation, call [XAsyncGetStatus](../../../../system/xasync/functions/xasyncgetstatus.md) inside the `XAsyncBlock` callback or after `XAsyncBlock` is complete. <br /><br /> To see how this enumeration is used, see the [Recent players](../../../../../live/features/multiplayer/mpa/how-to/live-mpa-client-how-to.md#recent-players) section of [Example code for Multiplayer Activity](../../../../../live/features/multiplayer/mpa/how-to/live-mpa-client-how-to.md).
  
## Requirements  
  
**Header:** multiplayer_activity_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_activity_c](../multiplayer_activity_c_members.md)  
  
  