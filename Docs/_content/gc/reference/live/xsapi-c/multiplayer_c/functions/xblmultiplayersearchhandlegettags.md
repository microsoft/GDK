---
author: joannaleecy
title: XblMultiplayerSearchHandleGetTags
description: Get a pointer to an array of tags attached with the search handle.
kindex: XblMultiplayerSearchHandleGetTags
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSearchHandleGetTags  

Get a pointer to an array of tags attached with the search handle.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSearchHandleGetTags(  
         XblMultiplayerSearchHandle handle,  
         const XblMultiplayerSessionTag** tags,  
         size_t* tagsCount  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSearchHandle](../handles/xblmultiplayersearchhandle.md)  
  
Handle to the search handle details.  
  
*tags* &nbsp;&nbsp;\_Out\_  
Type: [XblMultiplayerSessionTag**](../structs/xblmultiplayersessiontag.md)  
  
Passes back a pointer to array of tags. The memory for the pointer will remain valid for the life of the XblMultiplayerSessionHandle object until it is closed.  
  
*tagsCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Passes back the count of tags in the array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  