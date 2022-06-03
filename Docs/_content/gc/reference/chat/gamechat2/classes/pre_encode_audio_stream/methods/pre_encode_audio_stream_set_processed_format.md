---
author: M-Stahl
title: set_processed_format
description: Specifies the format of the processed audio that is submitted to Game Chat 2 for encoding and transmission to remote endpoints.
kindex: set_processed_format
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/16/2020'
security: public
applies-to: pc-gdk
---

# pre_encode_audio_stream::set_processed_format
  
Specifies the format of the processed audio that is submitted to Game Chat 2 for encoding and transmission to remote endpoints.  
  
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
  
The format of the audio submitted for Game Chat 2 to encode and transmit. Only formats that meet the following criteria are supported:  
  
* Only single-channel (mono) formats  
* For pre-encode audio streams, only 32-bit float PCM, 32-bit integer PCM, and 16-bit integer PCM formats  
* Only formats with 16-kHz, 24-kHz, or 48-kHz sample rates  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: void  
  
None.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method specifies the format of the processed audio that is submitted to Game Chat 2 for encoding and transmission to remote endpoints, by calling [pre_encode_audio_stream::submit_buffer](pre_encode_audio_stream_submit_buffer.md). This method must be called before `pre_encode_audio_stream::submit_buffer` is called for the first time, and cannot be called after that.  
  > [!NOTE]
> This method can be called only while the stream is open; otherwise, an error occurs. You can call the [pre_encode_audio_stream::is_open](pre_encode_audio_stream_is_open.md) method to confirm that the stream is open before calling this method.  
  
For more information about manipulating pre-encode chat audio data, see [Real-time audio manipulation](../../../../../../chat/overviews/game-chat2/real-time-audio-manipulation.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[pre_encode_audio_stream](../pre_encode_audio_stream.md)  
  