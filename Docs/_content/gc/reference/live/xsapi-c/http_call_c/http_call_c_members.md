---
author: joannaleecy
title: http_call_c (contents)
description: Http Call C API
kindex: http_call_c
ms.author: migreen
ms.topic: navigation
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# http_call_c  



  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XblHttpCallResponseBodyType](enums/xblhttpcallresponsebodytype.md) | Defines the response body type when reading the results of an HTTP call. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XblHttpCallCloseHandle](functions/xblhttpcallclosehandle.md) | Decrements the reference count on the call object. |  
| [XblHttpCallCreate](functions/xblhttpcallcreate.md) | Creates an HTTP call handle. |  
| [XblHttpCallDuplicateHandle](functions/xblhttpcallduplicatehandle.md) | Duplicates the XblHttpCallHandle object. |  
| [XblHttpCallGetHeader](functions/xblhttpcallgetheader.md) | Get a response header for the HTTP call for a given header name. |  
| [XblHttpCallGetHeaderAtIndex](functions/xblhttpcallgetheaderatindex.md) | Gets the response headers at specific zero based index in the HTTP call. |  
| [XblHttpCallGetNetworkErrorCode](functions/xblhttpcallgetnetworkerrorcode.md) | Get the network error code of the HTTP call. |  
| [XblHttpCallGetNumHeaders](functions/xblhttpcallgetnumheaders.md) | Gets the number of response headers in the HTTP call. |  
| [XblHttpCallGetPlatformNetworkErrorMessage](functions/xblhttpcallgetplatformnetworkerrormessage.md) | Get the platform network error message of the HTTP call. |  
| [XblHttpCallGetRequestUrl](functions/xblhttpcallgetrequesturl.md) | Gets the request url for the HTTP call. |  
| [XblHttpCallGetResponseBodyBytes](functions/xblhttpcallgetresponsebodybytes.md) | Get the response body buffer of the HTTP call. |  
| [XblHttpCallGetResponseBodyBytesSize](functions/xblhttpcallgetresponsebodybytessize.md) | Get the response body buffer size of the HTTP call. |  
| [XblHttpCallGetResponseString](functions/xblhttpcallgetresponsestring.md) | Get the response body string of the HTTP call. |  
| [XblHttpCallGetStatusCode](functions/xblhttpcallgetstatuscode.md) | Get the HTTP status code of the HTTP call response. |  
| [XblHttpCallPerformAsync](functions/xblhttpcallperformasync.md) | Perform an HTTP call using the XblHttpCallHandle. |  
| [XblHttpCallRequestSetHeader](functions/xblhttpcallrequestsetheader.md) | Set a request header for the HTTP call. |  
| [XblHttpCallRequestSetLongHttpCall](functions/xblhttpcallrequestsetlonghttpcall.md) | Sets a flag which defines the HTTP call as long or not. |  
| [XblHttpCallRequestSetRequestBodyBytes](functions/xblhttpcallrequestsetrequestbodybytes.md) | Set the request body bytes of the HTTP call. |  
| [XblHttpCallRequestSetRequestBodyString](functions/xblhttpcallrequestsetrequestbodystring.md) | Set the request body string of the HTTP call. |  
| [XblHttpCallRequestSetRetryAllowed](functions/xblhttpcallrequestsetretryallowed.md) | Sets if retry is allowed for this HTTP call. |  
| [XblHttpCallRequestSetRetryCacheId](functions/xblhttpcallrequestsetretrycacheid.md) | ID number of this REST endpoint used to cache the Retry-After header for fast fail. |  
| [XblHttpCallSetTracing](functions/xblhttpcallsettracing.md) | Enables or disables tracing for this specific HTTP call. |  
  
## Handles  
  
| Handle | Description |  
| --- | --- |  
| [XblHttpCallHandle](handles/xblhttpcallhandle.md) | A handle to an HTTP call. |  
