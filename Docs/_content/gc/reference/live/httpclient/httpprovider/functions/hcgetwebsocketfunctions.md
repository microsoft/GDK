---
author: joannaleecy
title: HCGetWebSocketFunctions
description: Gets the functions that implement the WebSocket functions.
kindex: HCGetWebSocketFunctions
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCGetWebSocketFunctions  

Gets the functions that implement the WebSocket functions.  

## Syntax  
  
```cpp
HRESULT HCGetWebSocketFunctions(  
         HCWebSocketConnectFunction* websocketConnectFunc,  
         HCWebSocketSendMessageFunction* websocketSendMessageFunc,  
         HCWebSocketSendBinaryMessageFunction* websocketSendBinaryMessageFunc,  
         HCWebSocketDisconnectFunction* websocketDisconnectFunc,  
         void** context  
)  
```  
  
### Parameters  
  
*websocketConnectFunc* &nbsp;&nbsp;\_Out\_  
Type: HCWebSocketConnectFunction*  
  
A callback that implements WebSocket connect function as desired.  
  
*websocketSendMessageFunc* &nbsp;&nbsp;\_Out\_  
Type: HCWebSocketSendMessageFunction*  
  
A callback that implements WebSocket send message function as desired.  
  
*websocketSendBinaryMessageFunc* &nbsp;&nbsp;\_Out\_  
Type: HCWebSocketSendBinaryMessageFunction*  
  
A callback that implements WebSocket send binary message function as desired.  
  
*websocketDisconnectFunc* &nbsp;&nbsp;\_Out\_  
Type: HCWebSocketDisconnectFunction*  
  
A callback that implements WebSocket disconnect function as desired.  
  
*context* &nbsp;&nbsp;\_Out\_  
Type: void**  
  
The context pointer for the callbacks.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, or E_FAIL.
  
## Requirements  
  
**Header:** httpProvider.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpProvider](../httpprovider_members.md)  
  
  