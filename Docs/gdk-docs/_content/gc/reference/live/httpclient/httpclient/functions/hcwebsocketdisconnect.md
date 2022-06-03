---
author: joannaleecy
title: HCWebSocketDisconnect
description: Disconnects / closes the WebSocket.
kindex: HCWebSocketDisconnect
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCWebSocketDisconnect  

Disconnects / closes the WebSocket.  

## Syntax  
  
```cpp
HRESULT HCWebSocketDisconnect(  
         HCWebsocketHandle websocket  
)  
```  
  
### Parameters  
  
*websocket* &nbsp;&nbsp;\_In\_  
Type: HCWebsocketHandle  
  
Handle to the WebSocket.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  