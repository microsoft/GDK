---
author: joannaleecy
title: HCHttpCallRequestSetUrl
description: Sets the url and method for the HTTP call.
kindex: HCHttpCallRequestSetUrl
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallRequestSetUrl  

Sets the url and method for the HTTP call.  

## Syntax  
  
```cpp
HRESULT HCHttpCallRequestSetUrl(  
         HCCallHandle call,  
         const char* method,  
         const char* url  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*method* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
UTF-8 encoded method for the HTTP call.  
  
*url* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
UTF-8 encoded URL for the HTTP call.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Remarks  
  
This must be called prior to calling HCHttpCallPerformAsync.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  