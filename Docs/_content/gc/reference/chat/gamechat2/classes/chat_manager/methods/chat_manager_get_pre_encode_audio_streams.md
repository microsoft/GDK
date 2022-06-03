---
author: M-Stahl
title: get_pre_encode_audio_streams
description: Gets the collection of pre-encode audio streams.
kindex: get_pre_encode_audio_streams
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# chat_manager::get_pre_encode_audio_streams  

Gets the collection of pre-encode audio streams.  

## Syntax  
  
```cpp
void get_pre_encode_audio_streams(  
    uint32_t* preEncodeAudioStreamCount,  
    pre_encode_audio_stream_array* preEncodeAudioStreams  
)  
```  
  
### Parameters  
  
*preEncodeAudioStreamCount* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
    
  
*preEncodeAudioStreams* &nbsp;&nbsp;\_Outptr\_result\_buffer\_(\*preEncodeAudioStreamCount)  
Type: pre_encode_audio_stream_array\*  
  
  
  
### Return value  
Type: void
  
  
## Remarks  
  
The streams returned by this method are not in any guaranteed order. The order of the streams is also not guaranteed to be consistent between calls to this method. The array returned is only valid until a [game_chat_stream_state_change_type::pre_encode_audio_stream_destroyed](../../../enums/game_chat_stream_state_change_type.md) stream state change is returned. Will only return streams if pre-encode audio stream processing has been enabled.
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[chat_manager](../chat_manager.md)  
[chat_manager::get_post_decode_audio_source_streams](chat_manager_get_post_decode_audio_source_streams.md)  
[chat_manager::get_post_decode_audio_sink_streams](chat_manager_get_post_decode_audio_sink_streams.md)
  
  