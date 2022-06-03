---
author: joannaleecy
title: HCGetHttpCallPerformFunction
description: Returns the current HCCallPerformFunction callback which implements the HTTP perform function on the current platform.
kindex: HCGetHttpCallPerformFunction
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCGetHttpCallPerformFunction  

Returns the current HCCallPerformFunction callback which implements the HTTP perform function on the current platform.  

## Syntax  
  
```cpp
HRESULT HCGetHttpCallPerformFunction(  
         HCCallPerformFunction* performFunc,  
         void** performContext  
)  
```  
  
### Parameters  
  
*performFunc* &nbsp;&nbsp;\_Out\_  
Type: HCCallPerformFunction*  
  
Set to the current HTTP perform function. Returns the default routine if not previously set.  
  
*performContext* &nbsp;&nbsp;\_Out\_  
Type: void**  
  
The context for the callback.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_HC_ALREADY_INITIALISED, or E_INVALIDARG.
  
## Remarks  
  
This can be used along with HCSetHttpCallPerformFunction() to build a filter that monitors and modifies all HTTP calls, while still using the default HTTP implementation.
  
## Requirements  
  
**Header:** httpProvider.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpProvider](../httpprovider_members.md)  
  
  