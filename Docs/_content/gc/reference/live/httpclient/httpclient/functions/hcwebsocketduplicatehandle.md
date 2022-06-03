---
author: joannaleecy
title: HCWebSocketDuplicateHandle
description: Increments the reference count on the call object.
kindex: HCWebSocketDuplicateHandle
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCWebSocketDuplicateHandle  

Increments the reference count on the call object.  

## Syntax  
  
```cpp
HCWebsocketHandle HCWebSocketDuplicateHandle(  
         HCWebsocketHandle websocket  
)  
```  
  
### Parameters  
  
*websocket* &nbsp;&nbsp;\_In\_  
Type: HCWebsocketHandle  
  
Handle to the WebSocket.  
  
  
### Return value  
Type: HCWebsocketHandle
  
Returns the duplicated handle.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  