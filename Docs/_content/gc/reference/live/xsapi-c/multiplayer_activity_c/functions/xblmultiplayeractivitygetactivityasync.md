---
author: joannaleecy
title: XblMultiplayerActivityGetActivityAsync
description: Get the multiplayer activity for a set of users. You can query at most 30 users with each call.
kindex: XblMultiplayerActivityGetActivityAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerActivityGetActivityAsync  

Get the multiplayer activity for a set of users. You can query at most 30 users with each call.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerActivityGetActivityAsync(  
         XblContextHandle xblContext,  
         const uint64_t* xuids,  
         size_t xuidsCount,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox Live context for the local user.  
  
*xuids* &nbsp;&nbsp;\_In\_reads\_(xuidsCount)  
Type: uint64_t*  
  
List of Xbox user IDs for whom to get multiplayer activity.  
  
*xuidsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Size of the `xuids` array.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The `XAsyncBlock` for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
To get the result, call [XblMultiplayerActivityGetActivityResultSize](xblmultiplayeractivitygetactivityresultsize.md) and [XblMultiplayerActivityGetActivityResult](xblmultiplayeractivitygetactivityresult.md) inside the `XAsyncBlock` callback or after the async operation is complete. <br /><br /> To see how this function is used, see "Getting activities" in the [Activities](../../../../../live/features/multiplayer/mpa/how-to/live-mpa-client-how-to.md#activities) section of [Example code for Multiplayer Activity](../../../../../live/features/multiplayer/mpa/how-to/live-mpa-client-how-to.md). <br /><br /> For more information about multiplayer activities, see [Activities](../../../../../live/features/multiplayer/mpa/concepts/live-mpa-activities.md).
  
## Requirements  
  
**Header:** multiplayer_activity_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_activity_c](../multiplayer_activity_c_members.md)  
  
  