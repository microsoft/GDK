---
author: M-Stahl
title: WinHTTP overview
description: Provides an overview of WinHTTP functionality for a Microsoft Game Development Kit (GDK) title.
kindex:
- WinHTTP Overview
- winhttp
ms.author: fschober
ms.topic: conceptual
edited: 07/28/2021
security: public
---

# WinHTTP overview

This topic explains how to use [Windows HTTP Services (WinHTTP)](/windows/desktop/winhttp/winhttp-start-page) functionality for a Microsoft Game Development Kit (GDK) title. It is a lower-level HTTP client API that is approved for PC and Xbox console Microsoft Game Development Kit (GDK) titles. You can use it to create regular HTTP and WebSocket service endpoints.

Since it is lower-level, there are additional considerations and steps to implement so that you can achieve secure and robust communication for your title. It is important that your implementation adheres to the security and communication policies for Xbox Requirements (XRs), especially XR-12.

## WinHTTP version differences

In general, Microsoft Game Development Kit (GDK) titles interact with WinHTTP in the same way that they interact with WinHTTP in Win32 applications.

When developing for Microsoft Game Development Kit (GDK) titles, only the flat C/C++ API for WinHTTP is available. This means that HTTP functionalities must be built on this HTTP client API. 


## Add WinHTTP to your Xbox console project

On console, you should `#include <winhttp.h>` in your source files. You must link against `XGamePlatform.lib`, rather than directly against `Winhttp.lib`. Only the APIs under the `WINAPI_PARTITION_GAMES` API family work in Microsoft Game Development Kit (GDK) titles. On Windows PC, you should continue to link against `Winhttp.lib`.

For an example of how to integrate WinHTTP into your Microsoft Game Development Kit (GDK) title, see the [SimpleWinHttp sample](https://aka.ms/gdkdl). It provides a solid, fully compliant starting point for your own WinHTTP implementation and includes the `WinHttpManager` class. It exposes a simple asynchronous API surface.


<a id="ID4ETA"></a>

## Network initialization and WinHTTP

Before making the first call to [WinHttpOpen](/windows/desktop/api/winhttp/nf-winhttp-winhttpopen), Microsoft Game Development Kit (GDK) titles must ensure that the networking stack is initialized. If `WinHttpOpen` is called too early during the title's launch process, `WinHttpOpen` or subsequent WinHTTP calls might fail or crash in a non-deterministic way. Requests can appear to succeed but actually fail or vice-versa before the network is declared as initialized. For details about how to determine when the networking stack is initialized, see [Network initialization and connectivity](../initialization-connectivity-networking.md#ID4ETA).


<a id="SuspendResume"></a>

## Title suspend/resume and WinHTTP

Titles should initiate the process to close all WinHTTP handles when a title suspension notification is received. WinHTTP handle cleanup is asynchronous. As a result, you should close your handles in the following order: all request handles followed by all connection handles followed by all session handles. The asynchronous nature of WinHTTP handle cleanup is to ensure notification threading safety. Even though it's asynchronous, WinHTTP handle cleanup doesn't delay for any period of time. This makes it easily fit within the one-second suspend-deferral timeout.

On resume, titles should follow the same procedure as described in [Network initialization and WinHTTP](#ID4ETA) and wait for the network to move back to the ready state before continuing with WinHTTP usage. A long period of time might have elapsed between suspend and resume events, requiring the network to once again stabilize before WinHTTP APIs become deterministic again.


<a id="MemoryConsiderations"></a>

## Memory and concurrency considerations

The number of concurrent WinHTTP requests should always be kept below eight to ensure that the asynchronous state within WinHTTP operates correctly and within its memory budget. This limit applies to all concurrent operations within the title runtime, including calls from Xbox Service APIs and `XCurl`.

As an extension to [WinSock Memory Considerations](../game-mesh/winsock-intro-networking.md#SocketMemory), you should ensure that when receiving data you always have a pended buffer with `WinHttpReadData` (or are waiting for a callback from a `WinHttpQueryDataAvailable` call) in order to transfer data into your user mode process from the kernel mode memory pools as quickly as possible and minimize the amount of kernel memory consumed by your HTTP operation.

The `WinHttpQueryHeaders` getter function requires transient memory allocations.  It allocates a scratch buffer of size equal to the `lpdwBufferLength` parameter for internal use (and frees it before the function returns).  For this reason, you should use the `WINHTTP_NO_OUTPUT_BUFFER` double calling pattern to minimize the size of the scratch buffers and limit how many concurrent calls to `WinHttpQueryHeaders` you are making at once to avoid excessive system memory usage that could lead to system instability.  Note that the default maximum size for headers is 64KB as specified by the `WINHTTP_OPTION_MAX_RESPONSE_HEADER_SIZE` WinHTTP option.


## WinHttpOpen considerations

### Flags

You must pass the flags in the following table to [WinHttpOpen](/windows/win32/api/winhttp/nf-winhttp-winhttpopen).

|Parameter | Value |
| ---------|---------|
| `dwAccessType` | `WINHTTP_ACCESS_TYPE_AUTOMATIC_PROXY` |
| `pszProxyW` | `WINHTTP_NO_PROXY_NAME` |
| `pszProxyBypassW` | `WINHTTP_NO_PROXY_BYPASS` |
| `dwFlags` | `WINHTTP_FLAG_SECURE_DEFAULTS` |


The combination of `WINHTTP_ACCESS_TYPE_AUTOMATIC_PROXY`, `WINHTTP_NO_PROXY_NAME`, and `WINHTTP_NO_PROXY_BYPASS` allows the Microsoft Game Development Kit (GDK) platform to automatically handle proxies such as [Fiddler](../tools/fiddler-setup-networking.md) and other edge-case networking environments.

The `WINHTTP_FLAG_SECURE_DEFAULTS` flag is a new flag that's specifically designed to help Microsoft Game Development Kit (GDK) titles to adhere to the security best practices by setting the recommended secure connection behavior. It's available on Xbox One consoles and will be available on Windows PC in a future Windows OS update. Trying to pass `WINHTTP_FLAG_SECURE_DEFAULTS` on existing Windows OS versions results in an invalid parameter failure. This flag has a significant side effect&mdash;it forces WinHTTP into the asynchronous mode because this flag implicitly includes the `WINHTTP_FLAG_ASYNC` flag. On Windows PC OS versions that don't support this flag, you should pass `WINHTTP_FLAG_ASYNC` instead to minimize differences in the remainder of your WinHTTP implementation.
> [!NOTE]
> The `WINHTTP_FLAG_SECURE_DEFAULTS` flag requires a matching `WINHTTP_FLAG_SECURE` flag passed to `WinHttpOpenRequest` and blocks unencrypted HTTP requests.  On development kits for internal debugging and testing, you may create an additional WinHTTP session handle and specify the `WINHTTP_FLAG_ASYNC` flag to `WinHttpOpen`.  This will allow you to then make an unencrypted HTTP request during development by not specifying the `WINHTTP_FLAG_SECURE` flag to `WinHttpOpenRequest`.  You should still use session handles opened with the `WINHTTP_FLAG_SECURE_DEFAULTS` for non-debug traffic to match the request behavior your title will see in RETAIL.


### WINHTTP_OPTION_SECURE_PROTOCOLS

After you have a new session handle that was created by `WinHttpOpen`, you must call [WinHttpSetOption](/windows/win32/api/winhttp/nf-winhttp-winhttpsetoption) with option `WINHTTP_OPTION_SECURE_PROTOCOLS` and pass the corresponding `XNetworkingSecurityInformation::enabledHttpSecurityProtocolFlags` that was retrieved by a call to [XNetworkingQuerySecurityInformationForUrlUtf16Async](../../../reference/networking/xnetworking/functions/xnetworkingquerysecurityinformationforurlutf16async.md) for a matching URL that this session handle will be used for. You should also store the [XNetworkingSecurityInformation](../../../reference/networking/xnetworking/structs/xnetworkingsecurityinformation.md) structure on your context object for use in the [validating the TLS/SSL handshake](intro-winhttp.md#ID4ETAA) step.


### Caching session handles

HTTP session handles that were created through `WinHttpOpen` are expensive from a memory perspective and incur a large start-up cost that delays the first HTTP request. We recommend that you cache HTTP session handles as much as possible within your title to avoid these costs.

However, it's not possible to change the `WINHTTP_OPTION_SECURE_PROTOCOLS` option on a session handle. You should keep a cache of `XNetworkingSecurityInformation::enabledHttpSecurityProtocolFlags` values mapped to WinHTTP session handles to ensure that you have a different session handle for each different secure protocol flag.

The cache that your title maintains must be cleared on suspend notifications and should be rebuilt from scratch on resume (after waiting for the network to become initialized).


## WinHttpConnect considerations

Unlike session handles, connection handles that are created through [WinHttpConnect](/windows/win32/api/winhttp/nf-winhttp-winhttpconnect) should never be cached. New handles should be created for every new request and/or retry attempt. WinHTTP connection handles, despite their name, have no relationship to the underlying server Transmission Control Protocol (TCP) connections. WinHTTP manages the lifetimes of the underlying server connections with the session handle and automatically reuses open server connections where possible for new connection handles.

### URL Canonicalization

WinHTTP expects all URLs to be canonicalized into the a-z, A-Z, and 0-9 US-ASCII characters. For more information about canonicalization, see [Uniform Resource Locators (URLs) in WinHTTP](/windows/win32/winhttp/uniform-resource-locators--urls--in-winhttp). Whenever possible, we recommend that you hard-code the URLs that your title uses in canonicalized form. This avoids the memory allocations and performance issues that are incurred by using the [WinHttpCrackUrl](/windows/win32/api/winhttp/nf-winhttp-winhttpcrackurl) and [WinHttpCreateUrl](/windows/win32/api/winhttp/nf-winhttp-winhttpcreateurl) functions to dynamically canonicalize your URLs.


### URL splitting

WinHTTP requires a null-terminated host name string to be passed to `WinHttpConnect` while the path and object are passed to `WinHttpOpenRequest`. This means that your title must pass both the full URL, including the concatenated host name and path in some places and only the host name or path in others. We recommend that you hard-code both in your title to avoid the need to use [WinHttpCrackUrl](/windows/win32/api/winhttp/nf-winhttp-winhttpcrackurl) and [WinHttpCreateUrl](/windows/win32/api/winhttp/nf-winhttp-winhttpcreateurl) to dynamically concatinate or split the URLs.


## WinHttpOpenRequest considerations

Similar to WinHTTP connection handles, WinHTTP request handles that were created through the [WinHttpOpenRequest](/windows/win32/api/winhttp/nf-winhttp-winhttpopenrequest) function should never be cached. New handles should be created for every new request and/or retry attempt.

As a security best practice, titles should always pass the `WINHTTP_FLAG_SECURE` flag for the `dwFlags` parameter when calling the `WinHttpOpenRequest` function.


## Retrieving and applying Xbox Live tokens

Tokens aren't automatically inserted for Microsoft Game Development Kit (GDK) titles. Instead, the title should retrieve Xbox Live authentication tokens and signatures with the Microsoft Game Development Kit (GDK) [XUser](../../../reference/system/xuser/xuser_members.md) APIs. After the title has a user, the title should call [XUserGetTokenAndSignatureUtf16Async](../../../reference/system/xuser/functions/xusergettokenandsignatureutf16async.md) to retrieve the token and signature strings for each individual request. These two strings should then be passed as headers in the call to `WinHttpAddRequestHeadersEx`, [WinHttpSendRequest](/windows/desktop/api/winhttp/nf-winhttp-winhttpsendrequest), or [WinHttpAddRequestHeaders](/windows/desktop/api/winhttp/nf-winhttp-winhttpaddrequestheaders).

To generate a proper signature, [XUserGetTokenAndSignatureUtf16Async](../../../reference/system/xuser/functions/xusergettokenandsignatureutf16async.md) expects the title to pass all headers and the entire body. For a `POST` or `PUT` with a large body, the title can pass a subset of the body that was configured in Partner Center. For more information, see [Web services (NDA topic)](../../../live/features/s2s-auth-calls/custom-service-config/web-services/live-web-services-nav.md). At this time, Xbox Live doesn't provide a mechanism for retrieving this configuration. Clients are expected to either hard-code the values or retrieve them through a custom, title-specific endpoint.

[XUserGetTokenAndSignatureUtf16Async](../../../reference/system/xuser/functions/xusergettokenandsignatureutf16async.md) performs all necessary caching internally and should be called for each HTTP attempt, including a retry. If the title receives a 401 Unauthorized HTTP response status code for any HTTP request, the title should retry the request and force a refresh of the Xbox Live authentication token. This is achieved by retrieving a new token with [XUserGetTokenAndSignatureUtf16Async](../../../reference/system/xuser/functions/xusergettokenandsignatureutf16async.md) and passing the [XUserGetTokenAndSignatureOptions::ForceRefresh](../../../reference/system/xuser/enums/xusergettokenandsignatureoptions.md) enum value.

After the title has [XUserGetTokenAndSignatureUtf16Data](../../../reference/system/xuser/structs/xusergettokenandsignatureutf16data.md) that was retrieved by a call to [XUserGetTokenAndSignatureUtf16Async](../../../reference/system/xuser/functions/xusergettokenandsignatureutf16async.md), the title must transform `XUserGetTokenAndSignatureUtf16Data::Token` and `XUserGetTokenAndSignatureUtf16Data::Signature` into HTTP headers to be passed into WinHTTP. A new WinHTTP API, `WinHttpAddRequestHeadersEx`, has been added specifically to reduce complexity for Microsoft Game Development Kit (GDK) titles. An example of how to use this new API is shown as follows. This new API is available on Xbox One consoles and will be available on Windows PC in a future Windows OS update. On console, we recommend that you use `WinHttpAddRequestHeadersEx` to avoid the extra allocations and string format changes.

 ```cpp
HRESULT
AddTokenAndSignatureDataToHttpRequest(
    XUserGetTokenAndSignatureUtf16Data* userTokenAndSignatureData,
    HINTERNET requestHandle
    )
{
    WINHTTP_EXTENDED_HEADER winhttpHeader[2];
    winhttpHeader[0].pwszName = L"Authorization";
    winhttpHeader[0].pwszValue = userTokenAndSignatureData->token;
    winhttpHeader[1].pwszName = L"Signature";
    winhttpHeader[1].pwszValue = userTokenAndSignatureData->signature;
    return HRESULT_FROM_WIN32(WinHttpAddRequestHeadersEx(
        m_handshakeRequest,
        WINHTTP_ADDREQ_FLAG_ADD,
        WINHTTP_EXTENDED_HEADER_FLAG_UNICODE,
        0,
        tokenAndSignature->signatureCount ? 2 : 1,
        winhttpHeader));
}

 ```
> [!NOTE]
> The device or a signed-in account needs to have access to the sandbox that it's set to. Otherwise, `XUserGetTokenAndSignatureUtf16Data` fails.


<a id="ID4ETE"></a>

### Using the Xbox Live Network Security Authorization List (NSAL)

Xbox Live uses the NSAL to ensure that clients establish secure and authenticated connections to your web services. Titles manage the contents of the NSAL as part of their configuration in Partner Center. For more information, see [Setting up web services at Partner Center (NDA topic)](../../../live/features/s2s-auth-calls/custom-service-config/web-services/live-web-services.md). The NSAL configuration is then downloaded automatically for each title and is used both to generate appropriate Xbox Live tokens and to perform certificate pinning for your title's specific endpoints.


## WinHTTP asynchronous state machine considerations

The WinHTTP asynchronous state machine is the same on console as it is on Windows PC. To register a callback function with one or more notifications, use the [WinHttpSetStatusCallback](/windows/win32/api/winhttp/nf-winhttp-winhttpsetstatuscallback) function. We recommend using the `WINHTTP_CALLBACK_FLAG_ALL_NOTIFICATIONS` flag for the `dwNotificationFlags` parameter for debugging purposes because WinHTTP is relatively verbose and transparent about what it's doing. While most notifications don't require any action from you, logging the data can be useful for discovering the root cause of issues.

WinHTTP uses a single thread for notifications. Titles should avoid blocking any notification function whenever possible because this prevents all HTTP requests within your process from progressing. Unserviced notifications can also increase kernel mode memory, which can lead to crashes.

WinHTTP doesn't copy your send or receive buffers and requires you to keep these buffers allocated until the corresponding completion callback. Ensure that you keep your send buffers allocated and valid from when you call [WinHttpSendRequest](/windows/win32/api/winhttp/nf-winhttp-winhttpsendrequest) until the corresponding `WINHTTP_CALLBACK_STATUS_SENDREQUEST_COMPLETE` notification is received. Similarly, every time you call [WinHttpReadData](/windows/win32/api/winhttp/nf-winhttp-winhttpreaddata), ensure that you keep your receive buffer allocated and valid until the corresponding `WINHTTP_CALLBACK_STATUS_READ_COMPLETE` notification is received. We also recommend using a receive buffer of at least 8 KB in size to avoid recursion problems that can lead to stack exhaustion.

Titles should also ensure that WinHTTP buffers are emptied correctly by continuing the asynchronous `WinHttpQueryDataAvailable`/`WinHttpReadData` cycle and by not blocking WinHTTP callbacks for any period of time.

<a id="ID4ETAA"></a>

### Validating the Transport Layer Security (TLS)/Secure Sockets Layer (SSL) handshake

As a security best practice, titles should perform additional validation of the TLS/SSL handshake and use only TLS 1.2.

Additional validation is performed within the `WINHTTP_CALLBACK_STATUS_SENDING_REQUEST` notification. Within this notification, you must call the [XNetworkingVerifyServerCertificate](../../../reference/networking/xnetworking/functions/xnetworkingverifyservercertificate.md) function and pass in the [XNetworkingSecurityInformation](../../../reference/networking/xnetworking/structs/xnetworkingsecurityinformation.md) structure that was retrieved from a previous corresponding call to [XNetworkingQuerySecurityInformationForUrlUtf16Async](../../../reference/networking/xnetworking/functions/xnetworkingquerysecurityinformationforurlutf16async.md). This function fails if the certificate chain is invalid. You should *immediately* close the WinHTTP handle before the callback completes to ensure that no data is transferred to/from the compromised server.

In addition to validating certificate chains, the [XNetworkingVerifyServerCertificate](../../../reference/networking/xnetworking/functions/xnetworkingverifyservercertificate.md) function is required for Fiddler functionality on console.


<a id="ID4ETAB"></a>

## Debugging WinHTTP

[Fiddler](../tools/fiddler-setup-networking.md) is a useful tool for viewing and debugging your WinHTTP traffic. For Fiddler to capture your title traffic, you must pass the `WINHTTP_ACCESS_TYPE_AUTOMATIC_PROXY`, `WINHTTP_NO_PROXY_NAME`, and `WINHTTP_NO_PROXY_BYPASS` flags to `WinHttpOpen`. You must also call [XNetworkingVerifyServerCertificate](../../../reference/networking/xnetworking/functions/xnetworkingverifyservercertificate.md) within the `WINHTTP_CALLBACK_STATUS_SENDING_REQUEST` notification callback.
> [!NOTE]
> HTTP Monitor doesn't work with Microsoft Game Development Kit (GDK) titles.


## See also

 [Windows HTTP Services (WinHTTP)](/windows/desktop/winhttp/winhttp-start-page)

 [XSAPI C overview (secure link)](https://developer.microsoft.com/games/xbox/docs/gdk/atoc-xsapi-c)

 [XUser](../../../reference/system/xuser/xuser_members.md)

 [Setting up web services at Partner Center (NDA topic)](../../../live/features/s2s-auth-calls/custom-service-config/web-services/live-web-services.md)

 [Fiddler on Xbox One consoles](../tools/fiddler-setup-networking.md)
 
 [Communication Security Overview (NDA topic)](../../../security/communication-security/communication-security-overview.md)