---
author: joannaleecy
title: XblPresenceGetPresenceForMultipleUsersResult
description: Get result for an XblPresenceGetPresenceForMultipleUsers call.
kindex: XblPresenceGetPresenceForMultipleUsersResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPresenceGetPresenceForMultipleUsersResult  

Get result for an XblPresenceGetPresenceForMultipleUsers call.  

## Syntax  
  
```cpp
HRESULT XblPresenceGetPresenceForMultipleUsersResult(  
         XAsyncBlock* async,  
         XblPresenceRecordHandle* presenceRecordHandles,  
         size_t presenceRecordHandlesCount  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
*presenceRecordHandles* &nbsp;&nbsp;\_Out\_writes\_(presenceRecordHandlesCount)  
Type: [XblPresenceRecordHandle*](../handles/xblpresencerecordhandle.md)  
  
A caller allocated array that passes back the record handles result. Each handle will need to be released with [XblPresenceRecordCloseHandle](xblpresencerecordclosehandle.md) when they are no longer needed.  
  
*presenceRecordHandlesCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Size of the handles array. Use [XblPresenceGetPresenceForMultipleUsersResultCount](xblpresencegetpresenceformultipleusersresultcount.md) to get the count required.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** presence_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[presence_c](../presence_c_members.md)  
  
  