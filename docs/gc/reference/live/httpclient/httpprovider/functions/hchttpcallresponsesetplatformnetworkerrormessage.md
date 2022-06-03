---
author: joannaleecy
title: HCHttpCallResponseSetPlatformNetworkErrorMessage
description: Set the platform network error message of the HTTP call.
kindex: HCHttpCallResponseSetPlatformNetworkErrorMessage
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallResponseSetPlatformNetworkErrorMessage  

Set the platform network error message of the HTTP call.  

## Syntax  
  
```cpp
HRESULT HCHttpCallResponseSetPlatformNetworkErrorMessage(  
         HCCallHandle call,  
         const char* platformNetworkErrorMessage  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*platformNetworkErrorMessage* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The platform specific network error message of the HTTP call to be used for logging / debugging.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Requirements  
  
**Header:** httpProvider.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpProvider](../httpprovider_members.md)  
  
  