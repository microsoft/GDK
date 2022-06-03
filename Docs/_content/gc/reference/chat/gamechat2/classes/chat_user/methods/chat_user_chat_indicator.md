---
author: M-Stahl
title: chat_indicator
description: Indicates whether chat is possible and if audio is currently being produced for this user.
kindex: chat_indicator
ms.author: jkepner
ms.topic: reference
ms.date: '09/13/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# chat_user::chat_indicator  

Indicates whether chat is possible and if audio is currently being produced for this user.  

## Syntax  
  
```cpp
game_chat_user_chat_indicator chat_indicator(  
)  
```  
  
### Parameters  
  
  
### Return value  
Type: game_chat_user_chat_indicator
  
  
## Remarks  
  
This indicator is intended to assist UI iconic representation so that users can determine why they're hearing/ seeing what they are ("who's that talking?"), or why not.

This value changes frequently and is typically polled every graphics frame.  

If post-decode audio manipulation is enabled, chat indicators will be set based on which post-decode audio source streams are attempting and allowed to talk to which post-decode audio sink streams. The chat indicator will be set regardless of how the app mixes the post-decode source streams together.
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[chat_user](../chat_user.md)  
[game_chat_user_chat_indicator](../../../enums/game_chat_user_chat_indicator.md)  
[chat_user\::chat_user_local\::set_microphone_muted](../chat_user_local/methods/chat_user_local_set_microphone_muted.md)  
[game_chat_audio_manipulation_mode_flags::post_decode_stream_manipulation](../../../enums/game_chat_audio_manipulation_mode_flags.md)
  
  