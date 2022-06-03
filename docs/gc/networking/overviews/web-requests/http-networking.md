---
author: M-Stahl
title: Web requests overview
description: Describes how to send and receive web requests in a Microsoft Game Development Kit (GDK) title.
kindex: HTTP request, web request, networking
ms.author: joanlee
ms.topic: conceptual
edited: 07/28/2021
security: public
---

# Web requests overview

This topic provides an overview of Hypertext Transfer Protocol (HTTP) and WebSocket web requests for Microsoft Game Development Kit (GDK) titles.

Starting with the right API set makes it easier for you to implement secure communication that is compliant with Xbox Requirements (XRs). 

## Xbox consoles and Windows 10 PCs

We recommend the use of the following APIs to adhere to security requirements. They also help simplify the implementation of web requests.

| Use case | Recommended API |
| --- | --- |
| REST requests with Gaming Runtime Services (GRTS) style APIs | [Microsoft Xbox Live Service API (XSAPI)](#xsapi) |
| General purpose HTTP requests | [xCurl](#xcurl) |
| WebSocket requests | [libHttpClient](#libhttpclient) |

**Windows HTTP Services (WinHTTP)**

WinHTTP can also be used to create HTTP and WebSocket service endpoints on both PCs and Xbox consoles with no code changes. Because this API does not automatically handle all security best practices, make sure to read [Communication Security Overview (NDA topic)](../../../security/communication-security/communication-security-overview.md) and [WinHTTP overview](intro-winhttp.md) to learn how to ensure that your implementation is secure and robust.

The advantage of xCurl is that it handles security best practices, including certificate chain validation, and networking connectivity checks. This is the reason why we recommend xCurl for general purpose HTTP requests.

**NOTE:**

* When developing titles for Xbox consoles, you must use WinHTTP or xCurl. Custom HTTP stack implementations are not allowed. For more information, see **XR-134: Data Transfer Using Web Protocols** under **Security** in [Xbox Requirements for Xbox Console Games (NDA topic)](../../../policies/Console/certification-requirements.md).
* When developing titles for PCs, there are more options. For general purpose HTTP requests, you can also use __libCurl__ or any other HTTP stack directly with your Microsoft Game Development Kit (GDK) title.

<a id="xcurl"></a>

## xCurl

__xCurl__ is the recommended API for HTTP requests in Microsoft Game Development Kit (GDK) titles. It simplifies title development by adhering to all security best practices automatically. Since the API surface broadly matches [libCurl](https://curl.haxx.se/libcurl/), it also has libCurl's full flexibility and HTTP feature set.

To learn more about the __xCurl__ API and differences between __xCurl__ and __libCurl__, see [xCurl overview](intro-xcurl.md).


<a id="xsapi"></a>

## XSAPI

[Xbox Services API (XSAPI)](https://developer.microsoft.com/games/xbox/docs/gdk/atoc-xsapi-c) provides a generic REST wrapper that's fully compliant for Microsoft Game Development Kit (GDK) titles. This wrapper is straightforward to use and follows the Microsoft Game Development Kit (GDK) asynchronous API model.  If your title only needs to make REST HTTP requests, this is likely the simplest fully compliant interface to use.

1. Use [XblHttpCallCreate](../../../reference/live/xsapi-c/http_call_c/functions/xblhttpcallcreate.md) to create an HTTP handle to track your `REST` request.
1. Fill in the body and any additional configuration with one of the `XblHttpCallRequestSet*` functions.
1. Call [XblHttpCallPerformAsync](../../../reference/live/xsapi-c/http_call_c/functions/xblhttpcallperformasync.md) to make the request.
1. To retrieve the response, use one of the `XblHttpCallGet*` functions.
1. Close the handle by using [XblHttpCallCloseHandle](../../../reference/live/xsapi-c/http_call_c/functions/xblhttpcallclosehandle.md).
> [!NOTE]
> `XblHttpCallRequestSet*` and `XblHttpCallGet*` represent groups of functions to build HTTP requests and retrieve HTTP responses.
>
> - [XblHttpCallRequestSetHeader](../../../reference/live/xsapi-c/http_call_c/functions/xblhttpcallrequestsetheader.md)
> - [XblHttpCallRequestSetLongHttpCall](../../../reference/live/xsapi-c/http_call_c/functions/xblhttpcallrequestsetlonghttpcall.md)
> - [XblHttpCallRequestSetRequestBodyBytes](../../../reference/live/xsapi-c/http_call_c/functions/xblhttpcallrequestsetrequestbodybytes.md)
> - [XblHttpCallRequestSetRequestBodyString](../../../reference/live/xsapi-c/http_call_c/functions/xblhttpcallrequestsetrequestbodystring.md)
> - [XblHttpCallRequestSetRetryAllowed](../../../reference/live/xsapi-c/http_call_c/functions/xblhttpcallrequestsetretryallowed.md)
> - [XblHttpCallRequestSetRetryCacheId](../../../reference/live/xsapi-c/http_call_c/functions/xblhttpcallrequestsetretrycacheid.md)
>
> - [XblHttpCallGetHeader](../../../reference/live/xsapi-c/http_call_c/functions/xblhttpcallgetheader.md)
> - [XblHttpCallGetHeaderAtIndex](../../../reference/live/xsapi-c/http_call_c/functions/xblhttpcallgetheaderatindex.md)
> - [XblHttpCallGetNetworkErrorCode](../../../reference/live/xsapi-c/http_call_c/functions/xblhttpcallgetnetworkerrorcode.md)
> - [XblHttpCallGetNumHeaders](../../../reference/live/xsapi-c/http_call_c/functions/xblhttpcallgetnumheaders.md)
> - [XblHttpCallGetPlatformNetworkErrorMessage](../../../reference/live/xsapi-c/http_call_c/functions/xblhttpcallgetplatformnetworkerrormessage.md)
> - [XblHttpCallGetRequestUrl](../../../reference/live/xsapi-c/http_call_c/functions/xblhttpcallgetrequesturl.md)
> - [XblHttpCallGetResponseBodyBytes](../../../reference/live/xsapi-c/http_call_c/functions/xblhttpcallgetresponsebodybytes.md)
> - [XblHttpCallGetResponseBodyBytesSize](../../../reference/live/xsapi-c/http_call_c/functions/xblhttpcallgetresponsebodybytessize.md)
> - [XblHttpCallGetResponseString](../../../reference/live/xsapi-c/http_call_c/functions/xblhttpcallgetresponsestring.md)
> - [XblHttpCallGetStatusCode](../../../reference/live/xsapi-c/http_call_c/functions/xblhttpcallgetstatuscode.md)

<a id="libhttpclient"></a>

## libHttpClient

The [libHttpClient](https://github.com/Microsoft/libHttpClient) is designed enable two-way communication. It is an abstraction layer designed for use by Xbox Live Service API (XSAPI) to enable HTTP and WebSocket service endpoints. The API is in the Game Development Kit (GDK) as part of XSAPI.

## See also

 [Windows HTTP Services (WinHTTP)](/windows/desktop/winhttp/winhttp-start-page)

 [libcurl](https://curl.haxx.se/libcurl/)

 [Setting up web services at Partner Center (NDA topic)](../../../live/features/s2s-auth-calls/custom-service-config/web-services/live-web-services.md)

 [Fiddler on Xbox One consoles](../tools/fiddler-setup-networking.md)
 
 [Communication Security Overview (NDA topic)](../../../security/communication-security/communication-security-overview.md)