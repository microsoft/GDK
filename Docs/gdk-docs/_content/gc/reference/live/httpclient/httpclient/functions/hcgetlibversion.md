---
author: joannaleecy
title: HCGetLibVersion
description: Returns the version of the library.
kindex: HCGetLibVersion
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCGetLibVersion  

Returns the version of the library.  

## Syntax  
  
```cpp
HRESULT HCGetLibVersion(  
         const char** version  
)  
```  
  
### Parameters  
  
*version* &nbsp;&nbsp;\_Outptr\_  
Type: char**  
  
The UTF-8 encoded version of the library in the format of release_year.release_month.date.rev. For example, 2017.07.20170710.01  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  