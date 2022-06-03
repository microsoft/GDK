---
author: joannaleecy
title: HCWebSocketCloseHandle
description: Decrements the reference count on the WebSocket object.
kindex: HCWebSocketCloseHandle
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCWebSocketCloseHandle  

Decrements the reference count on the WebSocket object.  

## Syntax  
  
```cpp
HRESULT HCWebSocketCloseHandle(  
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
  
## Remarks  
  
When the ref count is 0, HCWebSocketCloseHandle() will free the memory associated with the HCWebsocketHandle.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  