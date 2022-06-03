---
author: joannaleecy
title: XblMultiplayerGetActivitiesWithPropertiesForUsersResultSize
description: Gets the size of [XblMultiplayerActivityDetails](../structs/xblmultiplayeractivitydetails.md) objects returned.
kindex: XblMultiplayerGetActivitiesWithPropertiesForUsersResultSize
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerGetActivitiesWithPropertiesForUsersResultSize  

Gets the size of [XblMultiplayerActivityDetails](../structs/xblmultiplayeractivitydetails.md) objects returned.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerGetActivitiesWithPropertiesForUsersResultSize(  
         XAsyncBlock* async,  
         size_t* resultSizeInBytes  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The `XAsyncBlock` for this operation.  
  
*resultSizeInBytes* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Returns the size in bytes required to store the result.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  