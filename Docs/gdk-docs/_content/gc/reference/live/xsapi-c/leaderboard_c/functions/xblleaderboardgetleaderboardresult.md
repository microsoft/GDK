---
author: joannaleecy
title: XblLeaderboardGetLeaderboardResult
description: Get the result for an XblLeaderboardGetLeaderboardAsync call.
kindex: XblLeaderboardGetLeaderboardResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblLeaderboardGetLeaderboardResult  

Get the result for an XblLeaderboardGetLeaderboardAsync call.  

## Syntax  
  
```cpp
HRESULT XblLeaderboardGetLeaderboardResult(  
         XAsyncBlock* async,  
         size_t bufferSize,  
         void* buffer,  
         XblLeaderboardResult** ptrToBuffer,  
         size_t* bufferUsed  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
*bufferSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the provided buffer. Use [XblLeaderboardGetLeaderboardResultSize](xblleaderboardgetleaderboardresultsize.md) to get the size required.  
  
*buffer* &nbsp;&nbsp;\_Out\_writes\_bytes\_to\_(bufferSize,*bufferUsed)  
Type: void*  
  
A caller allocated byte buffer to write result into.  
  
*ptrToBuffer* &nbsp;&nbsp;\_Outptr\_  
Type: [XblLeaderboardResult**](../structs/xblleaderboardresult.md)  
  
Strongly typed pointer that points into buffer. Do not free this as its lifecycle is tied to buffer.  
  
*bufferUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  
  
Number of bytes written to the buffer.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** leaderboard_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[leaderboard_c](../leaderboard_c_members.md)  
  
  