---
author: joannaleecy
title: XblPresenceGetPresenceForMultipleUsersResultCount
description: Get result count for an XblPresenceGetPresenceForMultipleUsersAsync call.
kindex: XblPresenceGetPresenceForMultipleUsersResultCount
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPresenceGetPresenceForMultipleUsersResultCount  

Get result count for an XblPresenceGetPresenceForMultipleUsersAsync call.  

## Syntax  
  
```cpp
HRESULT XblPresenceGetPresenceForMultipleUsersResultCount(  
         XAsyncBlock* async,  
         size_t* resultCount  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
*resultCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Passes back the number of presence records.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** presence_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[presence_c](../presence_c_members.md)  
  
  