---
author: M-Stahl
title: XNetworkingQuerySecurityInformationForUrlAsyncResult
description: Gets the results from the XNetworkingQuerySecurityInformationForUrlAsync function.
kindex: XNetworkingQuerySecurityInformationForUrlAsyncResult
ms.author: v-doglov
ms.topic: reference
edited: 06/13/2019
security: public
applies-to: pc-gdk
---

# XNetworkingQuerySecurityInformationForUrlAsyncResult

Gets the results from the [XNetworkingQuerySecurityInformationForUrlAsync](xnetworkingquerysecurityinformationforurlasync.md) function.


## Syntax

```cpp
HRESULT XNetworkingQuerySecurityInformationForUrlAsyncResult(
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

Pointer to the [XAsyncBlock](../../../system/xasync/structs/xasyncblock.md) that was passed to the [XNetworkingQuerySecurityInformationForUrlAsync](xnetworkingquerysecurityinformationforurlasync.md) function.

*securityInformationBufferByteCount* &nbsp;&nbsp;\_In\_  
Type: size_t

The size, in bytes, to allocate for the results buffer. This data is obtained by calling [XNetworkingQuerySecurityInformationForUrlAsyncResultSize](xnetworkingquerysecurityinformationforurlasyncresultsize.md). Alternatively, if you have pre-allocated a large results buffer, you can pass in the size of the pre-allocated buffer.

*securityInformationBufferByteCountUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t\*

Pointer to the size, in bytes, of the actual results buffer.

*securityInformationBuffer* &nbsp;&nbsp;\_Out\_writes\_bytes\_to\_(securityInformationBufferByteCount,\*securityInformationBufferByteCountUsed)  
Type: uint8_t\*

Pointer to the buffer that contains the thumbprint results.

*securityInformation* &nbsp;&nbsp;\_Outptr\_  
Type: [XNetworkingSecurityInformation](../structs/xnetworkingsecurityinformation.md)\*\*

Pointer to the list of certificate thumbprints returned from the Network Security Allow List (NSAL).

### Return value

Type: HRESULT

HRESULT success or error code.

## Remarks

This function gets the results from the [XNetworkingQuerySecurityInformationForUrlAsync](xnetworkingquerysecurityinformationforurlasync.md) function. Its pointers determine the size in bytes allocated to the results buffer, actual results of the buffer byte size, the buffer that contains the thumbprint results, and the list of certificate thumbprints returned from the NSAL. 

The buffer is the underlying buffer used by all the pointers in the security information structure pointer. The title should keep the buffer valid as long as it is using the security information structure pointer. Freeing and cleaning up the buffer also cleans up all memory used by the security information structure pointer. For network information in Microsoft Game Development Kit (GDK) titles, see [Retrieving Network Information](../../../../networking/overviews/initialization-connectivity-networking.md). 

This method interrogates the local state within the calling process and returns quickly, so it is safe to call from time-sensitive contexts.

## Requirements

**Header:** XNetworking.h

**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
[HTTP and Web Sockets](../../../../networking/overviews/web-requests/http-networking.md)  
[XNetworkingQuerySecurityInformationForUrlUtf16AsyncResult](xnetworkingquerysecurityinformationforurlutf16asyncresult.md)  
[XNetworking](../xnetworking_members.md)  