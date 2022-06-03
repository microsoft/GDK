---
author: M-Stahl
title: xCurl overview
description: Describes the differences between the `xCurl` and the `libCurl` APIs. This is the recommended approach for implementing general HTTP requests.
kindex:
- xCurl Overview
- libcurl
ms.author: jameslen
ms.topic: conceptual
ms.date: 04/10/2020
edited: 12/04/2020
security: public
---

# xCurl overview

This topic describes the `xCurl` library, a Microsoft Game Development Kit (GDK) compliant implementation of the [libCurl](https://curl.haxx.se/libcurl/) APIs. We recommend `xCurl` as the HTTP API for Microsoft Game Development Kit (GDK) titles. `xCurl` simplifies title development by adhering to all security requirements and best practices without requiring any special title logic or handling. However, it does not support WebSocket communication. If you need to implement WebSocket communication, use [libHttpClient](http-networking.md#libhttpclient) instead.

`xCurl` differs from `libCurl` in that `xCurl` is implemented on top of [WinHttp](intro-winhttp.md) and automatically follows all the extra Microsoft Game Development Kit (GDK) requirements and best practices. While `libCurl` itself doesn't meet the security requirements for the Microsoft Game Development Kit (GDK) console platform, use `xCurl` to maintain your same `libCurl` HTTP implementation across all platforms while changing only one header include and library linkage.

Several `libCurl` APIs aren't implemented in `xCurl` because they don't meet the security requirements for Microsoft Game Development Kit (GDK) titles. The differences are described later in this topic. `xCurl` relies on the Gaming Runtime and can't be initialized until [XGameRuntimeInitialize](../../../reference/system/xgameruntimeinit/functions/xgameruntimeinitialize.md) is called.

To understand how `xCurl` methods work, see the [libCurl API](https://curl.haxx.se/libcurl/c/) documentation.
> [!NOTE]
> `xCurl` and `WinHttp` are the only secure options for HTTP on Xbox console. `xCurl` and `WinHttp` implementations work on both Windows PC and Xbox console with no code changes required. However, on Windows PC, you can use `libCurl` or any other HTTP stack directly with your Microsoft Game Development Kit (GDK) title.

## Add xCurl to your project

To use `xCurl` in a Microsoft Game Development Kit (GDK) game on a Windows 10 PC or an Xbox console, include the `xCurl` extension SDK headers and libraries in your project.

 1. Ensure that you've installed the Gaming Runtime Development Kit (GRDK) on your development PC.
 1. Open the .vcxproj file for your game, and then add the following element. This links the import library and includes *xCurl.dll* with the build output.

    ```xml
    <GDKExtLibNames>Xbox.xCurl.API</GDKExtLibNames>
    ```

 1. `xCurl` has a different header to differentiate itself from `libCurl`. In the locations where *curl.h* would be included in your game, replace the header with *xCurl.h*, shown as follows.

    ```cpp
    #include <xCurl.h>
    ```

## Configuration

`xCurl` is equivalent to `libCurl` compiled with the following build flags.

- HTTP_ONLY
- CURL_NO_OLDIES
- CURL_DISABLE_PROXY
- CURL_DISABLE_COOKIES
- CURL_DISABLE_DOH
- CURL_DISABLE_PROGRESS_METER
- CURL_DISABLE_MIME
- USE_SCHANNEL

## Network initialization

`xCurl` handles network initialization automatically.  You can setup and perform requests at any point in your title's lifecycle.  Any request started before the network is initialized will be delayed and queued until the network becomes initialized; in this manner xCurl ensures that your requests will be made at the earliest possible opportunity without any extra handling required by your title.

<a id="SuspendResume"></a>
## Title suspend/resume

`xCurl` handles suspend and resume automatically.  On suspend, all outstanding requests will be canceled immediately and fail with `CURLE_NO_CONNECTION_AVAILABLE`.  Additionally, querying `curl_easy_getinfo` for `CURLINFO_OS_ERRNO` on these requests will return `HRESULT_FROM_WIN32(PROCESS_SUSPEND_RESUME)` just like any other GRTS API in case you want to handle these failures differently from general network disconnect failures.

All `xCurl` handles remain valid throughout the title lifecycle including across suspend/resume boundaries.  There is no need to cleanup or initialize any `xCurl` handle on suspend/resume.  Any new requests started after suspend will be delayed until resume and the subsequent network initialization to ensure that they will start as soon as possible without requiring any extra handling by your title.
> [!NOTE]
> When using the multi interface for `xCurl`, your title should continue to call `curl_multi_perform` along with optionally `curl_multi_poll` or `curl_multi_wait` on suspend while there are outstanding requests.  `xCurl` will block suspend until all in-progress requests are completed, and failing to call `curl_multi_perform` may cause your title to timeout during suspend.  We recommend continuing to call curl_multi_perform throughout the entire lifecycle regardless of the suspend/resume state.  `xCurl` handles all intricacies of the suspend state internally.

## Security compliance

`xCurl` handles all aspects of XR-12 internally for the title, and all HTTPS requests through `xCurl` are automatically XR-12 compliant.

`xCurl` automatically enforces any special certificate pinning specified through your title's "Single Sign-on Portal".

On development kits you may specify the unencrypted HTTP scheme, `http://`, for debug traffic and testing purposes.  For all RETAIL requests, you must specify the HTTPS scheme, `https://`, in order to be XR-12 compliant.  xCurl requests that do not explicitly specify a scheme will infer the HTTPS scheme.
> [!NOTE]
> `xCurl` does not perform automatic token insertion.  To retrieve Xbox Live tokens, your title should call the `XUserGetTokenAndSignatureAsync` or `XUserGetTokenAndSignatureUtf16Async` GRTS APIs to retrieve the authorization and signature headers, and then use the `CURLOPT_HEADER`, `CURLOPT_HTTPHEADER`, or `CURLOPT_HEADERFUNCTION` options in a call to `curl_easy_setopt` to set the headers before making the request.

<a id="xCurlMemory"></a>

## Memory and concurrency considerations

`xCurl` shares the same concurrent request limitations that apply to `WinHttp`. Titles should limit concurrent requests to eight or less to ensure that all calls operate correctly. This concurrency limit applies to concurrent requests that are issued from any of `xCurl`, `WinHttp`, and Xbox Service APIs.

`xCurl` uses a flip buffer to receive data.  This allows it to start filling a second buffer while providing the full buffer to the read callback and then switch to provide the second buffer to the read callback while the first is being filled.  However, if the read callback takes too long or if `curl_multi_perform` is not called frequently enough in multi mode, WinSock kernel memory may build up.  For more information on WinSock kernel memory, see [socket memory considerations](../game-mesh/winsock-intro-networking.md#SocketMemory).

### Controlling xCurl allocations

By default, `xCurl` uses the Windows heap and can have its allocations tracked through `XMemSetWin32HeapTrackingHooks`. Alternately, memory functions can be provided at initialization time like `libCurl`.

In addition to [curl_global_init_mem](https://curl.haxx.se/libcurl/c/curl_global_init_mem.html), `xCurl` provides the optional [xCurl_global_init_mem](../../../reference/networking/xcurl/functions/xcurl_global_init_mem.md). The callbacks that are provided to this version of `init` are similar to other Microsoft Game Development Kit (GDK) memory callbacks and provide more information than the standard `libCurl` callbacks about the data that's being allocated.

## Supported options

The following options are supported by `easy` handles in `xCurl`.

- CURLOPT_VERBOSE
- CURLOPT_HEADER
- CURLOPT_NOBODY
- CURLOPT_FAILONERROR
- CURLOPT_UPLOAD
- CURLOPT_PUT
- CURLOPT_ACCEPT_ENCODING
- CURLOPT_TRANSFER_ENCODING
- CURLOPT_FOLLOWLOCATION
- CURLOPT_MAXREDIRS
- CURLOPT_POST
- CURLOPT_COPYPOSTFIELDS
- CURLOPT_POSTFIELDS
- CURLOPT_POSTFIELDSIZE
- CURLOPT_POSTFIELDSIZE_LARGE
- CURLOPT_REFERER
- CURLOPT_USERAGENT
- CURLOPT_HTTPHEADER
- CURLOPT_HTTPGET
- CURLOPT_HTTP_VERSION
- CURLOPT_CUSTOMREQUEST
- CURLOPT_HEADERDATA
- CURLOPT_ERRORBUFFER
- CURLOPT_WRITEDATA
- CURLOPT_READDATA
- CURLOPT_INFILESIZE
- CURLOPT_INFILESIZE_LARGE
- CURLOPT_CURLU
- CURLOPT_URL
- CURLOPT_PORT
- CURLOPT_TIMEOUT
- CURLOPT_TIMEOUT_MS
- CURLOPT_CONNECTTIMEOUT
- CURLOPT_CONNECTTIMEOUT_MS
- CURLOPT_DEBUGFUNCTION
- CURLOPT_DEBUGDATA
- CURLOPT_HEADERFUNCTION
- CURLOPT_WRITEFUNCTION
- CURLOPT_READFUNCTION
- CURLOPT_SSLCERT
- CURLOPT_SSL_VERIFYPEER
- CURLOPT_SSL_VERIFYHOST
- CURLOPT_BUFFERSIZE
- CURLOPT_UPLOAD_BUFFERSIZE
- CURLOPT_PRIVATE
- CURLOPT_IGNORE_CONTENT_LENGTH
- CURLOPT_HTTP_TRANSFER_DECODING
- CURLOPT_HTTP_CONTENT_DECODING

## Unsupported functionality

### Sockets and fd_set

`xCurl` doesn't expose the underlying socket that's used for transport. Therefore, `xCurl` does not implement any option and API that would be used for socket operations. This also removes the ability to use `fd_sets` to wait on data to arrive through `select` and `poll`. To wait for work to arrive, use `curl_multi_wait` and`curl_multi_poll`.

The following APIs are not present in `xCurl`

- `curl_easy_send`
- `curl_easy_recv`
- `curl_multi_socket`
- `curl_multi_socket_action`
- `curl_multi_socket_all`
- `curl_multi_assign`
- `curl_multi_fdset`

The following options have no effect.

- CURLOPT_LOCALPORT
- CURLOPT_CONNECT_ONLY
- CURLOPT_SOCKOPTFUNCTION
- CURLOPT_SOCKOPTDATA
- CURLOPT_OPENSOCKETFUNCTION
- CURLOPT_OPENSOCKETDATA
- CURLOPT_CLOSESOCKETFUNCTION
- CURLOPT_CLOSESOCKETDATA
- CURLOPT_XOAUTH2_BEARER
- CURLINFO_LASTSOCKET
- CURLINFO_ACTIVESOCKET
- CURLMOPT_SOCKETFUNCTION
- CURLMOPT_SOCKETDATA
- CURLMOPT_PIPELINING
- CURLMOPT_PUSHFUNCTION

### CURL Share

The `CURL` `Share` interface is not implemented.

### Pause and resume transfers

This feature is currently unsupported. Returning CURL_WRITEFUNC_PAUSE or CURL_READFUNC_PAUSE from a callback results in an aborted operation that can't be resumed.

## See also

 [libCurl API](https://curl.haxx.se/libcurl/c/)

 [Setting up web services at Partner Center (NDA topic)](../../../live/features/s2s-auth-calls/custom-service-config/web-services/live-web-services.md)

 [Fiddler on Xbox One consoles](../tools/fiddler-setup-networking.md)