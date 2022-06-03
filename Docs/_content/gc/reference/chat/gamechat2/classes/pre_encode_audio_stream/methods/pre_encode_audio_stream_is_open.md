---
author: M-Stahl
title: is_open
description: Indicates whether the stream is open.
kindex: is_open
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/16/2020'
security: public
applies-to: pc-gdk
---

# pre_encode_audio_stream::is_open
  
Indicates whether the stream is open.
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
bool is_open(  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
None.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: bool  
  
Returns `TRUE` before this stream's corresponding [pre_encode_audio_stream_closed](../../../structs/game_chat_stream_state_change.md) stream state change is returned to Game Chat 2; otherwise, `FALSE`.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method indicates whether this stream’s corresponding [pre_encode_audio_stream_closed](../../../structs/game_chat_stream_state_change.md) stream state change was returned to Game Chat 2. If this method returns `TRUE`, the stream is open and can continue to retrieve buffers by calling the [pre_encode_audio_stream::get_next_buffer](pre_encode_audio_stream_get_next_buffer.md) method. If this method returns `FALSE`, the stream is closed and cannot retrieve any more buffers.  
  > [!NOTE]
> You should continue to return previously-retrieved buffers to this stream, by calling [pre_encode_audio_stream::return_buffer](pre_encode_audio_stream_return_buffer.md), until all buffers have been returned and the stream’s corresponding [pre_encode_audio_stream_destroyed](../../../structs/game_chat_stream_state_change.md) stream state change is returned to Game Chat 2.  
  
For more information about manipulating pre-encode chat audio data, see [Real-time audio manipulation](../../../../../../chat/overviews/game-chat2/real-time-audio-manipulation.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[pre_encode_audio_stream](../pre_encode_audio_stream.md)  
  