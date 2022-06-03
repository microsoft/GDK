---
author: joannaleecy
title: XblMatchmakingGetMatchTicketDetailsResult
description: Get the result for an XblMatchmakingGetMatchTicketDetailsAsync call.
kindex: XblMatchmakingGetMatchTicketDetailsResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMatchmakingGetMatchTicketDetailsResult  

Get the result for an XblMatchmakingGetMatchTicketDetailsAsync call.  

## Syntax  
  
```cpp
HRESULT XblMatchmakingGetMatchTicketDetailsResult(  
         XAsyncBlock* asyncBlock,  
         size_t bufferSize,  
         void* buffer,  
         XblMatchTicketDetailsResponse** ptrToBuffer,  
         size_t* bufferUsed  
)  
```  
  
### Parameters  
  
*asyncBlock* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
*bufferSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the provided buffer. Use [XblMatchmakingGetMatchTicketDetailsResultSize](xblmatchmakinggetmatchticketdetailsresultsize.md) to get the size required.  
  
*buffer* &nbsp;&nbsp;\_Out\_writes\_bytes\_to\_(bufferSize,*bufferUsed)  
Type: void*  
  
A caller allocated byte buffer to write result into.  
  
*ptrToBuffer* &nbsp;&nbsp;\_Outptr\_  
Type: [XblMatchTicketDetailsResponse**](../structs/xblmatchticketdetailsresponse.md)  
  
Strongly typed pointer that points into buffer. This is a pointer within buffer and should not be freed separately.  
  
*bufferUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  
  
Number of bytes written to the buffer.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** matchmaking_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[matchmaking_c](../matchmaking_c_members.md)  
  
  