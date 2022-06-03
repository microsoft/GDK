---
author: M-Stahl
title: game_chat_audio_manipulation_mode_flags
description: Represents the requested audio manipulation feature status.
kindex: game_chat_audio_manipulation_mode_flags
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/16/2020'
security: public
applies-to: pc-gdk
---

# game_chat_audio_manipulation_mode_flags
  
Represents the requested audio manipulation feature status.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
enum class game_chat_audio_manipulation_mode_flags  
{  
    none = 0x0,  
    pre_encode_stream_manipulation = 0x1,  
    post_decode_stream_manipulation = 0x2,  
}  
```  
  
<a id="constantsSection"></a>
  
## Constants
  
| Constant | Description |  
| --- | --- |  
| none | All audio manipulation is disabled. |  
| pre_encode_stream_manipulation | Manipulation of locally generated audio is enabled.<br/><br/>Specifying this flag grants access to chat user audio data for processing and manipulation by the sender, by using the [pre_encode_audio_stream](../classes/pre_encode_audio_stream/pre_encode_audio_stream.md) object. |  
| post_decode_stream_manipulation | Manipulation of remotely generated audio is enabled.<br/><br/>Specifying this flag grants access to chat user audio data for processing and manipulation by the receiver, by using the [post_decode_audio_source_stream](../classes/post_decode_audio_source_stream/post_decode_audio_source_stream.md) and [post_decode_audio_sink_stream](../classes/post_decode_audio_sink_stream/post_decode_audio_sink_stream.md) objects. |  
  
<a id="remarksSection"></a>
  
## Remarks
  
This enumeration describes the audio manipulation features that your app can request from Game Chat 2 for a chat instance. You can retrieve the current audio manipulation mode for the chat instance by calling the [chat_manager::audio_manipulation_mode](../classes/chat_manager/methods/chat_manager_audio_manipulation_mode.md) method. You can set the audio manipulation mode when you initialize the chat instance, by calling the [chat_manager::initialize](../classes/chat_manager/methods/chat_manager_initialize.md) method.  
  
For more information about manipulating chat audio data, see [Real-time audio manipulation](../../../../chat/overviews/game-chat2/real-time-audio-manipulation.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[GameChat2 members](../gamechat2_members.md)  
[chat_manager](../classes/chat_manager/chat_manager.md)  
  