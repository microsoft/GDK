---
author: joannaleecy
title: HCHttpCallResponseSetHeaderWithLength
description: Set a response header for the HTTP call.
kindex: HCHttpCallResponseSetHeaderWithLength
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallResponseSetHeaderWithLength  

Set a response header for the HTTP call.  

## Syntax  
  
```cpp
HRESULT HCHttpCallResponseSetHeaderWithLength(  
         HCCallHandle call,  
         const char* headerName,  
         size_t nameSize,  
         const char* headerValue,  
         size_t valueSize  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*headerName* &nbsp;&nbsp;\_In\_reads\_(nameSize)  
Type: char*  
  
UTF-8 encoded response header name for the HTTP call.  
  
*nameSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The length in bytes of the header name string.  
  
*headerValue* &nbsp;&nbsp;\_In\_reads\_(valueSize)  
Type: char*  
  
UTF-8 encoded response header value for the HTTP call.  
  
*valueSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The length in bytes of the header value string.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Requirements  
  
**Header:** httpProvider.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpProvider](../httpprovider_members.md)  
  
  