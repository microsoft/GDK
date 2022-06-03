---
author: joannaleecy
title: XblMultiplayerGetActivitiesForUsersResultCount
description: Gets the number of [XblMultiplayerActivityDetails](../structs/xblmultiplayeractivitydetails.md) objects returned.
kindex: XblMultiplayerGetActivitiesForUsersResultCount
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerGetActivitiesForUsersResultCount  

Gets the number of [XblMultiplayerActivityDetails](../structs/xblmultiplayeractivitydetails.md) objects returned.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerGetActivitiesForUsersResultCount(  
         XAsyncBlock* async,  
         size_t* activityCount  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The `XAsyncBlock` for this operation.  
  
*activityCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
The number of activity objects returned.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  