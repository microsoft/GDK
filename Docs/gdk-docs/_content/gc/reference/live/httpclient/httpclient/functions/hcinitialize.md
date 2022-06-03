---
author: joannaleecy
title: HCInitialize
description: Initializes the library instance.
kindex: HCInitialize
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCInitialize  

Initializes the library instance.  

## Syntax  
  
```cpp
HRESULT HCInitialize(  
         HCInitArgs* args  
)  
```  
  
### Parameters  
  
*args* &nbsp;&nbsp;\_In\_opt\_  
Type: [HCInitArgs*](../structs/hcinitargs.md)  
  
Client context for platform-specific initialization. Pass in the JavaVM on Android, and nullptr on other platforms.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Remarks  
  
This must be called before any other method, except for HCMemSetFunctions() and HCMemGetFunctions(). Should have a corresponding call to HCGlobalCleanup().
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  