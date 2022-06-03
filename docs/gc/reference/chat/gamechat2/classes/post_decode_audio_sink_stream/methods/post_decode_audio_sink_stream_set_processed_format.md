---
author: M-Stahl
title: set_processed_format
description: Specifies the format of the processed audio that is submitted to Game Chat 2 for rendering through [post_decode_audio_sink_stream::submit_mixed_buffer](post_decode_audio_sink_stream_submit_mixed_buffer.md).
kindex: set_processed_format
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/15/2020'
security: public
applies-to: pc-gdk
---

# post_decode_audio_sink_stream::set_processed_format
  
Specifies the format of the processed audio that is submitted to Game Chat 2 for rendering through [post_decode_audio_sink_stream::submit_mixed_buffer](post_decode_audio_sink_stream_submit_mixed_buffer.md).  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void set_processed_format(  
    game_chat_audio_format format  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
*format* &nbsp;&nbsp;\_In\_  
Type: [game_chat_audio_format](../../../structs/game_chat_audio_format.md)  
  
The format of the audio submitted for Game Chat 2 to render. Interleaved formats are preferred. Non-interleaved formats are interleaved for rendering, which incurs a performance penalty.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: void  
  
None.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method specifies the format of the audio submitted for Game Chat 2 to render, by calling [post_decode_audio_sink_stream::submit_mixed_buffer](post_decode_audio_sink_stream_submit_mixed_buffer.md). This method must be called before `post_decode_audio_sink_stream::submit_mixed_buffer` is called for the first time, and cannot be called after that.  
  > [!NOTE]
> This method can be called only while the stream is open; otherwise, an error occurs. You can call the [post_decode_audio_sink_stream::is_open](post_decode_audio_sink_stream_is_open.md) method to confirm that the stream is open before calling this method.  
  
For more information about manipulating post-decode chat audio data, see [Real-time audio manipulation](../../../../../../chat/overviews/game-chat2/real-time-audio-manipulation.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[post_decode_audio_sink_stream](../post_decode_audio_sink_stream.md)  
  