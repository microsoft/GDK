---
author: joannaleecy
title: HCWebSocketSendMessageAsync
description: Send message the WebSocket
kindex: HCWebSocketSendMessageAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCWebSocketSendMessageAsync  

Send message the WebSocket  

## Syntax  
  
```cpp
HRESULT HCWebSocketSendMessageAsync(  
         HCWebsocketHandle websocket,  
         const char* message,  
         XAsyncBlock* asyncBlock  
)  
```  
  
### Parameters  
  
*websocket* &nbsp;&nbsp;\_In\_  
Type: HCWebsocketHandle  
  
Handle to the WebSocket.  
  
*message* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The UTF-8 encoded message to send.  
  
*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: XAsyncBlock*  
  
The XAsyncBlock that defines the async operation.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
To get the result, first call HCGetWebSocketSendMessageResult inside the AsyncBlock callback or after the AsyncBlock is complete.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  