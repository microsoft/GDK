---
author: joannaleecy
title: HCCleanup
description: Immediately reclaims all resources associated with the library. If you called HCMemSetFunctions(), call this before shutting down your app's memory manager.
kindex: HCCleanup
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCCleanup  

Immediately reclaims all resources associated with the library. If you called HCMemSetFunctions(), call this before shutting down your app's memory manager.  

## Syntax  
  
```cpp
void HCCleanup(  
)  
```  
  
### Parameters  
  
  
### Return value  
Type: void
  

  
## Remarks  
  
Deprecated, Use HCCleanupAsync instead which allows control of which queue is running the cleanup work and does not potentially deadlock.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  