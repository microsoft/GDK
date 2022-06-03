---
author: M-Stahl
title: game_chat_audio_format
description: Describes the format information needed to interpret Game Chat 2 audio data.
kindex: game_chat_audio_format
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 10/08/2020
security: public
applies-to: pc-gdk
---

# game_chat_audio_format
  
Describes the format information needed to interpret Game Chat 2 audio data.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
typedef struct game_chat_audio_format {  
    uint32_t sample_rate;  
    uint32_t channel_mask;  
    uint16_t channel_count;  
    uint16_t bits_per_sample;  
    game_chat_sample_type sample_type;  
    bool is_interleaved;  
} game_chat_audio_format  
```
  
<a id="membersSection"></a>
  
### Members
  
*sample_rate*&nbsp;&nbsp;  
Type: uint32_t  
  
The sample frequency at which each channel should be played or recorded.  
  
*channel_mask*&nbsp;&nbsp;  
Type: uint32_t  
  
The channel mask with which to override the assignment of channels in a multichannel audio stream to speaker positions. For the bit-to-speaker mapping of this value, see the description of the *dwChannelMask* member for the [WAVEFORMATEXTENSIBLE](/windows-hardware/drivers/ddi/ksmedia/ns-ksmedia-waveformatextensible) structure on [Microsoft Docs](/). To use the default mapping, set this to 0.  
  
*channel_count*&nbsp;&nbsp;  
Type: uint16_t  
  
The number of channels of audio data.  
  
*bits_per_sample*&nbsp;&nbsp;  
Type: uint16_t  
  
The number of bits per sample. If this value is not byte-divisible, it is assumed that the containing sample type is padded with bits to make it byte-divisible.  
  
*sample_type*&nbsp;&nbsp;  
Type: [game_chat_sample_type](../enums/game_chat_sample_type.md)  
  
Specifies whether Game Chat 2 is using Pulse Code Manipulation (PCM) data represented by integers ([game_chat_sample_type::integer](../enums/game_chat_sample_type.md)) or floating-point numbers ([game_chat_sample_type::ieee_float](../enums/game_chat_sample_type.md)).  
  
*is_interleaved*&nbsp;&nbsp;  
Type: bool  
  
A flag representing whether the multichannel audio stream is interleaved for multi-channel formats.  
  
Audio retrieved from Game Chat 2 is always marked as interleaved. This parameter has meaning only if [game_chat_audio_format::channel_count](game_chat_audio_format.md) is greater than 1.
  
<a id="remarksSection"></a>
  
## Remarks
  
This structure is used to describe the format of audio data for pre-encode audio streams, post-decode audio source streams, and post-decode audio sink streams in Game Chat 2. The following functions get or set the `game_chat_audio_format` used by their corresponding stream objects:
  
- [pre_encode_audio_stream::get_pre_processed_format](../classes/pre_encode_audio_stream/methods/pre_encode_audio_stream_get_pre_processed_format.md)  
- [pre_encode_audio_stream::set_processed_format](../classes/pre_encode_audio_stream/methods/pre_encode_audio_stream_set_processed_format.md)  
- [post_decode_audio_source_stream::get_pre_processed_format](../classes/post_decode_audio_source_stream/methods/post_decode_audio_source_stream_get_pre_processed_format.md)  
- [post_decode_audio_sink_stream::set_processed_format](../classes/post_decode_audio_sink_stream/methods/post_decode_audio_sink_stream_set_processed_format.md)  
  
For more information about audio formats, see [Real-time audio manipulation](../../../../chat/overviews/game-chat2/real-time-audio-manipulation.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_manager](../classes/chat_manager/chat_manager.md)  
[pre_encode_audio_stream](../classes/pre_encode_audio_stream/pre_encode_audio_stream.md)  
[post_decode_audio_sink_stream](../classes/post_decode_audio_sink_stream/post_decode_audio_sink_stream.md)  
[post_decode_audio_source_stream](../classes/post_decode_audio_source_stream/post_decode_audio_source_stream.md)  
[GameChat2 members](../gamechat2_members.md)  
  