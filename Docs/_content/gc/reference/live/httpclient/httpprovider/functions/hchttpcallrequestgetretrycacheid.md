---
author: joannaleecy
title: HCHttpCallRequestGetRetryCacheId
description: Gets the ID number of this REST endpoint used to cache the Retry-After header for fast fail.
kindex: HCHttpCallRequestGetRetryCacheId
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallRequestGetRetryCacheId  

Gets the ID number of this REST endpoint used to cache the Retry-After header for fast fail.  

## Syntax  
  
```cpp
HRESULT HCHttpCallRequestGetRetryCacheId(  
         HCCallHandle call,  
         uint32_t* retryAfterCacheId  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call. Pass nullptr to get the default for future calls.  
  
*retryAfterCacheId* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
  
ID number of this REST endpoint used to cache the Retry-After header for fast fail. 1-1000 are reserved for XSAPI.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
Defaults is 0.
  
## Requirements  
  
**Header:** httpProvider.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpProvider](../httpprovider_members.md)  
  
  