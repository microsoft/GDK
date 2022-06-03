---
author: M-Stahl
title: XNetworkingQuerySecurityInformationForUrlUtf16Async
description: Retrieves security information associated with an URL as configured in the Universal Developer Portal for Xbox Live enabled titles.
kindex: XNetworkingQuerySecurityInformationForUrlUtf16Async
ms.author: v-doglov
ms.topic: reference
edited: 06/13/2019
quality: good
security: public
applies-to: pc-gdk
---

# XNetworkingQuerySecurityInformationForUrlUtf16Async

Retrieves security information associated with an URL as configured in the Universal Developer Portal for Xbox Live–enabled titles.

## Syntax

```cpp
HRESULT XNetworkingQuerySecurityInformationForUrlUtf16Async(
         const wchar_t* url,
         XAsyncBlock* asyncBlock
)
```

### Parameters

*url* &nbsp;&nbsp;\_In\_z\_  
Type: wchar_t\*

URL endpoint that retrieves the list of certificate thumbprints.

*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock](../../../system/xasync/structs/xasyncblock.md)\*

Pointer to the [XAsyncBlock](../../../system/xasync/structs/xasyncblock.md) structure that gets passed to the [XAsyncRun](../../../system/xasync/functions/xasyncrun.md) function.

### Return value

Type: HRESULT

HRESULT success or error code of the async call.

## Remarks

This function starts an async request for the certificates associated with an URL configured for the title through the Universal Developer Portal. This allows Xbox Live–enabled Microsoft Game Development Kit (GDK) titles to perform certificate pinning for custom title-specific service endpoints when paired with the [Windows HTTP Services (WinHTTP)](/windows/desktop/winhttp/winhttp-start-page) API. 
 
![alert](../../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** When making custom web requests to the Xbox Live service endpoints, allow the Xbox Services API (XSAPI) library to automatically perform the certificate pinning.

This method interrogates the local state within the calling process and returns quickly, so it is safe to call from time-sensitive contexts.

## Requirements

**Header:** XNetworking.h

**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
 
[Retrieving Network Information](../../../../networking/overviews/initialization-connectivity-networking.md)    
[XNetworkingQuerySecurityInformationForUrlUtf16AsyncResult](xnetworkingquerysecurityinformationforurlutf16asyncresult.md)  
[XNetworking](../xnetworking_members.md)  
  