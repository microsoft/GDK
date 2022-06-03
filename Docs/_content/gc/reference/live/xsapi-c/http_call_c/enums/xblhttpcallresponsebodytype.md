---
author: joannaleecy
title: XblHttpCallResponseBodyType
description: Defines the response body type when reading the results of an HTTP call.
kindex: XblHttpCallResponseBodyType
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblHttpCallResponseBodyType  

Defines the response body type when reading the results of an HTTP call.    

## Syntax  
  
```cpp
enum class XblHttpCallResponseBodyType  : uint32_t  
{  
    String,  
    Vector  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| String | Read results as string. |  
| Vector | Read results as vector. |  
  
## Requirements  
  
**Header:** http_call_c.h
  
## See also  
[http_call_c](../http_call_c_members.md)  
  
  