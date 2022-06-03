---
author: joannaleecy
title: HCWebSocketSetHeader
description: Set a header for the WebSocket.
kindex: HCWebSocketSetHeader
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCWebSocketSetHeader  

Set a header for the WebSocket.  

## Syntax  
  
```cpp
HRESULT HCWebSocketSetHeader(  
         HCWebsocketHandle websocket,  
         const char* headerName,  
         const char* headerValue  
)  
```  
  
### Parameters  
  
*websocket* &nbsp;&nbsp;\_In\_  
Type: HCWebsocketHandle  
  
The handle of the WebSocket.  
  
*headerName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
UTF-8 encoded header name for the WebSocket.  
  
*headerValue* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
UTF-8 encoded header value for the WebSocket.  
  
  
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
  
  