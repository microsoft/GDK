---
author: M-Stahl
title: XUserGetTokenAndSignatureUtf16ResultSize
description: Gets the buffer size for holding the results of a call to XUserGetTokenAndSignatureUtf16Async.
kindex: XUserGetTokenAndSignatureUtf16ResultSize
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserGetTokenAndSignatureUtf16ResultSize

Gets the buffer size for holding the results of a call to [XUserGetTokenAndSignatureUtf16Async](xusergettokenandsignatureutf16async.md).

## Syntax  
  
```cpp
HRESULT XUserGetTokenAndSignatureUtf16ResultSize(  
         XAsyncBlock* async,  
         size_t* bufferSize  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: XAsyncBlock*  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) for polling the call's status and retrieving call results.  
  
*bufferSize* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Contains the required buffer size.  
  
### Return value

Type: HRESULT
  
Returns S_OK if successful; otherwise, returns an error code.
For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks

The XUserGetTokenAndSignatureUtf16Async function uses an [XUserGetTokenAndSignatureOptions](../enums/xusergettokenandsignatureoptions.md) enumeration argument to asynchronously retrieve unicode xtokens and signatures for web requests.

To asynchronously retrieve Unicode xtokens and signatures for web requests, call
[XUserGetTokenAndSignatureUtf16Async](xusergettokenandsignatureutf16async.md).

To retrieve the result of calling [XUserGetTokenAndSignatureUtf16Async](xusergettokenandsignatureutf16async.md), call [XUserGetTokenAndSignatureUtf16Result](xusergettokenandsignatureutf16result.md).

## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserGetTokenAndSignatureUtf16Async](xusergettokenandsignatureutf16async.md)

[XUserGetTokenAndSignatureUtf16Result](xusergettokenandsignatureutf16result.md)