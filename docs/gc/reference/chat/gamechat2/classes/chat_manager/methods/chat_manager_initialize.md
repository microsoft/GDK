---
author: M-Stahl
title: initialize
description: Initializes the object instance.
kindex: initialize
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# chat_manager::initialize  

Initializes the object instance.  

## Syntax  
  
```cpp
void initialize(  
    uint32_t maxChatUserCount,  
    float defaultAudioRenderVolume= 1.0f,  
    game_chat_communication_relationship_flags defaultLocalToRemoteCommunicationRelationship= game_chat_communication_relationship_flags none,  
    game_chat_shared_device_communication_relationship_resolution_mode sharedDeviceResolutionMode= game_chat_shared_device_communication_relationship_resolution_mode permissive,  
    game_chat_speech_to_text_conversion_mode speechToTextConversionMode= game_chat_speech_to_text_conversion_mode automatic,  
    game_chat_audio_manipulation_mode_flags audioManipulationMode= game_chat_audio_manipulation_mode_flags none  
)  
```  
  
### Parameters  
  
*maxChatUserCount* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The maximum total number of local and remote users that will be added to the local chat_manager instance at any given time. Game Chat pre-allocates memory proportional to the number of users.  
  
*defaultAudioRenderVolume* &nbsp;&nbsp;\_In\_range\_(0,1)  
Type: float  
  
The audio render volume that will be used for new users.  
  
*defaultLocalToRemoteCommunicationRelationship* &nbsp;&nbsp;\_In\_  
Type: [game_chat_communication_relationship_flags](../../../enums/game_chat_communication_relationship_flags.md)  
  
The default communication relationship that will be used between local and remote users. I.e. when a remote user joins, this will be the default relationship used between all existing local users and that remote user. When a local user joins, this will be the default relationship between that local user and all existing remote users.  
  
*sharedDeviceResolutionMode* &nbsp;&nbsp;\_In\_  
Type: [game_chat_shared_device_communication_relationship_resolution_mode](../../../enums/game_chat_shared_device_communication_relationship_resolution_mode.md)  
  
The resolution mode used for users on a shared device who have conflicting communication relationships.  
  
*speechToTextConversionMode* &nbsp;&nbsp;\_In\_  
Type: [game_chat_speech_to_text_conversion_mode](../../../enums/game_chat_speech_to_text_conversion_mode.md)  
  
Configures the speech-to-text conversion mode.  
  
*audioManipulationMode* &nbsp;&nbsp;\_In\_  
Type: [game_chat_audio_manipulation_mode_flags](../../../enums/game_chat_audio_manipulation_mode_flags.md)  
  
Passing this param as game_chat_audio_manipulation_mode_flags\::none allows audio to flow through Game Chat uninterrupted. Passing this param with the game_chat_audio_manipulation_mode_flags\::pre_encode_stream_manipulation bit set grants access to chat user audio data for processing and manipulation on the sender-side. Access to the audio data is enabled through the use of the [pre_encode_audio_stream](../../pre_encode_audio_stream/pre_encode_audio_stream.md) objects. These objects can be queried for using the [chat_manager\::get_pre_encode_audio_streams](chat_manager_get_pre_encode_audio_streams.md) method. When Game Chat creates, closes, and destroys [pre_encode_audio_stream](../../pre_encode_audio_stream/pre_encode_audio_stream.md) objects, corresponding [game_chat_stream_state_change](../../../structs/game_chat_stream_state_change.md) events will be generated. Passing this param with the game_chat_audio_manipulation_mode_flags\::post_decode_stream_manipulation bit set grants access to chat user audio data for processing and manipulation on the receiver-side. Access to the audio data is enabled through the use of the [post_decode_audio_source_stream](../../post_decode_audio_source_stream/post_decode_audio_source_stream.md) and [post_decode_audio_sink_stream](../../post_decode_audio_sink_stream/post_decode_audio_sink_stream.md) objects. These objects can be queried for using the [chat_manager\::get_post_decode_audio_source_streams](chat_manager_get_post_decode_audio_source_streams.md) and [chat_manager\::get_post_decode_audio_sink_streams](chat_manager_get_post_decode_audio_sink_streams.md) methods. When Game Chat creates, closes, and destroys [post_decode_audio_source_stream](../../post_decode_audio_source_stream/post_decode_audio_source_stream.md) and [post_decode_audio_sink_stream](../../post_decode_audio_sink_stream/post_decode_audio_sink_stream.md) objects, corresponding [game_chat_stream_state_change](../../../structs/game_chat_stream_state_change.md) events will be generated.  
  
  
### Return value  
Type: void
  
  
## Remarks  
  
This must be called before any other method, aside from the static methods chat_manager\::singleton_instance(), chat_manager\::set_memory_callbacks(), chat_manager\::get_memory_callbacks(), chat_manager\::set_thread_processor(), and chat_manager\::get_thread_processor(). chat_manager\::initialize() cannot be called again without a subsequent chat_manager\::cleanup() call.

Every call to chat_manager\::initialize() should have a corresponding chat_manager\::cleanup() call.
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[chat_manager](../chat_manager.md)  
[chat_manager::cleanup](chat_manager_cleanup.md)  
[chat_manager::singleton_instance](chat_manager_singleton_instance.md)  
[chat_manager::set_memory_callbacks](chat_manager_set_memory_callbacks.md)  
[chat_manager::get_memory_callbacks](chat_manager_get_memory_callbacks.md)  
[chat_manager::set_thread_processor](chat_manager_set_thread_processor.md)  
[chat_manager::get_thread_processor](chat_manager_get_thread_processor.md)  
[pre_encode_audio_stream](../../pre_encode_audio_stream/pre_encode_audio_stream.md)  
[post_decode_audio_source_stream](../../post_decode_audio_source_stream/post_decode_audio_source_stream.md)  
[post_decode_audio_sink_stream](../../post_decode_audio_sink_stream/post_decode_audio_sink_stream.md)
  
  