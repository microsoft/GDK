---
author: joannaleecy
title: HCHttpCallRequestGetRequestBodyString
description: Get the request body bytes of the HTTP call.
kindex: HCHttpCallRequestGetRequestBodyString
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCHttpCallRequestGetRequestBodyString  

Get the request body bytes of the HTTP call.  

## Syntax  
  
```cpp
HRESULT HCHttpCallRequestGetRequestBodyString(  
         HCCallHandle call,  
         const char** requestBody  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*requestBody* &nbsp;&nbsp;\_Outptr\_  
Type: char**  
  
The UTF-8 encoded request body of the HTTP call.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Requirements  
  
**Header:** httpProvider.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpProvider](../httpprovider_members.md)  
  
  