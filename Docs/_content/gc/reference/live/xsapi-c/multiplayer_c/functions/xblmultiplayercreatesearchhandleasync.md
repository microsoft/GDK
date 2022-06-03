---
author: joannaleecy
title: XblMultiplayerCreateSearchHandleAsync
description: Create a search handle associated with an existing session. This makes the session queryable.
kindex: XblMultiplayerCreateSearchHandleAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerCreateSearchHandleAsync  

Create a search handle associated with an existing session. This makes the session queryable.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerCreateSearchHandleAsync(  
         XblContextHandle xblContext,  
         const XblMultiplayerSessionReference* sessionRef,  
         const XblMultiplayerSessionTag* tags,  
         size_t tagsCount,  
         const XblMultiplayerSessionNumberAttribute* numberAttributes,  
         size_t numberAttributesCount,  
         const XblMultiplayerSessionStringAttribute* stringAttributes,  
         size_t stringAttributesCount,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*sessionRef* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionReference*](../structs/xblmultiplayersessionreference.md)  
  
Session reference to create a search handle for.  
  
*tags* &nbsp;&nbsp;\_In\_reads\_opt\_(tagsCount)  
Type: [XblMultiplayerSessionTag*](../structs/xblmultiplayersessiontag.md)  
  
Optional set of tags to attach to search handle.  
  
*tagsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Count of tags.  
  
*numberAttributes* &nbsp;&nbsp;\_In\_reads\_opt\_(numberAttributesCount)  
Type: [XblMultiplayerSessionNumberAttribute*](../structs/xblmultiplayersessionnumberattribute.md)  
  
Optional attributes to attach to search handle.  
  
*numberAttributesCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Count of number attributes.  
  
*stringAttributes* &nbsp;&nbsp;\_In\_reads\_opt\_(stringAttributesCount)  
Type: [XblMultiplayerSessionStringAttribute*](../structs/xblmultiplayersessionstringattribute.md)  
  
Optional attributes to attach to search handle.  
  
*stringAttributesCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Count of string attributes.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  