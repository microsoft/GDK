---
author: joannaleecy
title: XblMultiplayerGetActivitiesWithPropertiesForUsersResult
description: Gets the result of a call to [XblMultiplayerGetActivitiesWithPropertiesForUsersAsync](xblmultiplayergetactivitieswithpropertiesforusersasync.md).
kindex: XblMultiplayerGetActivitiesWithPropertiesForUsersResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerGetActivitiesWithPropertiesForUsersResult  

Gets the result of a call to [XblMultiplayerGetActivitiesWithPropertiesForUsersAsync](xblmultiplayergetactivitieswithpropertiesforusersasync.md).  

## Syntax  
  
```cpp
HRESULT XblMultiplayerGetActivitiesWithPropertiesForUsersResult(  
         XAsyncBlock* async,  
         size_t bufferSize,  
         void* buffer,  
         XblMultiplayerActivityDetails** ptrToBuffer,  
         size_t* ptrToBufferCount,  
         size_t* bufferUsed  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The `XAsyncBlock` for this operation.  
  
*bufferSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the provided `buffer`.  
  
*buffer* &nbsp;&nbsp;\_Out\_writes\_bytes\_to\_(bufferSize,*bufferUsed)  
Type: void*  
  
A caller-allocated byte buffer to write results into.  
  
*ptrToBuffer* &nbsp;&nbsp;\_Outptr\_  
Type: [XblMultiplayerActivityDetails**](../structs/xblmultiplayeractivitydetails.md)  
  
Strongly typed pointer to `buffer`. Do not free; its lifecycle is tied to `buffer`.  
  
*ptrToBufferCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Number of entries in `buffer`.  
  
*bufferUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  
  
Number of bytes actually written to `buffer`.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  