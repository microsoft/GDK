---
author: joannaleecy
title: HCMockResponseSetResponseBodyBytes
description: Set the response body string to return for the mock.
kindex: HCMockResponseSetResponseBodyBytes
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCMockResponseSetResponseBodyBytes  

Set the response body string to return for the mock.  

## Syntax  
  
```cpp
HRESULT HCMockResponseSetResponseBodyBytes(  
         HCMockCallHandle call,  
         const uint8_t* bodyBytes,  
         uint32_t bodySize  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCMockCallHandle  
  
The handle of the HTTP call.  
  
*bodyBytes* &nbsp;&nbsp;\_In\_reads\_bytes\_(bodySize)  
Type: uint8_t*  
  
The response body bytes of the HTTP call.  
  
*bodySize* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The length in bytes of the body being set.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Requirements  
  
**Header:** mock.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[mock](../mock_members.md)  
  
  