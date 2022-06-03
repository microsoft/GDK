---
author: M-Stahl
title: set_thread_processor
description: Optionally configures the processor on which internal Game Chat threads will run.
kindex: set_thread_processor
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# chat_manager::set_thread_processor  

Optionally configures the processor on which internal Game Chat threads will run.  

## Syntax  
  
```cpp
void set_thread_processor(  
    game_chat_thread_id threadId,  
    uint32_t processorNumber  
)  
```  
  
### Parameters  
  
*threadId* &nbsp;&nbsp;\_In\_  
Type: [game_chat_thread_id](../../../enums/game_chat_thread_id.md)  
  
The type of internal Game Chat thread to configure processor affinity.  
  
*processorNumber* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The zero-based processor number on which the internal Game Chat threads should run.  
  
  
### Return value  
Type: void
  
  
## Remarks  
  
This method enables the application to configure the processor affinity for internal Game Chat threads of a given type.

For exclusive resource applications, the threads are guaranteed to run on the specified processor. For universal Windows applications, the specified processor is used as the thread's ideal processor and is only a hint for the scheduler.  

This method may be called at any time before or after chat_manager\::initialize() and will take effect immediately. Thread processor settings are persisted across calls to chat_manager\::cleanup() and chat_manager\::initialize(). When there are more than 64 cores present, this method always applies to processor group 0.  

In order to specify any processor, pass ```c_anyProcessorNumber``` as the *processorNumber* parameter. This is also the default value Game Chat will use if this method is never called.> [!NOTE]
> ```c_anyProcessorNumber``` is a ```constexpr uint32_t``` with a value of 0xFFFFFFFF.
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[chat_manager](../chat_manager.md)  
[game_chat_thread_id](../../../enums/game_chat_thread_id.md)  
[chat_manager\::get_thread_processor](chat_manager_get_thread_processor.md)
  
  