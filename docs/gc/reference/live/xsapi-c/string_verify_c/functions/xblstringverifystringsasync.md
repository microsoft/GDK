---
author: joannaleecy
title: XblStringVerifyStringsAsync
description: Verifies a collection of strings to see if each string contains acceptable text for use with Xbox Live.
kindex: XblStringVerifyStringsAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblStringVerifyStringsAsync  

Verifies a collection of strings to see if each string contains acceptable text for use with Xbox Live.  

## Syntax  
  
```cpp
HRESULT XblStringVerifyStringsAsync(  
         XblContextHandle xboxLiveContext,  
         const char** stringsToVerify,  
         const uint64_t stringsCount,  
         XAsyncBlock* asyncBlock  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*stringsToVerify* &nbsp;&nbsp;\_In\_  
Type: char**  
  
The string to verify.  
  
*stringsCount* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The number of strings being verified.  
  
*asyncBlock* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Call [XblStringVerifyStringsResultSize](xblstringverifystringsresultsize.md) to retrieve size of buffer needed for result. Call [XblStringVerifyStringsResult](xblstringverifystringsresult.md) to retrieve the size of the results.
  
## Requirements  
  
**Header:** string_verify_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[string_verify_c](../string_verify_c_members.md)  
  
  