---
author: joannaleecy
title: WebSocketCompletionResult
description: Used by HCWebSocketConnectAsync() and HCWebSocketSendMessageAsync().
kindex: WebSocketCompletionResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# WebSocketCompletionResult  

Used by HCWebSocketConnectAsync() and HCWebSocketSendMessageAsync().  

## Syntax  
  
```cpp
typedef struct WebSocketCompletionResult {  
    HCWebsocketHandle websocket;  
    errorCode websocket;  
    uint32_t platformErrorCode;  
} WebSocketCompletionResult  
```
  
### Members  
  
*websocket*  
Type: HCWebsocketHandle  
  
The handle of the HTTP call.
  
*websocket*  
Type: errorCode  
  
The error code of the call. Possible values are S_OK, or E_FAIL.
  
*platformErrorCode*  
Type: uint32_t  
  
The platform specific network error code of the call to be used for tracing / debugging.
  
## Requirements  
  
**Header:** httpClient.h
  
## See also  
[httpClient](../httpclient_members.md)  
  
  