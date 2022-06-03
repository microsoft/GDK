---
author: joannaleecy
title: HCWebSocketConnectAsync
description: Connects to the WebSocket.
kindex: HCWebSocketConnectAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCWebSocketConnectAsync  

Connects to the WebSocket.  

## Syntax  
  
```cpp
HRESULT HCWebSocketConnectAsync(  
         const char* uri,  
         const char* subProtocol,  
         HCWebsocketHandle websocket,  
         XAsyncBlock* asyncBlock  
)  
```  
  
### Parameters  
  
*uri* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The UTF-8 encoded URI to connect to.  
  
*subProtocol* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The UTF-8 encoded subProtocol to connect to.  
  
*websocket* &nbsp;&nbsp;\_In\_  
Type: HCWebsocketHandle  
  
The handle of the WebSocket.  
  
*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: XAsyncBlock*  
  
The XAsyncBlock that defines the async operation.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Remarks  
  
To get the result, first call HCGetWebSocketConnectResult inside the AsyncBlock callback or after the AsyncBlock is complete. On UWP and XDK, the connection thread is owned and controlled by Windows::Networking::Sockets::MessageWebSocket. On Win32, iOS, and Android, all background work (including initial connection process) will be added to the queue in the provided XAsyncBlock. LibHttpClient will create a reference to that queue but it is the responsibility of the caller to dispatch that queue for as long as the websocket connection is active. Note that work for HCWebSocketSendMessageAsync calls can be assigned to a separate queue if desired.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  