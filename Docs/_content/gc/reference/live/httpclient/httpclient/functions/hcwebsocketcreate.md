---
author: joannaleecy
title: HCWebSocketCreate
description: Creates an WebSocket handle.
kindex: HCWebSocketCreate
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCWebSocketCreate  

Creates an WebSocket handle.  

## Syntax  
  
```cpp
HRESULT HCWebSocketCreate(  
         HCWebsocketHandle* websocket,  
         HCWebSocketMessageFunction messageFunc,  
         HCWebSocketBinaryMessageFunction binaryMessageFunc,  
         HCWebSocketCloseEventFunction closeFunc,  
         void* functionContext  
)  
```  
  
### Parameters  
  
*websocket* &nbsp;&nbsp;\_Out\_  
Type: HCWebsocketHandle*  
  
The handle of the websocket.  
  
*messageFunc* &nbsp;&nbsp;\_In\_opt\_  
Type: HCWebSocketMessageFunction  
  
A pointer to the message handling callback to use, or a null pointer to remove.  
  
*binaryMessageFunc* &nbsp;&nbsp;\_In\_opt\_  
Type: HCWebSocketBinaryMessageFunction  
  
A pointer to the binary message handling callback to use, or a null pointer to remove.  
  
*closeFunc* &nbsp;&nbsp;\_In\_opt\_  
Type: HCWebSocketCloseEventFunction  
  
A pointer to the close callback to use, or a null pointer to remove.  
  
*functionContext* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Client context to pass to callback function.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
WebSocket usage:<br /> Create a WebSocket handle using HCWebSocketCreate()<br /> Call HCWebSocketSetProxyUri() and HCWebSocketSetHeader() to prepare the HCWebsocketHandle<br /> Call HCWebSocketConnectAsync() to connect the WebSocket using the HCWebsocketHandle.<br /> Call HCWebSocketSendMessageAsync() to send a message to the WebSocket using the HCWebsocketHandle.<br /> Call HCWebSocketDisconnect() to disconnect the WebSocket using the HCWebsocketHandle.<br /> Call HCWebSocketCloseHandle() when done with the HCWebsocketHandle to free the associated memory<br />
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  