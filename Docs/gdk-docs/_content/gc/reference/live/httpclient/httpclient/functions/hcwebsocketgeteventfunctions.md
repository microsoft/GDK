---
author: joannaleecy
title: HCWebSocketGetEventFunctions
description: Gets the WebSocket functions to allow callers to respond to incoming messages and WebSocket close events.
kindex: HCWebSocketGetEventFunctions
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCWebSocketGetEventFunctions  

Gets the WebSocket functions to allow callers to respond to incoming messages and WebSocket close events.  

## Syntax  
  
```cpp
HRESULT HCWebSocketGetEventFunctions(  
         HCWebsocketHandle websocket,  
         HCWebSocketMessageFunction* messageFunc,  
         HCWebSocketBinaryMessageFunction* binaryMessageFunc,  
         HCWebSocketCloseEventFunction* closeFunc,  
         void** functionContext  
)  
```  
  
### Parameters  
  
*websocket* &nbsp;&nbsp;\_In\_  
Type: HCWebsocketHandle  
  
The handle of the websocket.  
  
*messageFunc* &nbsp;&nbsp;\_Out\_opt\_  
Type: HCWebSocketMessageFunction*  
  
A pointer to the message handling callback to use, or a null pointer to remove.  
  
*binaryMessageFunc* &nbsp;&nbsp;\_Out\_opt\_  
Type: HCWebSocketBinaryMessageFunction*  
  
A pointer to the binary message handling callback to use, or a null pointer to remove.  
  
*closeFunc* &nbsp;&nbsp;\_Out\_opt\_  
Type: HCWebSocketCloseEventFunction*  
  
A pointer to the close callback to use, or a null pointer to remove.  
  
*functionContext* &nbsp;&nbsp;\_Out\_  
Type: void**  
  
Client context to pass to callback function.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_HC_NOT_INITIALISED, or E_FAIL.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  