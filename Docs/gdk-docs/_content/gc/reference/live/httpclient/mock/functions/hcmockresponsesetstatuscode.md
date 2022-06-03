---
author: joannaleecy
title: HCMockResponseSetStatusCode
description: Set the HTTP status code to return for the mock.
kindex: HCMockResponseSetStatusCode
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCMockResponseSetStatusCode  

Set the HTTP status code to return for the mock.  

## Syntax  
  
```cpp
HRESULT HCMockResponseSetStatusCode(  
         HCMockCallHandle call,  
         uint32_t statusCode  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCMockCallHandle  
  
The handle of the HTTP call.  
  
*statusCode* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
the HTTP status code of the HTTP call response.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Requirements  
  
**Header:** mock.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[mock](../mock_members.md)  
  
  