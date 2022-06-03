---
author: joannaleecy
title: XblGetErrorCondition
description: Groups HRESULT values returned from Xbl APIs in to error condition buckets that are actionable.
kindex: XblGetErrorCondition
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblGetErrorCondition  

Groups HRESULT values returned from Xbl APIs in to error condition buckets that are actionable.  

## Syntax  
  
```cpp
XblErrorCondition XblGetErrorCondition(  
         HRESULT hr  
)  
```  
  
### Parameters  
  
*hr* &nbsp;&nbsp;\_In\_  
Type: HRESULT  
  
HRESULT value returned from an Xbl API.  
  
  
### Return value  
Type: XblErrorCondition
  
The corresponding XblErrorCondition.
  
## Requirements  
  
**Header:** errors_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[errors_c](../errors_c_members.md)  
  
  