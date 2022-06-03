---
author: joannaleecy
title: XblPrivacyBatchCheckPermissionResult
description: Get the results for an XblPrivacyBatchCheckPermissionAsync call.
kindex: XblPrivacyBatchCheckPermissionResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPrivacyBatchCheckPermissionResult  

Get the results for an XblPrivacyBatchCheckPermissionAsync call.  

## Syntax  
  
```cpp
HRESULT XblPrivacyBatchCheckPermissionResult(  
         XAsyncBlock* async,  
         size_t bufferSize,  
         void* buffer,  
         XblPermissionCheckResult** ptrToBufferResults,  
         size_t* ptrToBufferCount,  
         size_t* bufferUsed  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
*bufferSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the provided buffer. Use [XblPrivacyBatchCheckPermissionResultSize](xblprivacybatchcheckpermissionresultsize.md) to get the size required.  
  
*buffer* &nbsp;&nbsp;\_Out\_writes\_bytes\_to\_(bufferSize,*bufferUsed)  
Type: void*  
  
A caller allocated byte buffer that passes back the permission result.  
  
*ptrToBufferResults* &nbsp;&nbsp;\_Outptr\_  
Type: [XblPermissionCheckResult**](../structs/xblpermissioncheckresult.md)  
  
Passes back a strongly typed array of XblPermissionCheckResult that points into buffer. Do not free this as its lifecycle is tied to buffer.  
  
*ptrToBufferCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Passes back the number of entries in the ptrToBufferResults array.  
  
*bufferUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  
  
Passes back the number of bytes written to the buffer.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** privacy_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[privacy_c](../privacy_c_members.md)  
  
  