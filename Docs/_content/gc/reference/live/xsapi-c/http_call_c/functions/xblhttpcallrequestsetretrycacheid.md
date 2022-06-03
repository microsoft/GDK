---
author: joannaleecy
title: XblHttpCallRequestSetRetryCacheId
description: ID number of this REST endpoint used to cache the Retry-After header for fast fail.
kindex: XblHttpCallRequestSetRetryCacheId
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblHttpCallRequestSetRetryCacheId  

ID number of this REST endpoint used to cache the Retry-After header for fast fail.  

## Syntax  
  
```cpp
HRESULT XblHttpCallRequestSetRetryCacheId(  
         XblHttpCallHandle call,  
         uint32_t retryAfterCacheId  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: [XblHttpCallHandle](../handles/xblhttpcallhandle.md)  
  
The handle of the HTTP call. Pass nullptr to set the default for future calls.  
  
*retryAfterCacheId* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
ID number of this REST endpoint used to cache the Retry-After header for fast fail. 1-1000 are reserved for XSAPI.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
This must be called prior to calling [XblHttpCallPerformAsync](xblhttpcallperformasync.md).
  
## Requirements  
  
**Header:** http_call_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[http_call_c](../http_call_c_members.md)  
  
  