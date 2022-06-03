---
author: joannaleecy
title: XblStringVerifyStringAsync
description: Verifies if a string contains acceptable text for use with Xbox Live.
kindex: XblStringVerifyStringAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblStringVerifyStringAsync  

Verifies if a string contains acceptable text for use with Xbox Live.  

## Syntax  
  
```cpp
HRESULT XblStringVerifyStringAsync(  
         XblContextHandle xboxLiveContext,  
         const char* stringToVerify,  
         XAsyncBlock* asyncBlock  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*stringToVerify* &nbsp;&nbsp;\_In\_  
Type: char*  
  
The string to verify.  
  
*asyncBlock* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Call [XblStringVerifyStringResultSize](xblstringverifystringresultsize.md) to retrieve size of buffer needed for result. Call [XblStringVerifyStringResult](xblstringverifystringresult.md) to retrieve the size of the results.
  
## Requirements  
  
**Header:** string_verify_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[string_verify_c](../string_verify_c_members.md)  
  
  