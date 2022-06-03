---
author: joannaleecy
title: HCSetWebSocketFunctions
description: Optionally allows the caller to implement the WebSocket functions.
kindex: HCSetWebSocketFunctions
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCSetWebSocketFunctions  

Optionally allows the caller to implement the WebSocket functions.  

## Syntax  
  
```cpp
HRESULT HCSetWebSocketFunctions(  
         HCWebSocketConnectFunction websocketConnectFunc,  
         HCWebSocketSendMessageFunction websocketSendMessageFunc,  
         HCWebSocketSendBinaryMessageFunction websocketSendBinaryMessageFunc,  
         HCWebSocketDisconnectFunction websocketDisconnectFunc,  
         void* context  
)  
```  
  
### Parameters  
  
*websocketConnectFunc* &nbsp;&nbsp;\_In\_  
Type: HCWebSocketConnectFunction  
  
A callback that implements WebSocket connect function as desired. Pass in nullptr to use the default implementation based on the current platform.  
  
*websocketSendMessageFunc* &nbsp;&nbsp;\_In\_  
Type: HCWebSocketSendMessageFunction  
  
A callback that implements WebSocket send message function as desired. Pass in nullptr to use the default implementation based on the current platform.  
  
*websocketSendBinaryMessageFunc* &nbsp;&nbsp;\_In\_  
Type: HCWebSocketSendBinaryMessageFunction  
  
A callback that implements WebSocket send binary message function as desired. Pass in nullptr to use the default implementation based on the current platform.  
  
*websocketDisconnectFunc* &nbsp;&nbsp;\_In\_  
Type: HCWebSocketDisconnectFunction  
  
A callback that implements WebSocket disconnect function as desired. Pass in nullptr to use the default implementation based on the current platform.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
The context pointer for the callbacks.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, or E_FAIL.
  
## Requirements  
  
**Header:** httpProvider.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpProvider](../httpprovider_members.md)  
  
  