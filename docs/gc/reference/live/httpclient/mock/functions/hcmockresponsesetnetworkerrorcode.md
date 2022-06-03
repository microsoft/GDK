---
author: joannaleecy
title: HCMockResponseSetNetworkErrorCode
description: Set the network error code to return for the mock.
kindex: HCMockResponseSetNetworkErrorCode
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCMockResponseSetNetworkErrorCode  

Set the network error code to return for the mock.  

## Syntax  
  
```cpp
HRESULT HCMockResponseSetNetworkErrorCode(  
         HCMockCallHandle call,  
         HRESULT networkErrorCode,  
         uint32_t platformNetworkErrorCode  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCMockCallHandle  
  
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
  
**Header:** mock.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[mock](../mock_members.md)  
  
  