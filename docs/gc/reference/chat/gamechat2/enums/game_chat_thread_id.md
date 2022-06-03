---
author: M-Stahl
title: game_chat_thread_id
description: Defines the types of threads that Game Chat 2 uses for internal purposes.
kindex: game_chat_thread_id
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 10/08/2020
security: public
applies-to: pc-gdk
---

# game_chat_thread_id
  
Defines the types of threads that Game Chat 2 uses for internal purposes.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
enum class game_chat_thread_id  
{  
    audio,  
    networking,  
}  
```  
  
<a id="constantsSection"></a>
  
## Constants
  
| Constant | Description |  
| --- | --- |  
| audio | Represents Game Chat 2 internal audio threads.<br/><br/> Game Chat internal audio threads are high priority, frequently-running threads with real-time requirements. These threads interact directly with XAudio2 every 20 to 40 milliseconds. |  
| networking | Represents Game Chat 2 internal networking threads.<br/><br/> Game Chat 2 internal networking threads are driven by polling mechanisms. These wake every 50 to 100 milliseconds. |  
  
<a id="remarksSection"></a>
  
## Remarks
  
This enumeration is used by [chat_manager::get_thread_processor](../classes/chat_manager/methods/chat_manager_get_thread_processor.md) and [chat_manager::set_thread_processor](../classes/chat_manager/methods/chat_manager_set_thread_processor.md) to identify the Game Chat 2 internal thread type for which processor affinity is configured.  
  
When calling `chat_manager\::set_thread_processor` to configure the processor affinity for Game Chat 2 internal audio threads, XAudio2 instances for Game Chat 2 are initialized with a processor affinity that corresponds to the configured processor number. If no processor number is specified for this thread type, XAudio2 instances for Game Chat 2 are initialized with the processor affinity set to `XAUDIO2_DEFAULT_PROCESSOR`.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[GameChat2 members](../gamechat2_members.md)  
  