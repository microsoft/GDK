---
author: joannaleecy
title: HCHttpCallGetRequestUrl
description: Gets the request url for the HTTP call.
kindex: HCHttpCallGetRequestUrl
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallGetRequestUrl  

Gets the request url for the HTTP call.  

## Syntax  
  
```cpp
HRESULT HCHttpCallGetRequestUrl(  
         HCCallHandle call,  
         const char** url  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*url* &nbsp;&nbsp;\_Out\_  
Type: char**  
  
The UTF-8 encoded url body string of the HTTP call. The memory for the returned string pointer remains valid for the life of the HCCallHandle object until HCHttpCallCloseHandle() is called on it.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  