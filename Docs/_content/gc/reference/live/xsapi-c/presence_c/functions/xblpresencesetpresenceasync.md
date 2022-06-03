---
author: joannaleecy
title: XblPresenceSetPresenceAsync
description: Sets presence info for the current user context.
kindex: XblPresenceSetPresenceAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPresenceSetPresenceAsync  

Sets presence info for the current user context.  

## Syntax  
  
```cpp
HRESULT XblPresenceSetPresenceAsync(  
         XblContextHandle xblContextHandle,  
         bool isUserActiveInTitle,  
         XblPresenceRichPresenceIds* richPresenceIds,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*isUserActiveInTitle* &nbsp;&nbsp;\_In\_  
Type: bool  
  
Indicates if the current user context is currently active or inactive in the title. The application can choose to set this based on an amount of inactivity.  
  
*richPresenceIds* &nbsp;&nbsp;\_In\_opt\_  
Type: [XblPresenceRichPresenceIds*](../structs/xblpresencerichpresenceids.md)  
  
Optional pointer to struct which controls the rich presence strings.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** presence_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[presence_c](../presence_c_members.md)  
  
  