---
author: joannaleecy
title: HCHttpCallRequestGetHeader
description: Get a request header for the HTTP call for a given header name.
kindex: HCHttpCallRequestGetHeader
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCHttpCallRequestGetHeader  

Get a request header for the HTTP call for a given header name.  

## Syntax  
  
```cpp
HRESULT HCHttpCallRequestGetHeader(  
         HCCallHandle call,  
         const char* headerName,  
         const char** headerValue  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call  
  
*headerName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
UTF-8 encoded request header name for the HTTP call.  
  
*headerValue* &nbsp;&nbsp;\_Out\_  
Type: char**  
  
UTF-8 encoded request header value for the HTTP call.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Requirements  
  
**Header:** httpProvider.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpProvider](../httpprovider_members.md)  
  
  