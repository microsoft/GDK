---
author: joannaleecy
title: HCHttpCallResponseSetNetworkErrorCode
description: Set the network error code of the HTTP call.
kindex: HCHttpCallResponseSetNetworkErrorCode
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallResponseSetNetworkErrorCode  

Set the network error code of the HTTP call.  

## Syntax  
  
```cpp
HRESULT HCHttpCallResponseSetNetworkErrorCode(  
         HCCallHandle call,  
         HRESULT networkErrorCode,  
         uint32_t platformNetworkErrorCode  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*networkErrorCode* &nbsp;&nbsp;\_In\_  
Type: HRESULT  
  
The network error code of the HTTP call.  
  
*platformNetworkErrorCode* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The platform specific network error code of the HTTP call to be used for logging / debugging.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Requirements  
  
**Header:** httpProvider.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpProvider](../httpprovider_members.md)  
  
  