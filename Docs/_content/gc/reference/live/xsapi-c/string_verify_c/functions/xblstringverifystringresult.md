---
author: joannaleecy
title: XblStringVerifyStringResult
description: Get the result for an XblStringVerifyStringAsync call.
kindex: XblStringVerifyStringResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblStringVerifyStringResult  

Get the result for an XblStringVerifyStringAsync call.  

## Syntax  
  
```cpp
HRESULT XblStringVerifyStringResult(  
         XAsyncBlock* asyncBlock,  
         size_t bufferSize,  
         void* buffer,  
         XblVerifyStringResult** ptrToBuffer,  
         size_t* bufferUsed  
)  
```  
  
### Parameters  
  
*asyncBlock* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
*bufferSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the provided buffer. Use [XblStringVerifyStringResultSize](xblstringverifystringresultsize.md) to get the size required.  
  
*buffer* &nbsp;&nbsp;\_Out\_writes\_bytes\_to\_(bufferSize,*bufferUsed)  
Type: void*  
  
A caller allocated byte buffer that passes back the verify string result.  
  
*ptrToBuffer* &nbsp;&nbsp;\_Outptr\_  
Type: [XblVerifyStringResult**](../structs/xblverifystringresult.md)  
  
Passes back a strongly typed pointer that points into buffer. Do not free this as its lifecycle is tied to buffer.  
  
*bufferUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  
  
Passes back the number of bytes written to the buffer.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** string_verify_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[string_verify_c](../string_verify_c_members.md)  
  
  