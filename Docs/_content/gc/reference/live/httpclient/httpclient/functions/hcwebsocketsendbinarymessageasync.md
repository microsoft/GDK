---
author: joannaleecy
title: HCWebSocketSendBinaryMessageAsync
description: Send binary message to the WebSocket.
kindex: HCWebSocketSendBinaryMessageAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCWebSocketSendBinaryMessageAsync  

Send binary message to the WebSocket.  

## Syntax  
  
```cpp
HRESULT HCWebSocketSendBinaryMessageAsync(  
         HCWebsocketHandle websocket,  
         const uint8_t* payloadBytes,  
         uint32_t payloadSize,  
         XAsyncBlock* asyncBlock  
)  
```  
  
### Parameters  
  
*websocket* &nbsp;&nbsp;\_In\_  
Type: HCWebsocketHandle  
  
Handle to the WebSocket.  
  
*payloadBytes* &nbsp;&nbsp;\_In\_reads\_bytes\_(payloadSize)  
Type: uint8_t*  
  
Binary data to send in byte buffer.  
  
*payloadSize* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
Size of byte buffer.  
  
*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: XAsyncBlock*  
  
The AsyncBlock that defines the async operation.  
  
  
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
  
  