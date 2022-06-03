---
author: joannaleecy
title: HCHttpCallRequestGetNumHeaders
description: Gets the number of request headers in the HTTP call.
kindex: HCHttpCallRequestGetNumHeaders
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCHttpCallRequestGetNumHeaders  

Gets the number of request headers in the HTTP call.  

## Syntax  
  
```cpp
HRESULT HCHttpCallRequestGetNumHeaders(  
         HCCallHandle call,  
         uint32_t* numHeaders  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*numHeaders* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
  
the number of request headers in the HTTP call.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Requirements  
  
**Header:** httpProvider.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpProvider](../httpprovider_members.md)  
  
  