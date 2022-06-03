---
author: M-Stahl
title: Class contents
description: Provides management functionality for interacting with Game Chat 2.
kindex: chat_manager
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 10/08/2020
security: public
applies-to: pc-gdk
---

# chat_manager
  
Provides management functionality for interacting with Game Chat 2.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp  
class chat_manager  
```  
  
  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [add_local_user](methods/chat_manager_add_local_user.md) | Adds a local user to the local chat_manager instance. |  
| [add_remote_user](methods/chat_manager_add_remote_user.md) | Adds a remote user to the local chat_manager instance. |  
| [audio_encoding_bitrate](methods/chat_manager_audio_encoding_bitrate.md) | Indicates the audio encoding bit rate for the chat instance. |  
| [audio_manipulation_mode](methods/chat_manager_audio_manipulation_mode.md) | Indicates the audio manipulation mode enabled for the chat instance. |  
| [cleanup](methods/chat_manager_cleanup.md) | Immediately reclaims all resources associated with the chat instance. |  
| [finish_processing_data_frames](methods/chat_manager_finish_processing_data_frames.md) | Indicates that the app has finished processing data frames, and that Game Chat 2 can release associated resources. |  
| [finish_processing_state_changes](methods/chat_manager_finish_processing_state_changes.md) | Returns an array of Game Chat state changes that were being processed. |  
| [finish_processing_stream_state_changes](methods/chat_manager_finish_processing_stream_state_changes.md) | Returns an array of Game Chat stream state changes that were processed by the caller of chat_manager::start_processing_stream_state_changes. |  
| [get_chat_users](methods/chat_manager_get_chat_users.md) | Retrieves the collection of users that have been added to the chat instance. |  
| [get_memory_callbacks](methods/chat_manager_get_memory_callbacks.md) | Retrieves the current memory allocation and freeing callbacks currently used by the Game Chat library. |  
| [get_post_decode_audio_sink_streams](methods/chat_manager_get_post_decode_audio_sink_streams.md) | Gets the collection of post-decode audio sink streams. |  
| [get_post_decode_audio_source_streams](methods/chat_manager_get_post_decode_audio_source_streams.md) | Gets the collection of post-decode audio source streams. |  
| [get_pre_encode_audio_streams](methods/chat_manager_get_pre_encode_audio_streams.md) | Gets the collection of pre-encode audio streams. |  
| [get_thread_processor](methods/chat_manager_get_thread_processor.md) | Retrieves the current processor on which internal Game Chat threads will run or are running. |  
| [initialize](methods/chat_manager_initialize.md) | Initializes the object instance. |  
| [process_incoming_data](methods/chat_manager_process_incoming_data.md) | Delivers data to Game Chat 2 that was received from a remote instance of Game Chat 2. |  
| [remove_user](methods/chat_manager_remove_user.md) | Removes a user, either local or remote, from the local chat_manager instance. |  
| [set_audio_encoding_bitrate](methods/chat_manager_set_audio_encoding_bitrate.md) | Sets the audio encoding bit rate for the chat instance. |  
| [set_legacy_era_uwp_compat_mode_enabled](methods/chat_manager_set_legacy_era_uwp_compat_mode_enabled.md) | Indicates whether the legacy ERA and Windows Platform (UWP) compatibility mode for Game Chat 2 should be enabled. |  
| [set_memory_callbacks](methods/chat_manager_set_memory_callbacks.md) | Optionally configures the current memory allocation and freeing callbacks the Game Chat library should use. |  
| [set_thread_processor](methods/chat_manager_set_thread_processor.md) | Optionally configures the processor on which internal Game Chat threads will run. |  
| [singleton_instance](methods/chat_manager_singleton_instance.md) | Retrieves a reference to the Game Chat 2 singleton instance. |  
| [start_processing_data_frames](methods/chat_manager_start_processing_data_frames.md) | Retrieves all data frames queued by Game Chat 2 to be delivered by the app's transport layer to the appropriate remote app instances. |  
| [start_processing_state_changes](methods/chat_manager_start_processing_state_changes.md) | Retrieves an array of all Game Chat state changes to process since the last such call. |  
| [start_processing_stream_state_changes](methods/chat_manager_start_processing_stream_state_changes.md) | Retrieves an array of all Game Chat 2 audio stream state changes that occurred since the last call to this method. |  

  
<a id="remarksSection"></a>
  
## Remarks
  
The `chat_manager` class is the primary management class for interacting with Game Chat 2. With this class, you can:  
  
- Manage local and remote users  
- Process state changes, data frames, and incoming data  
- Configure audio settings for Game Chat 2  
  
Only a single instance of the `chat_manager` class is permitted. Use the [singleton_instance](methods/chat_manager_singleton_instance.md) method to retrieve a reference to the Game Chat 2 singleton instance for this class.  
  
For more information about interacting with Game Chat 2, see [Using the Game Chat 2 C++ API](../../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection">
  
## See also
  
[Intro to Game Chat 2](../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_user](../chat_user/chat_user.md)  
[GameChat2 members](../../gamechat2_members.md)  
  