---
author: joannaleecy
title: HCHttpCallRequestGetUrl
description: Gets the url and method for the HTTP call.
kindex: HCHttpCallRequestGetUrl
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallRequestGetUrl  

Gets the url and method for the HTTP call.  

## Syntax  
  
```cpp
HRESULT HCHttpCallRequestGetUrl(  
         HCCallHandle call,  
         const char** method,  
         const char** url  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*method* &nbsp;&nbsp;\_Outptr\_  
Type: char**  
  
UTF-8 encoded method for the HTTP call.  
  
*url* &nbsp;&nbsp;\_Outptr\_  
Type: char**  
  
UTF-8 encoded URL for the HTTP call.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Requirements  
  
**Header:** httpProvider.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpProvider](../httpprovider_members.md)  
  
  