---
author: M-Stahl
title: XUserGetTokenAndSignatureUtf16Result
description: Gets the result of a call to XUserGetTokenAndSignatureUtf16Async.
kindex: XUserGetTokenAndSignatureUtf16Result
ms.author: v-sahain
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XUserGetTokenAndSignatureUtf16Result

Gets the result of a call to [XUserGetTokenAndSignatureUtf16Async](xusergettokenandsignatureutf16async.md).

## Syntax  
  
```cpp
HRESULT XUserGetTokenAndSignatureUtf16Result(  
         XAsyncBlock* async,  
         size_t bufferSize,  
         void* buffer,  
         XUserGetTokenAndSignatureUtf16Data** ptrToBuffer,  
         size_t* bufferUsed  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: XAsyncBlock*  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) for polling the call's status and retrieving call results.  
  
*bufferSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the buffer in the *buffer* parameter.  
  
*buffer* &nbsp;&nbsp;\_Out\_writes\_bytes\_to\_(bufferSize,*bufferUsed)  
Type: void*  
  
Contains the results of the call to [XUserGetTokenAndSignatureUtf16Async](xusergettokenandsignatureutf16async.md).  
  
*ptrToBuffer* &nbsp;&nbsp;\_Outptr\_  
Type: [XUserGetTokenAndSignatureUtf16Data**](../structs/xusergettokenandsignatureutf16data.md)  
  
On return, *prtToBuffer* points to the buffer you specify in the *buffer* parameter. The parameter provides a typed pointer to *buffer* and does not need to be freed independently.  
  
*bufferUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  
  
The number of bytes written in the *buffer* parameter.  
  
### Return value

Type: HRESULT
  
Returns S_OK if successful; otherwise, returns an error code.
For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks

The XUserGetTokenAndSignatureUtf16Async function uses an [XUserGetTokenAndSignatureOptions](../enums/xusergettokenandsignatureoptions.md) enumeration argument to asynchronously retrieve unicode xtokens and signatures for web requests.

To asynchronously retrieve Unicode xtokens and signatures for web requests, call
[XUserGetTokenAndSignatureUtf16Async](xusergettokenandsignatureutf16async.md).

To retrieve the required buffer size to hold the results of calling [XUserGetTokenAndSignatureUtf16Async](xusergettokenandsignatureutf16async.md), call [XUserGetTokenAndSignatureUtf16ResultSize](xusergettokenandsignatureutf16resultsize.md).

## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserGetTokenAndSignatureUtf16Async](xusergettokenandsignatureutf16async.md)

[XUserGetTokenAndSignatureUtf16ResultSize](xusergettokenandsignatureutf16resultsize.md)