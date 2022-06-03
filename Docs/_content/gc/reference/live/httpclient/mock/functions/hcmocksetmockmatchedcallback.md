---
author: joannaleecy
title: HCMockSetMockMatchedCallback
description: Add an intermediate callback that will be called when the specified mock is matched. This gives the client another opportunity to specify the mock response.
kindex: HCMockSetMockMatchedCallback
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCMockSetMockMatchedCallback  

Add an intermediate callback that will be called when the specified mock is matched. This gives the client another opportunity to specify the mock response.  

## Syntax  
  
```cpp
HRESULT HCMockSetMockMatchedCallback(  
         HCMockCallHandle call,  
         HCMockMatchedCallback callback,  
         void* context  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCMockCallHandle  
  
The matched mock.  
  
*callback* &nbsp;&nbsp;\_In\_  
Type: HCMockMatchedCallback  
  
Callback to be invoked when the mock is matched.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Client context.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Requirements  
  
**Header:** mock.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[mock](../mock_members.md)  
  
  