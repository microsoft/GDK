---
author: M-Stahl
title: XNetworkingVerifyServerCertificate
description: Provides additional certificate chain validation.
kindex: XNetworkingVerifyServerCertificate
ms.author: orkeshet
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XNetworkingVerifyServerCertificate

Provides additional certificate chain validation.

## Syntax

```cpp
HRESULT XNetworkingVerifyServerCertificate(
         void* requestHandle,
         const XNetworkingSecurityInformation* securityInformation
)
```

### Parameters

*requestHandle* &nbsp;&nbsp;\_In\_  
Type: void\*

A handle of type [HINTERNET](/windows/win32/winhttp/hinternet-handles-in-winhttp). To obtain a valid handle, call [WinHttpOpenRequest](/windows/win32/api/winhttp/nf-winhttp-winhttpopenrequest).

*securityInformation* &nbsp;&nbsp;\_In\_  
Type: [XNetworkingSecurityInformation](../structs/xnetworkingsecurityinformation.md)\*

Pointer to an `XNetworkingSecurityInformation` structure. To get an appropriate pointer, call the[XNetworkingQuerySecurityInformationForUrlAsyncResult](xnetworkingquerysecurityinformationforurlasyncresult.md) function.

### Return value

Type: HRESULT

Returns `S_OK` if successful. This indicates that the server certificate chain is valid. Otherwise, it returns an error code indicating the server chain could not be validated. Treat all failures as fatal to the HTTP request.

## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md). 
  
Call this function from within the `WINHTTP_CALLBACK_STATUS_SENDING_REQUEST` WinHTTP callback. Pass a cached `XNetworkingSecurityInformation` structure from a previous call to [XNetworkingQuerySecurityInformationForUrlAsync](xnetworkingquerysecurityinformationforurlasync.md) along with the WinHTTP request handle associated with the callback. For additional information about the callback, see [WinHttpSendRequest](/windows/win32/api/winhttp/nf-winhttp-winhttpsendrequest).

If the `XNetworkingVerifyServerCertificate` function fails, the gaming runtime has likely detected a compromised connection to the server. In this case, you should immediately close the WinHTTP request handle before the callback returns to ensure that no data is transferred to or from the compromised server.

As a best practice, all title communication, regardless of content or protocol, should be secured. A title should provide confidentiality, integrity, and authentication for all title communication. For more information, see [Communication Security Overview (NDA topic)](../../../../security/communication-security/communication-security-overview.md)

## Requirements

**Header:** XNetworking.h

**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[HTTP and WebSockets](../../../../networking/overviews/web-requests/http-networking.md)  
[XNetworking](../xnetworking_members.md)  
  