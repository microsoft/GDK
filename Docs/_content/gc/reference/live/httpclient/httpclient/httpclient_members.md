---
author: joannaleecy
title: httpClient (contents)
description: HttpClient API
kindex: httpClient
ms.author: migreen
ms.topic: navigation
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# httpClient  



  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [HCAddCallRoutedHandler](functions/hcaddcallroutedhandler.md) | Adds a callback to be invoked on intermediate http calls in order to debug or trace the traffic. |  
| [HCAddWebSocketRoutedHandler](functions/hcaddwebsocketroutedhandler.md) | Adds a callback to be invoked on websocket traffic in order to debug or trace the traffic. |  
| [HCCleanup](functions/hccleanup.md) | Immediately reclaims all resources associated with the library. If you called HCMemSetFunctions(), call this before shutting down your app's memory manager. |  
| [HCCleanupAsync](functions/hccleanupasync.md) | Reclaims all resources associated with the library. If you called HCMemSetFunctions(), call this before shutting down your app's memory manager. |  
| [HCGetLibVersion](functions/hcgetlibversion.md) | Returns the version of the library. |  
| [HCGetWebSocketConnectResult](functions/hcgetwebsocketconnectresult.md) | Gets the result for HCGetWebSocketConnectResult. |  
| [HCGetWebSocketSendMessageResult](functions/hcgetwebsocketsendmessageresult.md) | Gets the result from HCWebSocketSendMessage. |  
| [HCHttpCallCloseHandle](functions/hchttpcallclosehandle.md) | Decrements the reference count on the call object. |  
| [HCHttpCallCreate](functions/hchttpcallcreate.md) | Creates an HTTP call handle. |  
| [HCHttpCallDuplicateHandle](functions/hchttpcallduplicatehandle.md) | Duplicates the HCCallHandle object. |  
| [HCHttpCallGetId](functions/hchttpcallgetid.md) | Returns a unique uint64_t which identifies this HTTP call object. |  
| [HCHttpCallGetRequestUrl](functions/hchttpcallgetrequesturl.md) | Gets the request url for the HTTP call. |  
| [HCHttpCallPerformAsync](functions/hchttpcallperformasync.md) | Perform HTTP call using the HCCallHandle. |  
| [HCHttpCallRequestSetHeader](functions/hchttpcallrequestsetheader.md) | Set a request header for the HTTP call. |  
| [HCHttpCallRequestSetRequestBodyBytes](functions/hchttpcallrequestsetrequestbodybytes.md) | Set the request body bytes of the HTTP call. This API operation is mutually exclusive with HCHttpCallRequestSetRequestBodyReadFunction and will result in any custom read callbacks that were previously set on this call handle to be ignored. |  
| [HCHttpCallRequestSetRequestBodyReadFunction](functions/hchttpcallrequestsetrequestbodyreadfunction.md) | Sets a custom callback function that will be used to read the request body when the HTTP call is performed. If a custom read callback is used, any request body data previously set by HCHttpCallRequestSetRequestBodyBytes or HCHttpCallRequestSetRequestBodyString is ignored making these API operations mutually exclusive. |  
| [HCHttpCallRequestSetRequestBodyString](functions/hchttpcallrequestsetrequestbodystring.md) | Set the request body string of the HTTP call. This API operation is mutually exclusive with HCHttpCallRequestSetRequestBodyReadFunction and will result in any custom read callbacks that were previously set on this call handle to be ignored. |  
| [HCHttpCallRequestSetRetryAllowed](functions/hchttpcallrequestsetretryallowed.md) | Sets if retry is allowed for this HTTP call. |  
| [HCHttpCallRequestSetRetryCacheId](functions/hchttpcallrequestsetretrycacheid.md) | ID number of this REST endpoint used to cache the Retry-After header for fast fail. |  
| [HCHttpCallRequestSetRetryDelay](functions/hchttpcallrequestsetretrydelay.md) | Sets the HTTP retry delay in seconds. The default and minimum delay is 2 seconds. |  
| [HCHttpCallRequestSetSSLValidation](functions/hchttpcallrequestsetsslvalidation.md) | Enables or disables SSL server certificate validation for this specific HTTP call. |  
| [HCHttpCallRequestSetTimeout](functions/hchttpcallrequestsettimeout.md) | Sets the timeout for this HTTP call. |  
| [HCHttpCallRequestSetTimeoutWindow](functions/hchttpcallrequestsettimeoutwindow.md) | Sets the HTTP timeout window in seconds. |  
| [HCHttpCallRequestSetUrl](functions/hchttpcallrequestseturl.md) | Sets the url and method for the HTTP call. |  
| [HCHttpCallResponseGetHeader](functions/hchttpcallresponsegetheader.md) | Get a response header for the HTTP call for a given header name. |  
| [HCHttpCallResponseGetHeaderAtIndex](functions/hchttpcallresponsegetheaderatindex.md) | Gets the response headers at specific zero based index in the HTTP call. |  
| [HCHttpCallResponseGetNetworkErrorCode](functions/hchttpcallresponsegetnetworkerrorcode.md) | Get the network error code of the HTTP call. |  
| [HCHttpCallResponseGetNumHeaders](functions/hchttpcallresponsegetnumheaders.md) | Gets the number of response headers in the HTTP call. |  
| [HCHttpCallResponseGetPlatformNetworkErrorMessage](functions/hchttpcallresponsegetplatformnetworkerrormessage.md) | Get the platform network error message of the HTTP call. |  
| [HCHttpCallResponseGetResponseBodyBytes](functions/hchttpcallresponsegetresponsebodybytes.md) | Get the response body buffer of the HTTP call. This API operation will fail if a custom write callback was set on this call handle using HCHttpCallResponseSetResponseBodyWriteFunction. |  
| [HCHttpCallResponseGetResponseBodyBytesSize](functions/hchttpcallresponsegetresponsebodybytessize.md) | Get the response body buffer size of the HTTP call. This API operation will fail if a custom write callback was set on this call handle using HCHttpCallResponseSetResponseBodyWriteFunction. |  
| [HCHttpCallResponseGetResponseString](functions/hchttpcallresponsegetresponsestring.md) | Get the response body string of the HTTP call. This API operation will fail if a custom write callback was set on this call handle using HCHttpCallResponseSetResponseBodyWriteFunction. |  
| [HCHttpCallResponseGetStatusCode](functions/hchttpcallresponsegetstatuscode.md) | Get the HTTP status code of the HTTP call response. |  
| [HCHttpCallResponseSetResponseBodyWriteFunction](functions/hchttpcallresponsesetresponsebodywritefunction.md) | Sets a custom callback function that will be used to write the response body when the HTTP call is performed. Using a custom write callback will cause subsequent calls to HCHttpCallResponseGetResponseBodyBytesSize, HCHttpCallResponseGetResponseBodyBytes, and HCHttpCallGetResponseBodyString to fail as these are mutually exclusive. |  
| [HCHttpCallSetTracing](functions/hchttpcallsettracing.md) | Enables or disables tracing for this specific HTTP call. |  
| [HCInitialize](functions/hcinitialize.md) | Initializes the library instance. |  
| [HCMemGetFunctions](functions/hcmemgetfunctions.md) | Gets the memory hook functions to allow callers to control route memory allocations to their own memory manager. |  
| [HCMemSetFunctions](functions/hcmemsetfunctions.md) | Optionally sets the memory hook functions to allow callers to control route memory allocations to their own memory manager. |  
| [HCRemoveCallRoutedHandler](functions/hcremovecallroutedhandler.md) | Removes a previously added HCCallRoutedHandler. |  
| [HCRemoveWebSocketRoutedHandler](functions/hcremovewebsocketroutedhandler.md) | Removes a previously added HCWebSocketRoutedHandler. |  
| [HCSetGlobalProxy](functions/hcsetglobalproxy.md) | Manually sets an explicit proxy address. |  
| [HCWebSocketCloseHandle](functions/hcwebsocketclosehandle.md) | Decrements the reference count on the WebSocket object. |  
| [HCWebSocketConnectAsync](functions/hcwebsocketconnectasync.md) | Connects to the WebSocket. |  
| [HCWebSocketCreate](functions/hcwebsocketcreate.md) | Creates an WebSocket handle. |  
| [HCWebSocketDisconnect](functions/hcwebsocketdisconnect.md) | Disconnects / closes the WebSocket. |  
| [HCWebSocketDuplicateHandle](functions/hcwebsocketduplicatehandle.md) | Increments the reference count on the call object. |  
| [HCWebSocketGetEventFunctions](functions/hcwebsocketgeteventfunctions.md) | Gets the WebSocket functions to allow callers to respond to incoming messages and WebSocket close events. |  
| [HCWebSocketSendBinaryMessageAsync](functions/hcwebsocketsendbinarymessageasync.md) | Send binary message to the WebSocket. |  
| [HCWebSocketSendMessageAsync](functions/hcwebsocketsendmessageasync.md) | Send message the WebSocket |  
| [HCWebSocketSetHeader](functions/hcwebsocketsetheader.md) | Set a header for the WebSocket. |  
| [HCWebSocketSetProxyDecryptsHttps](functions/hcwebsocketsetproxydecryptshttps.md) | Allows proxy server to decrypt and inspect traffic; should be used only for debugging purposes This must be called after calling HCWebSocketSetProxyUri. Only applies to Win32 non-GDK builds |  
| [HCWebSocketSetProxyUri](functions/hcwebsocketsetproxyuri.md) | Set the proxy URI for the WebSocket. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [HCInitArgs](structs/hcinitargs.md) | Used to wrap the JavaVM and ApplicationContext on Android devices. |  
| [HCInitArgs](structs/hcinitargs_2.md) | Dummy init args used by non-Android devices. |  
| [WebSocketCompletionResult](structs/websocketcompletionresult.md) | Used by HCWebSocketConnectAsync() and HCWebSocketSendMessageAsync(). |  
