---
author: M-Stahl
title: Dispatch
description: Executes work in the dispatcher's queue.
kindex: Dispatch
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
security: public
---

# IGameInputDispatcher::Dispatch  

Executes work in the dispatcher's queue.  

## Syntax  
  
```cpp
bool Dispatch(  
         uint64_t quotaInMicroseconds  
)  
```  
  
### Parameters  
  
*quotaInMicroseconds* &nbsp;&nbsp;\_In\_  
Type: uint64_t  

  
The amount of time that the dispatcher has to execute tasks. This is not an exact amount of time because the interface will attempt to keep this timeframe as close as possible.  


  
### Return value  

Type: bool
  
Returns true if  work items are pending in the dispatcher's queue. Returns false if no work items remain. Returns at the time that the queue is flushed.  
  
## Remarks  
  
The ``IGameInputDispatcher::Dispatch`` executes work in the dispatcher's queue. This method flushes at least one item from the queue even if the ``quotaInMicroseconds`` parameter is set to zero. You can call with a quota time of zero to execute a single item and then decide whether to dispatch more items depending on the time elapsed. For intermediate and advanced use-cases of the GameInput API, see [Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md).
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
  
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)    
[IGameInputDispatcher](../igameinputdispatcher.md)  