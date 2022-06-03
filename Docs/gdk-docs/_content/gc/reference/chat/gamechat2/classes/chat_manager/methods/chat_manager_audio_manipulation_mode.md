---
author: M-Stahl
title: audio_manipulation_mode
description: Indicates the audio manipulation mode enabled for the chat instance.
kindex: audio_manipulation_mode
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/10/2020'
security: public
applies-to: pc-gdk
---

# chat_manager::audio_manipulation_mode
  
Indicates the audio manipulation mode enabled for the chat instance.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
game_chat_audio_manipulation_mode_flags audio_manipulation_mode(  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
None.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: [game_chat_audio_manipulation_mode_flags](../../../enums/game_chat_audio_manipulation_mode_flags.md)  
  
Returns the audio manipulation modes enabled for this chat instance.
  
<a id="remarksSection"></a>
  
## Remarks
  
This method indicates the audio manipulation mode enabled for this chat instance. You must specify appropriate [game_chat_audio_manipulation_mode_flags](../../../enums/game_chat_audio_manipulation_mode_flags.md) constants when invoking the [chat_manager::initialize](chat_manager_initialize.md) method for this instance to enable pre-encode or post-decode audio manipulation; otherwise, this value is set to `game_chat_audio_manipulation_mode_flags::none` by default when the chat instance is initialized. For more information, see [Real-time audio manipulation](../../../../../../chat/overviews/game-chat2/real-time-audio-manipulation.md).
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_manager](../chat_manager.md)  
  