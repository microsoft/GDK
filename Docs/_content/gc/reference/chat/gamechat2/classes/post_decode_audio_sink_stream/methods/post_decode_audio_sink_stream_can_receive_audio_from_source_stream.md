---
author: M-Stahl
title: can_receive_audio_from_source_stream
description: Determine whether Game Chat will allow audio communication from the users associated with a post-decode source stream to the users associated with this post-decode sink stream based on communication relationships and platform requirements such as system-level mutes.
kindex: can_receive_audio_from_source_stream
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# post_decode_audio_sink_stream::can_receive_audio_from_source_stream  

Determine whether Game Chat will allow audio communication from the users associated with a post-decode source stream to the users associated with this post-decode sink stream based on communication relationships and platform requirements such as system-level mutes. Also optionally provides a suggested volume that the source stream's audio should be mixed to.  

## Syntax  
  
```cpp
bool can_receive_audio_from_source_stream(  
    post_decode_audio_source_stream* sourceStream,  
    float* volume  
)  
```  
  
### Parameters  
  
*sourceStream* &nbsp;&nbsp;\_In\_  
Type: [post_decode_audio_source_stream*](../../post_decode_audio_source_stream/post_decode_audio_source_stream.md)  
  
The post-decode source audio stream whose users we are evaluating for their communication relationships.  
  
*volume* &nbsp;&nbsp;\_Out\_opt\_  
Type: float*  
  
The volume that Game Chat would mix the source stream's audio with if post-decode buffer manipulation was not enabled. This is a suggested volume, but apps may use their own heuristic for resolving volume. The volume returned will be the minimum render volume between each of the source users and each of the sink users, regardless of the shared device resolution mode, similar to [chat_user\::chat_user_local\::audio_render_volume](../../chat_user/chat_user_local/methods/chat_user_local_audio_render_volume.md).  
  
  
### Return value  
Type: bool
  
  
## Remarks  
  
This is a convenience method that is equivalent to calling [chat_user::get_effective_communication_relationship](../../chat_user/chat_user_local/methods/chat_user_local_get_effective_communication_relationship.md) between each source stream user and each sink stream user and coalescing the result. In the event of a shared device, this method will return permissive or restrictive results based on the shared device resolution mode specified in [chat_manager::initialize](../../chat_manager/methods/chat_manager_initialize.md) and the app-specified communication relationships. Platform restrictions (e.g. mute or block) will be restrictive regardless of the device resolution mode. Privacy/privilege for a stream will not consider users that have been removed by calling [chat_manager::remove_user](../../chat_manager/methods/chat_manager_remove_user.md). If all of the users on the source or sink stream have been removed, then this method will return false and set the volume, if provided, to zero.
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[post_decode_audio_sink_stream](../post_decode_audio_sink_stream.md)  
[chat_user\::chat_user_local\::audio_render_volume](../../chat_user/chat_user_local/methods/chat_user_local_audio_render_volume.md)  
[game_chat_shared_device_communication_relationship_resolution_mode](../../../enums/game_chat_shared_device_communication_relationship_resolution_mode.md)  
[chat_manager::initialize](../../chat_manager/methods/chat_manager_initialize.md)
  
  