---
author: M-Stahl
title: set_memory_callbacks
description: Optionally configures the current memory allocation and freeing callbacks the Game Chat library should use.
kindex: set_memory_callbacks
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# chat_manager::set_memory_callbacks  

Optionally configures the current memory allocation and freeing callbacks the Game Chat library should use.  

## Syntax  
  
```cpp
void set_memory_callbacks(  
    game_chat_allocate_memory_callback allocateMemoryCallback,  
    game_chat_free_memory_callback freeMemoryCallback  
)  
```  
  
### Parameters  
  
*allocateMemoryCallback* &nbsp;&nbsp;\_In\_opt\_  
Type: game_chat_allocate_memory_callback  
  
A pointer to the custom allocation callback to use, or a null pointer to restore the default.  
  
*freeMemoryCallback* &nbsp;&nbsp;\_In\_opt\_  
Type: game_chat_free_memory_callback  
  
A pointer to the custom freeing callback to use, or a null pointer to restore the default.  
  
  
### Return value  
Type: void
  
  
## Remarks  
  
This method allows the application to install custom memory allocation routines in order to service all requests by the Game Chat library for new memory buffers instead of using its default allocation routines.

The *allocateMemoryCallback* and *freeMemoryCallback* parameters can be null pointers to restore the default routines. Both callback pointers must be null or both must be non-null. Mixing custom and default routines is not permitted.  

This method must be called prior to the chat_manager\::initialize() method. The callbacks cannot change while any allocations are outstanding. It also must be only called by one thread at a time as it isn't multithreading safe.  

The configured callbacks are persisted until changed, including across calls to chat_manager\::cleanup().
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[chat_manager](../chat_manager.md)  
[game_chat_allocate_memory_callback](../../../functions/game_chat_allocate_memory_callback.md)  
[game_chat_free_memory_callback](../../../functions/game_chat_free_memory_callback.md)  
[chat_manager::get_memory_callbacks](chat_manager_get_memory_callbacks.md)
  
  