---
author: joannaleecy
title: HCHttpCallRequestGetTimeout
description: Gets the timeout for this HTTP call.
kindex: HCHttpCallRequestGetTimeout
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCHttpCallRequestGetTimeout  

Gets the timeout for this HTTP call.  

## Syntax  
  
```cpp
HRESULT HCHttpCallRequestGetTimeout(  
         HCCallHandle call,  
         uint32_t* timeoutInSeconds  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_opt\_  
Type: HCCallHandle  
  
The handle of the HTTP call. Pass nullptr to get the default for future calls.  
  
*timeoutInSeconds* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
  
the timeout for this HTTP call.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
Defaults to 30 seconds.
  
## Requirements  
  
**Header:** httpProvider.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpProvider](../httpprovider_members.md)  
  
  