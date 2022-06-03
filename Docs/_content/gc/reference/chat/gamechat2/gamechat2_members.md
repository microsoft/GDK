---
author: M-Stahl
title: GameChat2 members (API contents)
description: Game Chat 2 APIs
kindex: gamechat2_members
ms.author: jkepner
ms.topic: navigation
ms.date: '09/12/2019'
edited: 00/00/0000
security: public
applies-to: pc-gdk
---

# GameChat2 members  

  
  
## Classes  
  
| Classe | Description |  
| --- | --- |  
| [chat_manager](classes/chat_manager/chat_manager.md) | Provides management functionality for interacting with Game Chat 2. |  
| [chat_user](classes/chat_user/chat_user.md) | Represents an individual local or remote user that has been added to the local [chat_manager](classes/chat_manager/chat_manager.md) instance. |  
| [chat_user_local](classes/chat_user/chat_user_local/chat_user_local.md) | A subclass encapsulating the operations possible on local users only. |  
| [post_decode_audio_sink_stream](classes/post_decode_audio_sink_stream/post_decode_audio_sink_stream.md) | Represents the outbound-data side of the remote audio manipulation pipeline. |  
| [post_decode_audio_source_stream](classes/post_decode_audio_source_stream/post_decode_audio_source_stream.md) | Represents the inbound-data side of the remote audio manipulation pipeline. |  
| [pre_encode_audio_stream](classes/pre_encode_audio_stream/pre_encode_audio_stream.md) | Represents the local audio manipulation pipeline. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [game_chat_allocate_memory_callback](functions/game_chat_allocate_memory_callback.md) | A callback invoked every time a new memory buffer must be dynamically allocated by the Game Chat library. |  
| [game_chat_free_memory_callback](functions/game_chat_free_memory_callback.md) | Represents a callback invoked every time a previously-allocated memory buffer is no longer needed by the Game Chat 2 library and can be freed. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [game_chat_audio_format](structs/game_chat_audio_format.md) | Describes the format information needed to interpret Game Chat 2 audio data. |  
| [game_chat_communication_relationship_adjuster_changed_state_change](structs/game_chat_communication_relationship_adjuster_changed_state_change.md) | Represents information specific to the [game_chat_state_change_type::communication_relationship_adjuster_changed](enums/game_chat_state_change_type.md) state change. |  
| [game_chat_data_frame](structs/game_chat_data_frame.md) | Represents information about outgoing Game Chat 2 data that must be delivered to remote Game Chat 2 endpoints. |  
| [game_chat_state_change](structs/game_chat_state_change.md) | Represents a generic, base structure for an event, change in state, or outgoing data. |  
| [game_chat_stream_state_change](structs/game_chat_stream_state_change.md) | A generic, base structure representation of an event for audio manipulation streams. |  
| [game_chat_text_chat_received_state_change](structs/game_chat_text_chat_received_state_change.md) | Represents information specific to the [game_chat_state_change_type::text_chat_received](enums/game_chat_state_change_type.md) state change. |  
| [game_chat_text_conversion_preference_changed_state_change](structs/game_chat_text_conversion_preference_changed_state_change.md) | Represents information specific to the [game_chat_state_change_type::text_conversion_preference_changed](enums/game_chat_state_change_type.md) state change. |  
| [game_chat_transcribed_chat_received_state_change](structs/game_chat_transcribed_chat_received_state_change.md) | Represents information specific to the [game_chat_state_change_type::transcribed_chat_received](enums/game_chat_state_change_type.md) state change. |  
  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [game_chat_audio_encoding_bitrate](enums/game_chat_audio_encoding_bitrate.md) | Defines the audio encoding bit rate that Game Chat 2 uses for generating outgoing audio packets. |  
| [game_chat_audio_manipulation_mode_flags](enums/game_chat_audio_manipulation_mode_flags.md) | Represents the requested audio manipulation feature status. |  
| [game_chat_communication_relationship_adjuster](enums/game_chat_communication_relationship_adjuster.md) | Defines the extra adjustment steps applied by Game Chat 2 to a communication relationship that was previously set by calling [chat_user_local::set_communication_relationship](classes/chat_user/chat_user_local/methods/chat_user_local_set_communication_relationship.md). |  
| [game_chat_communication_relationship_flags](enums/game_chat_communication_relationship_flags.md) | Defines the communication relationship between two users. |  
| [game_chat_data_transport_requirement](enums/game_chat_data_transport_requirement.md) | Defines the data transport requirements for outgoing data. |  
| [game_chat_sample_type](enums/game_chat_sample_type.md) | Describes the data type that represents a single Game Chat 2 audio sample. |  
| [game_chat_shared_device_communication_relationship_resolution_mode](enums/game_chat_shared_device_communication_relationship_resolution_mode.md) | Defines how Game Chat 2 should resolve communication relationship conflicts for users that are on a shared device, such as Kinect. |  
| [game_chat_speech_to_text_conversion_mode](enums/game_chat_speech_to_text_conversion_mode.md) | Defines the speech-to-text conversion modes available to Game Chat 2. |  
| [game_chat_state_change_type](enums/game_chat_state_change_type.md) | Defines the types of [game_chat_state_change](structs/game_chat_state_change.md) objects that can be reported by [chat_manager::start_processing_state_changes](classes/chat_manager/methods/chat_manager_start_processing_state_changes.md). |  
| [game_chat_stream_state_change_type](enums/game_chat_stream_state_change_type.md) | Defines the types of [game_chat_stream_state_change](structs/game_chat_stream_state_change.md) objects that can be reported by [chat_manager::start_processing_stream_state_changes](classes/chat_manager/methods/chat_manager_start_processing_stream_state_changes.md). |  
| [game_chat_thread_id](enums/game_chat_thread_id.md) | Defines the types of threads that Game Chat 2 uses for internal purposes. |  
| [game_chat_user_chat_indicator](enums/game_chat_user_chat_indicator.md) | Defines the current chat status of a user in relationship to the local users. |  
