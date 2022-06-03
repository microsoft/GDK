---
author: joannaleecy
title: XblMultiplayerGetActivitiesForSocialGroupResult
description: Gets the result of a call to [XblMultiplayerGetActivitiesForSocialGroupAsync](xblmultiplayergetactivitiesforsocialgroupasync.md).
kindex: XblMultiplayerGetActivitiesForSocialGroupResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerGetActivitiesForSocialGroupResult  

Gets the result of a call to [XblMultiplayerGetActivitiesForSocialGroupAsync](xblmultiplayergetactivitiesforsocialgroupasync.md).  

## Syntax  
  
```cpp
HRESULT XblMultiplayerGetActivitiesForSocialGroupResult(  
         XAsyncBlock* async,  
         size_t activityCount,  
         XblMultiplayerActivityDetails* activities  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The `XAsyncBlock` for this operation.  
  
*activityCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The number of activity objects returned.  
  
*activities* &nbsp;&nbsp;\_Out\_writes\_(activityCount)  
Type: [XblMultiplayerActivityDetails*](../structs/xblmultiplayeractivitydetails.md)  
  
A caller-allocated array for the activity objects returned.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  