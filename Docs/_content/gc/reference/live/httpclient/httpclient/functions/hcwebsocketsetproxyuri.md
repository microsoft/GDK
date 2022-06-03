---
author: joannaleecy
title: HCWebSocketSetProxyUri
description: Set the proxy URI for the WebSocket.
kindex: HCWebSocketSetProxyUri
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCWebSocketSetProxyUri  

Set the proxy URI for the WebSocket.  

## Syntax  
  
```cpp
HRESULT HCWebSocketSetProxyUri(  
         HCWebsocketHandle websocket,  
         const char* proxyUri  
)  
```  
  
### Parameters  
  
*websocket* &nbsp;&nbsp;\_In\_  
Type: HCWebsocketHandle  
  
The handle of the WebSocket.  
  
*proxyUri* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The UTF-8 encoded proxy URI for the WebSocket.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Remarks  
  
This must be called prior to calling HCWebSocketConnectAsync.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  