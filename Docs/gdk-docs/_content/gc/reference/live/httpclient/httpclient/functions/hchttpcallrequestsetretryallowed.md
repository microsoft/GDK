---
author: joannaleecy
title: HCHttpCallRequestSetRetryAllowed
description: Sets if retry is allowed for this HTTP call.
kindex: HCHttpCallRequestSetRetryAllowed
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallRequestSetRetryAllowed  

Sets if retry is allowed for this HTTP call.  

## Syntax  
  
```cpp
HRESULT HCHttpCallRequestSetRetryAllowed(  
         HCCallHandle call,  
         bool retryAllowed  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_opt\_  
Type: HCCallHandle  
  
The handle of the HTTP call. Pass nullptr to set the default for future calls.  
  
*retryAllowed* &nbsp;&nbsp;\_In\_  
Type: bool  
  
If retry is allowed for this HTTP call.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, or E_FAIL.
  
## Remarks  
  
Defaults to true. This must be called prior to calling HCHttpCallPerformAsync.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  