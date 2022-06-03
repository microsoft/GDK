---
author: joannaleecy
title: XblStringVerifyStringResultSize
description: Get the result size for an XblStringVerifyStringAsync call.
kindex: XblStringVerifyStringResultSize
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblStringVerifyStringResultSize  

Get the result size for an XblStringVerifyStringAsync call.  

## Syntax  
  
```cpp
HRESULT XblStringVerifyStringResultSize(  
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
  
Passes back the size in bytes required to store the XblVerifyStringResult result.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** string_verify_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[string_verify_c](../string_verify_c_members.md)  
  
  