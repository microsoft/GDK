---
author: M-Stahl
title: Class contents
description: Represents an individual local or remote user that has been added to the local [chat_manager](../chat_manager/chat_manager.md) instance.
kindex: chat_user
ms.author: jkepner
ms.topic: reference
ms.date: '09/13/2019'
edited: '09/11/2020'
security: public
applies-to: pc-gdk
---

# chat_user
  
Represents an individual local or remote user that has been added to the local [chat_manager](../chat_manager/chat_manager.md) instance.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp  
class chat_user  
```  
  
  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [chat_indicator](methods/chat_user_chat_indicator.md) | Indicates whether chat is possible and if audio is currently being produced for this user. |  
| [custom_user_context](methods/chat_user_custom_user_context.md) | Retrieves the app's optional, private, custom pointer-sized context value previously associated with this user. |  
| [local](methods/chat_user_local_function-overloads.md) | Returns a pointer to the [chat_user_local](chat_user_local/chat_user_local.md) object associated with this user, if the user is local. |  
| [set_custom_user_context](methods/chat_user_set_custom_user_context.md) | Sets the app's optional, private, custom pointer-sized context value for this user. |  
| [xbox_user_id](methods/chat_user_xbox_user_id.md) | Returns the unique Xbox User ID of this user. |  

  
<a id="remarksSection"></a>
  
## Remarks
  
The `chat_user` class represents a user in Game Chat 2 that has been added to the local singleton instance of the [chat_manager](../chat_manager/chat_manager.md) class, by calling either [chat_manager\::add_local_user](../chat_manager/methods/chat_manager_add_local_user.md) or [chat_manager\::add_remote_user](../chat_manager/methods/chat_manager_add_remote_user.md).  
  
You can use this class to retrieve the Xbox user ID, manage the custom user context, and retrieve the [game_chat_user_chat_indicator](methods/chat_user_chat_indicator.md) for a user. You can also retrieve the [chat_user_local](chat_user_local/chat_user_local.md) instance for a local user.  
  
For more information about working with users in Game Chat 2, see the [Configuring users](../../../../../chat/overviews/game-chat2/using-game-chat-2.md#configuring_users) section of [Using the Game Chat 2 C++ API](../../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
<a id="array"></a>
  
### chat_user_array
  
The `chat_user_array` type is a constant array of `chat_user` pointers. This type is provided for convenience, and is used with:  
  
- [chat_manager\::get_chat_users](../chat_manager/methods/chat_manager_get_chat_users.md) method  
- [game_chat_text_chat_received_state_change](../../structs/game_chat_text_chat_received_state_change.md) structure  
- [game_chat_transcribed_chat_received_state_change](../../structs/game_chat_transcribed_chat_received_state_change.md) structure  
- [post_decode_audio_sink_stream\::get_users](../post_decode_audio_sink_stream/methods/post_decode_audio_sink_stream_get_users.md) method  
- [post_decode_audio_source_stream\::get_users](../post_decode_audio_source_stream/methods/post_decode_audio_source_stream_get_users.md) method  
- [pre_encode_audio_stream\::get_users](../pre_encode_audio_stream/methods/pre_encode_audio_stream_get_users.md) method  
  
```cpp
typedef class chat_user * const * chat_user_array;  
```  
  
<a id="requirementsSection"></a>
  
## Requirements  
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[GameChat2 members](../../gamechat2_members.md)  
  