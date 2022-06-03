---
author: joannaleecy
title: HCHttpCallResponseGetResponseBodyWriteFunction
description: Get the function used by the HTTP call to write the response body.
kindex: HCHttpCallResponseGetResponseBodyWriteFunction
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallResponseGetResponseBodyWriteFunction  

Get the function used by the HTTP call to write the response body.  

## Syntax  
  
```cpp
HRESULT HCHttpCallResponseGetResponseBodyWriteFunction(  
         HCCallHandle call,  
         HCHttpCallResponseBodyWriteFunction* writeFunction,  
         void** context  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*writeFunction* &nbsp;&nbsp;\_Out\_  
Type: HCHttpCallResponseBodyWriteFunction*  
  
The write function of this HTTP call.  
  
*context* &nbsp;&nbsp;\_Out\_  
Type: void**  
  
The context associated with this write function.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Requirements  
  
**Header:** httpProvider.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpProvider](../httpprovider_members.md)  
  
  