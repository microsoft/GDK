---
author: joannaleecy
title: XblGetAsyncQueue
description: Gets the async queue that is used for XSAPI's internal asynchronous operations.
kindex: XblGetAsyncQueue
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblGetAsyncQueue  

Gets the async queue that is used for XSAPI's internal asynchronous operations.  

## Syntax  
  
```cpp
XTaskQueueHandle XblGetAsyncQueue(  
)  
```  
  
### Parameters  
  
  
### Return value  
Type: XTaskQueueHandle
  
Returns the async queue being used.
  
## Remarks  
  
Note that this queue will be derived from the queue passed in during XblInitialize, not the exact same one. Xsapi will call XTaskQueueDuplicateHandle before returning the queue, so XTaskQueueCloseHandle must be called later by callers.
  
## Requirements  
  
**Header:** xbox_live_global_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[xbox_live_global_c](../xbox_live_global_c_members.md)  
  
  