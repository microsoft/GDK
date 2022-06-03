---
author: joannaleecy
title: HCSetHttpCallPerformFunction
description: Optionally allows the caller to implement the HTTP perform function.
kindex: HCSetHttpCallPerformFunction
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCSetHttpCallPerformFunction  

Optionally allows the caller to implement the HTTP perform function.  

## Syntax  
  
```cpp
HRESULT HCSetHttpCallPerformFunction(  
         HCCallPerformFunction performFunc,  
         void* performContext  
)  
```  
  
### Parameters  
  
*performFunc* &nbsp;&nbsp;\_In\_  
Type: HCCallPerformFunction  
  
A callback that implements HTTP perform function as desired.  
  
*performContext* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
The context for the callback.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, or E_HC_ALREADY_INITIALISED.
  
## Remarks  
  
Must be called before HCInit. In the HCCallPerformFunction callback, use HCHttpCallRequestGet*() and HCSettingsGet*() to get information about the HTTP call and perform the call as desired and set the response with HCHttpCallResponseSet*().
  
## Requirements  
  
**Header:** httpProvider.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpProvider](../httpprovider_members.md)  
  
  