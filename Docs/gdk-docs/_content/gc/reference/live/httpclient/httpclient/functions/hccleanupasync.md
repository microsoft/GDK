---
author: joannaleecy
title: HCCleanupAsync
description: Reclaims all resources associated with the library. If you called HCMemSetFunctions(), call this before shutting down your app's memory manager.
kindex: HCCleanupAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCCleanupAsync  

Reclaims all resources associated with the library. If you called HCMemSetFunctions(), call this before shutting down your app's memory manager.  

## Syntax  
  
```cpp
HRESULT HCCleanupAsync(  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;  
Type: XAsyncBlock*  
  
Pointer to the XAsyncBlock for the asynchronous call.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  