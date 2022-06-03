---
author: joannaleecy
title: XblMultiplayerGetActivitiesWithPropertiesForSocialGroupResultSize
description: Gets the size of [XblMultiplayerActivityDetails](../structs/xblmultiplayeractivitydetails.md) objects returned.
kindex: XblMultiplayerGetActivitiesWithPropertiesForSocialGroupResultSize
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerGetActivitiesWithPropertiesForSocialGroupResultSize  

Gets the size of [XblMultiplayerActivityDetails](../structs/xblmultiplayeractivitydetails.md) objects returned.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerGetActivitiesWithPropertiesForSocialGroupResultSize(  
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
  
The size in bytes required to store the multiplayer activity details.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  