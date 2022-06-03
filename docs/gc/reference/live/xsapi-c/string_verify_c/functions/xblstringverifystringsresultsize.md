---
author: joannaleecy
title: XblStringVerifyStringsResultSize
description: Get the result size for an XblStringVerifyStringsAsync call.
kindex: XblStringVerifyStringsResultSize
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblStringVerifyStringsResultSize  

Get the result size for an XblStringVerifyStringsAsync call.  

## Syntax  
  
```cpp
HRESULT XblStringVerifyStringsResultSize(  
         XAsyncBlock* asyncBlock,  
         size_t* resultSizeInBytes  
)  
```  
  
### Parameters  
  
*asyncBlock* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
*resultSizeInBytes* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Passes back the size in bytes required to store the XblVerifyStringResult results.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** string_verify_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[string_verify_c](../string_verify_c_members.md)  
  
  