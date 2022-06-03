---
author: joannaleecy
title: HCWebSocketGetNumHeaders
description: Gets the number of headers in the WebSocket.
kindex: HCWebSocketGetNumHeaders
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCWebSocketGetNumHeaders  

Gets the number of headers in the WebSocket.  

## Syntax  
  
```cpp
HRESULT HCWebSocketGetNumHeaders(  
         HCWebsocketHandle websocket,  
         uint32_t* numHeaders  
)  
```  
  
### Parameters  
  
*websocket* &nbsp;&nbsp;\_In\_  
Type: HCWebsocketHandle  
  
The handle of the WebSocket.  
  
*numHeaders* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
  
the number of headers in the WebSocket.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Requirements  
  
**Header:** httpProvider.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpProvider](../httpprovider_members.md)  
  
  