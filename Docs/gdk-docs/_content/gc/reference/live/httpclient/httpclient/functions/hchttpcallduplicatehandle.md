---
author: joannaleecy
title: HCHttpCallDuplicateHandle
description: Duplicates the HCCallHandle object.
kindex: HCHttpCallDuplicateHandle
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallDuplicateHandle  

Duplicates the HCCallHandle object.  

## Syntax  
  
```cpp
HCCallHandle HCHttpCallDuplicateHandle(  
         HCCallHandle call  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
  
### Return value  
Type: HCCallHandle
  
Returns the duplicated handle.
  
## Remarks  
  
Use HCHttpCallCloseHandle to close it.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  