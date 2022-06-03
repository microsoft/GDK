---
author: M-Stahl
title: XTaskQueueCloseHandle
description: Closes the task queue.
kindex: XTaskQueueCloseHandle
ms.author: mstahl
ms.topic: reference
edited: 06/04/2019
quality: good
security: public
applies-to: pc-gdk
---

# XTaskQueueCloseHandle  

Closes the task queue.  

## Syntax  
  
```cpp
void XTaskQueueCloseHandle(  
         XTaskQueueHandle queue  
)  
```  
  
### Parameters  
  
*queue* &nbsp;&nbsp;\_In\_  
Type: XTaskQueueHandle  

  
The queue to close.  


  
### Return value
Type: void
  
  
## Remarks  
  
**XTaskQueueCloseHandle** simply decrements an internal reference count on the task queue object. If there are callbacks still in the queue, those callbacks hold a reference on the queue object and they may still be called. This can pose a problem for app shutdown. When an app shuts down it will need to ensure no spurious callbacks execute after cleanup. XTaskQueue provides the [XTaskQueueTerminate](xtaskqueueterminate.md) API to perform a controlled termination of a queue.  

 
## Requirements  
  
**Header:** XTaskQueue.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XTaskQueue members](../xtaskqueue_members.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
[Async Task Queue Design](../../../../system/overviews/async-task-queue-design.md)   
  
  