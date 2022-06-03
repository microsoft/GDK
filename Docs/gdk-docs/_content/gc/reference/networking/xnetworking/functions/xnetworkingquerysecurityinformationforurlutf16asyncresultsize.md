---
author: M-Stahl
title: XNetworkingQuerySecurityInformationForUrlUtf16AsyncResultSize
description: Gets the size of the result buffer from the XNetworkingQuerySecurityInformationForUrlUtf16Async function.
kindex: XNetworkingQuerySecurityInformationForUrlUtf16AsyncResultSize
ms.author: v-doglov
ms.topic: reference
edited: 06/13/2019
security: public
applies-to: pc-gdk
---

# XNetworkingQuerySecurityInformationForUrlUtf16AsyncResultSize

Gets the size of the results buffer from the[XNetworkingQuerySecurityInformationForUrlUtf16Async](xnetworkingquerysecurityinformationforurlutf16async.md) function.

## Syntax

```cpp
HRESULT XNetworkingQuerySecurityInformationForUrlUtf16AsyncResultSize(
         XAsyncBlock* asyncBlock,
         size_t* securityInformationBufferByteCount
)
```

### Parameters

*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock](../../../system/xasync/structs/xasyncblock.md)\*

Pointer to the [XAsyncBlock](../../../system/xasync/structs/xasyncblock.md) structure that gets passed to the[XNetworkingQuerySecurityInformationForUrlUtf16Async](xnetworkingquerysecurityinformationforurlutf16async.md) function.

*securityInformationBufferByteCount* &nbsp;&nbsp;\_Out\_  
Type: size_t\*

The size, in bytes, of the results buffer.

### Return value

Type: HRESULT

HRESULT success or error code.

## Remarks

This function gets the buffer results by calling the `XNetworkingQuerySecurityInformationForUrlUtf16Async` function. The number of bytes of the results buffer are determined using the *securityInformationBufferByteCount* pointer. For network information in Microsoft Game Development Kit (GDK) titles, see [Retrieving Network Information](../../../../networking/overviews/initialization-connectivity-networking.md). 

This method interrogates the local state within the calling process and returns quickly, so it is safe to call from time-sensitive contexts.

## Requirements 

**Header:** XNetworking.h

**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[HTTP and Web Sockets](../../../../networking/overviews/web-requests/http-networking.md)   
[XNetworking](../xnetworking_members.md)  
  