---
author: joannaleecy
title: XblMultiplayerActivityGetActivityResult
description: Gets the results for a successful get activity call.
kindex: XblMultiplayerActivityGetActivityResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerActivityGetActivityResult  

Gets the results for a successful get activity call.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerActivityGetActivityResult(  
         XAsyncBlock* async,  
         size_t bufferSize,  
         void* buffer,  
         XblMultiplayerActivityInfo** ptrToBufferResults,  
         size_t* resultCount,  
         size_t* bufferUsed  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The `XAsyncBlock` for this operation.  
  
*bufferSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the result buffer. Use [XblMultiplayerActivityGetActivityResultSize](xblmultiplayeractivitygetactivityresultsize.md) to get the required buffer size.  
  
*buffer* &nbsp;&nbsp;\_Out\_writes\_bytes\_to\_(bufferSize,*bufferUsed)  
Type: void*  
  
A caller-allocated byte buffer that receives the result.  
  
*ptrToBufferResults* &nbsp;&nbsp;\_Outptr\_  
Type: [XblMultiplayerActivityInfo**](../structs/xblmultiplayeractivityinfo.md)  
  
Strongly typed array of [XblMultiplayerActivityInfo](../structs/xblmultiplayeractivityinfo.md) that points into `buffer`. Do not free this array. Its lifecycle is tied to `buffer`.  
  
*resultCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
The number of entries in the `ptrToBufferResults` array.  
  
*bufferUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  
  
The number of bytes in `buffer` that were used.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
To get the size of the buffer that you need to store the results, call the [XblMultiplayerActivityGetActivityResultSize](xblmultiplayeractivitygetactivityresultsize.md) function. <br /><br /> To see how this function is used, see "Getting activities" in the [Activities](../../../../../live/features/multiplayer/mpa/how-to/live-mpa-client-how-to.md#activities) section of [Example code for Multiplayer Activity](../../../../../live/features/multiplayer/mpa/how-to/live-mpa-client-how-to.md). <br /><br /> For more information about multiplayer activities, see [Activities](../../../../../live/features/multiplayer/mpa/concepts/live-mpa-activities.md).
  
## Requirements  
  
**Header:** multiplayer_activity_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_activity_c](../multiplayer_activity_c_members.md)  
  
  