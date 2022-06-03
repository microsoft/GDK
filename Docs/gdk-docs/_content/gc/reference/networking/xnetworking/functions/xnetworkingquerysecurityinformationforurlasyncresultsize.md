---
author: M-Stahl
title: XNetworkingQuerySecurityInformationForUrlAsyncResultSize
description: Gets the size of the results buffer from a QueryThumbprintsForUrlAsync call.
kindex: XNetworkingQuerySecurityInformationForUrlAsyncResultSize
ms.author: v-doglov
ms.topic: reference
edited: 06/13/2019
security: public
applies-to: pc-gdk
---

# XNetworkingQuerySecurityInformationForUrlAsyncResultSize

Gets the size of the results buffer from an [XNetworkingQuerySecurityInformationForUrlAsync](xnetworkingquerysecurityinformationforurlasync.md) call.

## Syntax

```cpp
HRESULT XNetworkingQuerySecurityInformationForUrlAsyncResultSize(
         XAsyncBlock* asyncBlock,
         size_t* securityInformationBufferByteCount
)
```

### Parameters

*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock](../../../system/xasync/structs/xasyncblock.md)\*

Pointer to the [XAsyncBlock](../../../system/xasync/structs/xasyncblock.md) structure that gets passed to the [XNetworkingQuerySecurityInformationForUrlAsync](xnetworkingquerysecurityinformationforurlasync.md) function.

*securityInformationBufferByteCount* &nbsp;&nbsp;\_Out\_  
Type: size_t\*

The size, in bytes, of the results buffer.

### Return value

Type: HRESULT

HRESULT success or error code.

## Remarks  

This function gets the size of the results buffer from an `XNetworkingQuerySecurityInformationForUrlAsync` call. The title should pass the same `XAsyncBlock` structure that is passed to the query function. The buffer is the underlying buffer used by all the pointers in the security information structure pointer. The title should keep the buffer valid as long as it is using the security information structure pointer. Freeing and cleaning up the buffer also cleans up all memory used by the security information structure pointer. For network information in Microsoft Game Development Kit (GDK) titles, see [Retrieving Network Information](../../../../networking/overviews/initialization-connectivity-networking.md).

This method interrogates the local state within the calling process and returns quickly, so it is safe to call from time-sensitive contexts.

## Requirements

**Header:** XNetworking.h

**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[HTTP and Web Sockets](../../../../networking/overviews/web-requests/http-networking.md)  
[XNetworking](../xnetworking_members.md)  
  