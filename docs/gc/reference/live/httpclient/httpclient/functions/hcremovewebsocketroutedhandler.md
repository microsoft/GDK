---
author: joannaleecy
title: HCRemoveWebSocketRoutedHandler
description: Removes a previously added HCWebSocketRoutedHandler.
kindex: HCRemoveWebSocketRoutedHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCRemoveWebSocketRoutedHandler  

Removes a previously added HCWebSocketRoutedHandler.  

## Syntax  
  
```cpp
void HCRemoveWebSocketRoutedHandler(  
         int32_t handlerId  
)  
```  
  
### Parameters  
  
*handlerId* &nbsp;&nbsp;\_In\_  
Type: int32_t  
  
Id returned from the HCAddWebSocketRoutedHandler call.  
  
  
### Return value  
Type: void
  

  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  