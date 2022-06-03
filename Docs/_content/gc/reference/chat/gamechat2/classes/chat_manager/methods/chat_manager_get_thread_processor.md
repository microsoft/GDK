---
author: M-Stahl
title: get_thread_processor
description: Retrieves the current processor on which internal Game Chat threads will run or are running.
kindex: get_thread_processor
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# chat_manager::get_thread_processor  

Retrieves the current processor on which internal Game Chat threads will run or are running.  

## Syntax  
  
```cpp
void get_thread_processor(  
    game_chat_thread_id threadId,  
    uint32_t* processorNumber  
)  
```  
  
### Parameters  
  
*threadId* &nbsp;&nbsp;\_In\_  
Type: [game_chat_thread_id](../../../enums/game_chat_thread_id.md)  
  
The type of internal Game Chat thread for which processor affinity should be retrieved.  
The internal thread to retrieve the process number for.  
  
*processorNumber* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
  
A place to store the zero-based processor number on which the internal Game Chat threads will run or are running.  
  
  
### Return value  
Type: void
  
  
## Remarks  
  
This retrieves the current processor affinity for internal Game Chat threads of a given type.

This method does not require chat_manager\::initialize() to have been called first.  

A reported value of ```c_anyProcessorNumber``` written to *processorNumber* indicates that the thread is free to run on any processor.> [!NOTE]
> ```c_anyProcessorNumber``` is a ```constexpr uint32_t``` with a value of 0xFFFFFFFF.
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[chat_manager](../chat_manager.md)  
[game_chat_thread_id](../../../enums/game_chat_thread_id.md)  
[chat_manager::set_thread_processor](chat_manager_set_thread_processor.md)
  
  