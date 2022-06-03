---
author: joannaleecy
title: XblUserStatisticsStopTrackingUsers
description: Configures the set of stats that will be tracked real-time. The API will cancel all real-time stat updates for the provided users.
kindex: XblUserStatisticsStopTrackingUsers
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblUserStatisticsStopTrackingUsers  

Configures the set of stats that will be tracked real-time. The API will cancel all real-time stat updates for the provided users.  

## Syntax  
  
```cpp
HRESULT XblUserStatisticsStopTrackingUsers(  
         XblContextHandle xblContextHandle,  
         const uint64_t* xboxUserIds,  
         size_t xboxUserIdsCount  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*xboxUserIds* &nbsp;&nbsp;\_In\_  
Type: uint64_t*  
  
Array of XboxUserIDs for whom to stop tracking the all stats.  
  
*xboxUserIdsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Length of xboxUserIds array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** user_statistics_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[user_statistics_c](../user_statistics_c_members.md)  
  
  