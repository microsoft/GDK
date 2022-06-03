---
author: joannaleecy
title: HCRemoveCallRoutedHandler
description: Removes a previously added HCCallRoutedHandler.
kindex: HCRemoveCallRoutedHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCRemoveCallRoutedHandler  

Removes a previously added HCCallRoutedHandler.  

## Syntax  
  
```cpp
void HCRemoveCallRoutedHandler(  
         int32_t handlerId  
)  
```  
  
### Parameters  
  
*handlerId* &nbsp;&nbsp;\_In\_  
Type: int32_t  
  
Id returned from the HCAddCallRoutedHandler call.  
  
  
### Return value  
Type: void
  

  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  