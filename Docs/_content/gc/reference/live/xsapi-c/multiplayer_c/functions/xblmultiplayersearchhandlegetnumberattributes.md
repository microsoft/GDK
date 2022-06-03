---
author: joannaleecy
title: XblMultiplayerSearchHandleGetNumberAttributes
description: Get a pointer to an array of attributes attached with the search handle.
kindex: XblMultiplayerSearchHandleGetNumberAttributes
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSearchHandleGetNumberAttributes  

Get a pointer to an array of attributes attached with the search handle.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSearchHandleGetNumberAttributes(  
         XblMultiplayerSearchHandle handle,  
         const XblMultiplayerSessionNumberAttribute** attributes,  
         size_t* attributesCount  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSearchHandle](../handles/xblmultiplayersearchhandle.md)  
  
Handle to the search handle details.  
  
*attributes* &nbsp;&nbsp;\_Out\_  
Type: [XblMultiplayerSessionNumberAttribute**](../structs/xblmultiplayersessionnumberattribute.md)  
  
Passes back a pointer to array of attributes. The memory for the returned pointer will remain valid for the life of the XblMultiplayerSessionHandle object until it is closed.  
  
*attributesCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Passes back the count of attributes in the attributes array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  