---
author: joannaleecy
title: HCMockResponseSetHeader
description: Set a response header to return for the mock.
kindex: HCMockResponseSetHeader
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCMockResponseSetHeader  

Set a response header to return for the mock.  

## Syntax  
  
```cpp
HRESULT HCMockResponseSetHeader(  
         HCMockCallHandle call,  
         const char* headerName,  
         const char* headerValue  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCMockCallHandle  
  
The handle of the HTTP call.  
  
*headerName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
UTF-8 encoded response header name for the HTTP call.  
  
*headerValue* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
UTF-8 encoded response header value for the HTTP call.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Requirements  
  
**Header:** mock.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[mock](../mock_members.md)  
  
  