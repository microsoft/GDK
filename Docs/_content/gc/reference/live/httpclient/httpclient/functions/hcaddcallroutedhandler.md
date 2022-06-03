---
author: joannaleecy
title: HCAddCallRoutedHandler
description: Adds a callback to be invoked on intermediate http calls in order to debug or trace the traffic.
kindex: HCAddCallRoutedHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCAddCallRoutedHandler  

Adds a callback to be invoked on intermediate http calls in order to debug or trace the traffic.  

## Syntax  
  
```cpp
int32_t HCAddCallRoutedHandler(  
         HCCallRoutedHandler handler,  
         void* context  
)  
```  
  
### Parameters  
  
*handler* &nbsp;&nbsp;\_In\_  
Type: HCCallRoutedHandler  
  
The handler to be called.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Client context to pass to callback function.  
  
  
### Return value  
Type: int32_t
  
An unique id that can be used to remove the handler.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  