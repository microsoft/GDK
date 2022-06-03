---
author: M-Stahl
title: XNetworkingQuerySecurityInformationForUrlUtf16AsyncResult
description: Gets the buffer results from the XNetworkingQuerySecurityInformationForUrlUtf16Async function.
kindex: XNetworkingQuerySecurityInformationForUrlUtf16AsyncResult
ms.author: v-doglov
ms.topic: reference
edited: 06/13/2019
security: public
applies-to: pc-gdk
---

# XNetworkingQuerySecurityInformationForUrlUtf16AsyncResult

Gets the buffer results from the [XNetworkingQuerySecurityInformationForUrlUtf16Async](xnetworkingquerysecurityinformationforurlutf16async.md) function.

## Syntax

```cpp
HRESULT XNetworkingQuerySecurityInformationForUrlUtf16AsyncResult(
         XAsyncBlock* asyncBlock,
         size_t securityInformationBufferByteCount,
         size_t* securityInformationBufferByteCountUsed,
         uint8_t* securityInformationBuffer,
         XNetworkingSecurityInformation** securityInformation
)
```

### Parameters

*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock](../../../system/xasync/structs/xasyncblock.md)\*

Pointer to the [XAsyncBlock](../../../system/xasync/structs/xasyncblock.md) structure that gets passed to the[XNetworkingQuerySecurityInformationForUrlUtf16Async](xnetworkingquerysecurityinformationforurlutf16async.md) function.

*securityInformationBufferByteCount* &nbsp;&nbsp;\_In\_  
Type: size_t

The size, in bytes, to allocate for the results buffer. This data is obtained by calling the[XNetworkingQuerySecurityInformationForUrlUtf16AsyncResultSize](xnetworkingquerysecurityinformationforurlutf16asyncresultsize.md) function. Alternatively, if you have pre-allocated a large results buffer, you can pass in the size of the pre-allocated buffer.

*securityInformationBufferByteCountUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t\*

Pointer to the size, in bytes, of the actual results buffer.

*securityInformationBuffer* &nbsp;&nbsp;\_Out\_writes\_bytes\_to\_(securityInformationBufferByteCount,*securityInformationBufferByteCountUsed)  
Type: uint8_t\*

Pointer to the buffer that contains the thumbprint results.

*securityInformation* &nbsp;&nbsp;\_Outptr\_  
Type: [XNetworkingSecurityInformation](../structs/xnetworkingsecurityinformation.md)\*\*

Pointer to the list of certificate thumbprints returned from the Network Security Allow List (NSAL).

### Return value

Type: HRESULT

HRESULT success or error code.

## Remarks

This function gets the buffer results by calling the `XNetworkingQuerySecurityInformationForUrlUtf16Async` function. The number of bytes allocated to the results buffer are determined using the *securityInformationBufferByteCount* pointer. The actual number of bytes of the results buffer are determined using the *securityInformationBufferByteCountUsed* pointer. Thumbprint results and the list of certificate thumbprints returned from the NSAL are determined by the *securityInformationBuffer* pointer and the *securityInformation* pointer. For network information in Microsoft Game Development Kit (GDK) titles, see [Retrieving Network Information](../../../../networking/overviews/initialization-connectivity-networking.md).

This method interrogates the local state within the calling process and returns quickly, so it is safe to call from time-sensitive contexts.

## Requirements

**Header:** XNetworking.h

**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[HTTP and Web Sockets](../../../../networking/overviews/web-requests/http-networking.md)  
[XNetworkingQuerySecurityInformationForUrlAsyncResult](xnetworkingquerysecurityinformationforurlasyncresult.md)  
[XNetworking](../xnetworking_members.md)  
  