---
author: joannaleecy
title: HCHttpCallRequestSetSSLValidation
description: Enables or disables SSL server certificate validation for this specific HTTP call.
kindex: HCHttpCallRequestSetSSLValidation
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCHttpCallRequestSetSSLValidation  

Enables or disables SSL server certificate validation for this specific HTTP call.  

## Syntax  
  
```cpp
HRESULT HCHttpCallRequestSetSSLValidation(  
         HCCallHandle call,  
         bool sslValidation  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*sslValidation* &nbsp;&nbsp;\_In\_  
Type: bool  
  
Boolean indicating whether to enable or disable certificate validation for the HTTP call.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
Only implemented for Win32. The default is true Optional, call prior to calling HCHttpCallPerformAsync.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  