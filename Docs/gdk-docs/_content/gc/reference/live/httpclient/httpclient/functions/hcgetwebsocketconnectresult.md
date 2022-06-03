---
author: joannaleecy
title: HCGetWebSocketConnectResult
description: Gets the result for HCGetWebSocketConnectResult.
kindex: HCGetWebSocketConnectResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCGetWebSocketConnectResult  

Gets the result for HCGetWebSocketConnectResult.  

## Syntax  
  
```cpp
HRESULT HCGetWebSocketConnectResult(  
         XAsyncBlock* asyncBlock,  
         WebSocketCompletionResult* result  
)  
```  
  
### Parameters  
  
*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: XAsyncBlock*  
  
The XAsyncBlock that defines the async operation.  
  
*result* &nbsp;&nbsp;\_In\_  
Type: [WebSocketCompletionResult*](../structs/websocketcompletionresult.md)  
  
Pointer to the result payload.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  