---
author: M-Stahl
title: get_pre_processed_format
description: Gets the audio format of the buffers that are returned by [pre_encode_audio_stream::get_next_buffer](pre_encode_audio_stream_get_next_buffer.md).
kindex: get_pre_processed_format
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/16/2020'
security: public
applies-to: pc-gdk
---

# pre_encode_audio_stream::get_pre_processed_format
  
Gets the audio format of the buffers that are returned by [pre_encode_audio_stream::get_next_buffer](pre_encode_audio_stream_get_next_buffer.md).  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
game_chat_audio_format get_pre_processed_format(  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
None.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: [game_chat_audio_format](../../../structs/game_chat_audio_format.md)  
  
Returns the audio format of the buffers that are returned by [pre_encode_audio_stream::get_next_buffer](pre_encode_audio_stream_get_next_buffer.md).  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method returns a game_chat_audio_format structure that represents the audio format of the buffers returned by calling the [pre_encode_audio_stream::get_next_buffer](pre_encode_audio_stream_get_next_buffer.md) method for this stream.  
  > [!NOTE]
> The pre-processed audio format returned by this method is always a single-channel (mono) format, with sample types represented by 32-bit floating-point decimal numbers, 16-bit integers, and 32-bit integers.  
  
For more information about manipulating pre-encode chat audio data, see [Real-time audio manipulation](../../../../../../chat/overviews/game-chat2/real-time-audio-manipulation.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[pre_encode_audio_stream](../pre_encode_audio_stream.md)  
  