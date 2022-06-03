---
author: M-Stahl
title: XNetworkingQuerySecurityInformationForUrlAsync
description: Retrieves additional security information associated with a URL configured in the Universal Developer Portal for Xbox Live–enabled titles.
kindex: XNetworkingQuerySecurityInformationForUrlAsync
ms.author: v-doglov
ms.topic: reference
edited: 06/13/2019
quality: good
security: public
applies-to: pc-gdk
---

# XNetworkingQuerySecurityInformationForUrlAsync

Retrieves additional security information associated with a URL configured in the Universal Developer Portal for Xbox Live–enabled titles. 

## Syntax

```cpp
HRESULT XNetworkingQuerySecurityInformationForUrlAsync(
         const char* url,
         XAsyncBlock* asyncBlock
)
```

### Parameters

*url* &nbsp;&nbsp;\_In\_z\_  
Type: char\*

URL of the security information and list of certificate thumbprints.

*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock](../../../system/xasync/structs/xasyncblock.md)\*

Pointer to the [XAsyncBlock](../../../system/xasync/structs/xasyncblock.md) structure that gets passed to [XAsyncRun](../../../system/xasync/functions/xasyncrun.md) function.

### Return value

Type: HRESULT

HRESULT success or error code of the async call.

## Remarks

This function starts an async request for the security information associated with a URL that was configured for a title through the Universal Developer Portal. This allows Xbox Live–enabled Microsoft Game Development Kit (GDK) titles to perform certificate pinning for custom title-specific service endpoints when paired with the [Windows HTTP Services (WinHTTP)](/windows/desktop/winhttp/winhttp-start-page) API. It is also required when making any custom web requests to the Xbox Live service endpoints. The Xbox Services API (XSAPI) library handles this requirement automatically.

This method interrogates the local state within the calling process and returns quickly, so it is safe to call from time-sensitive contexts.

## Requirements

**Header:** XNetworking.h

**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Retrieving Network Information](../../../../networking/overviews/initialization-connectivity-networking.md)  
[HTTP and WebSockets](../../../../networking/overviews/web-requests/http-networking.md)  
[XNetworking](../xnetworking_members.md)  
  