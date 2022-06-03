---
author: joannaleecy
title: HCWebSocketGetHeaderAtIndex
description: Gets the headers at specific zero based index in the WebSocket.
kindex: HCWebSocketGetHeaderAtIndex
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCWebSocketGetHeaderAtIndex  

Gets the headers at specific zero based index in the WebSocket.  

## Syntax  
  
```cpp
HRESULT HCWebSocketGetHeaderAtIndex(  
         HCWebsocketHandle websocket,  
         uint32_t headerIndex,  
         const char** headerName,  
         const char** headerValue  
)  
```  
  
### Parameters  
  
*websocket* &nbsp;&nbsp;\_In\_  
Type: HCWebsocketHandle  
  
The handle of the WebSocket.  
  
*headerIndex* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
Specific zero based index of the header.  
  
*headerName* &nbsp;&nbsp;\_Out\_  
Type: char**  
  
UTF-8 encoded header name for the HTTP call.  
  
*headerValue* &nbsp;&nbsp;\_Out\_  
Type: char**  
  
UTF-8 encoded header value for the HTTP call.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
Use HCHttpCallGetNumHeaders() to know how many headers there are in the HTTP call.
  
## Requirements  
  
**Header:** httpProvider.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpProvider](../httpprovider_members.md)  
  
  