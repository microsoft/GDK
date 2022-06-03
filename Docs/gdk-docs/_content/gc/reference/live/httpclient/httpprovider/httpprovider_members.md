---
author: joannaleecy
title: httpProvider (contents)
description: HttpProvider API
kindex: httpProvider
ms.author: migreen
ms.topic: navigation
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# httpProvider  



  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [HCGetHttpCallPerformFunction](functions/hcgethttpcallperformfunction.md) | Returns the current HCCallPerformFunction callback which implements the HTTP perform function on the current platform. |  
| [HCGetWebSocketFunctions](functions/hcgetwebsocketfunctions.md) | Gets the functions that implement the WebSocket functions. |  
| [HCHttpCallGetContext](functions/hchttpcallgetcontext.md) | Gets the context pointer attached to this call object. |  
| [HCHttpCallRequestGetHeader](functions/hchttpcallrequestgetheader.md) | Get a request header for the HTTP call for a given header name. |  
| [HCHttpCallRequestGetHeaderAtIndex](functions/hchttpcallrequestgetheaderatindex.md) | Gets the request headers at specific zero based index in the HTTP call. |  
| [HCHttpCallRequestGetNumHeaders](functions/hchttpcallrequestgetnumheaders.md) | Gets the number of request headers in the HTTP call. |  
| [HCHttpCallRequestGetRequestBodyBytes](functions/hchttpcallrequestgetrequestbodybytes.md) | Get the request body bytes of the HTTP call. |  
| [HCHttpCallRequestGetRequestBodyReadFunction](functions/hchttpcallrequestgetrequestbodyreadfunction.md) | Get the function used by the HTTP call to read the request body |  
| [HCHttpCallRequestGetRequestBodyString](functions/hchttpcallrequestgetrequestbodystring.md) | Get the request body bytes of the HTTP call. |  
| [HCHttpCallRequestGetRetryAllowed](functions/hchttpcallrequestgetretryallowed.md) | Gets if retry is allowed for this HTTP call. |  
| [HCHttpCallRequestGetRetryCacheId](functions/hchttpcallrequestgetretrycacheid.md) | Gets the ID number of this REST endpoint used to cache the Retry-After header for fast fail. |  
| [HCHttpCallRequestGetRetryDelay](functions/hchttpcallrequestgetretrydelay.md) | Gets the HTTP retry delay in seconds. The default and minimum delay is 2 seconds. |  
| [HCHttpCallRequestGetTimeout](functions/hchttpcallrequestgettimeout.md) | Gets the timeout for this HTTP call. |  
| [HCHttpCallRequestGetTimeoutWindow](functions/hchttpcallrequestgettimeoutwindow.md) | Sets the HTTP timeout window in seconds. |  
| [HCHttpCallRequestGetUrl](functions/hchttpcallrequestgeturl.md) | Gets the url and method for the HTTP call. |  
| [HCHttpCallResponseAppendResponseBodyBytes](functions/hchttpcallresponseappendresponsebodybytes.md) | Appends to the response body byte buffer of the HTTP call. If a custom write callback was previously set on this call handle using HCHttpCallResponseSetResponseBodyWriteFunction, this operation will fail as these are mutually exclusive. |  
| [HCHttpCallResponseSetHeader](functions/hchttpcallresponsesetheader.md) | Set a response header for the HTTP call. |  
| [HCHttpCallResponseSetHeaderWithLength](functions/hchttpcallresponsesetheaderwithlength.md) | Set a response header for the HTTP call. |  
| [HCHttpCallResponseSetNetworkErrorCode](functions/hchttpcallresponsesetnetworkerrorcode.md) | Set the network error code of the HTTP call. |  
| [HCHttpCallResponseSetPlatformNetworkErrorMessage](functions/hchttpcallresponsesetplatformnetworkerrormessage.md) | Set the platform network error message of the HTTP call. |  
| [HCHttpCallResponseSetResponseBodyBytes](functions/hchttpcallresponsesetresponsebodybytes.md) | Set the response body byte buffer of the HTTP call. If a custom write callback was previously set on this call handle using HCHttpCallResponseSetResponseBodyWriteFunction, this operation will fail as these are mutually exclusive. |  
| [HCHttpCallResponseGetResponseBodyWriteFunction](functions/hchttpcallresponsegetresponsebodywritefunction.md) | Get the function used by the HTTP call to write the response body. |  
| [HCHttpCallResponseSetStatusCode](functions/hchttpcallresponsesetstatuscode.md) | Set the HTTP status code of the HTTP call response. |  
| [HCHttpCallSetContext](functions/hchttpcallsetcontext.md) | Sets the context pointer attached to this call object. |  
| [HCSetHttpCallPerformFunction](functions/hcsethttpcallperformfunction.md) | Optionally allows the caller to implement the HTTP perform function. |  
| [HCSetWebSocketFunctions](functions/hcsetwebsocketfunctions.md) | Optionally allows the caller to implement the WebSocket functions. |  
| [HCWebSocketGetHeader](functions/hcwebsocketgetheader.md) | Get a header for the WebSocket. |  
| [HCWebSocketGetHeaderAtIndex](functions/hcwebsocketgetheaderatindex.md) | Gets the headers at specific zero based index in the WebSocket. |  
| [HCWebSocketGetNumHeaders](functions/hcwebsocketgetnumheaders.md) | Gets the number of headers in the WebSocket. |  
| [HCWebSocketGetProxyUri](functions/hcwebsocketgetproxyuri.md) | Get the proxy URI for the WebSocket. |  
