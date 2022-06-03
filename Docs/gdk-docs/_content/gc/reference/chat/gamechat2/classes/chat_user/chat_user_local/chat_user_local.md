---
author: M-Stahl
title: Class contents
description: A subclass encapsulating the operations possible on local users only.
kindex: chat_user_local
ms.author: jkepner
ms.topic: reference
ms.date: '09/13/2019'
edited: 00/00/0000
security: public
applies-to: pc-gdk
quality: good
---

# chat_user_local  

A subclass encapsulating the operations possible on local users only.  

## Syntax  
  
```cpp  
class chat_user_local  
```  
  
  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [audio_render_volume](methods/chat_user_local_audio_render_volume.md) | Provides the current volume setting for audio received from the target user that will be used for the local user. |  
| [get_effective_communication_relationship](methods/chat_user_local_get_effective_communication_relationship.md) | Gets the communication relationship that Game Chat is enforcing between the local user and a target user. |  
| [microphone_muted](methods/chat_user_local_microphone_muted.md) | Returns whether the user's microphone has been previously configured to be in the muted state. |  
| [remote_user_muted](methods/chat_user_local_remote_user_muted.md) | Returns whether the remote user has previously been muted in relation to the local user. |  
| [send_chat_text](methods/chat_user_local_send_chat_text.md) | Generates a chat text string to be sent to all users in the local [chat_manager](../../chat_manager/chat_manager.md) instance that are configured to receive communication from this user. |  
| [set_audio_render_volume](methods/chat_user_local_set_audio_render_volume.md) | Configures the volume setting applied to audio received by the local user from the specified target user. |  
| [set_communication_relationship](methods/chat_user_local_set_communication_relationship.md) | Sets the communication relationship between the local user and a target user. |  
| [set_microphone_muted](methods/chat_user_local_set_microphone_muted.md) | Configures whether the user's microphone is in the mute state. |  
| [set_remote_user_muted](methods/chat_user_local_set_remote_user_muted.md) | Configures whether the remote user is muted in relation to the local user. |  
| [speech_to_text_conversion_preference_enabled](methods/chat_user_local_speech_to_text_conversion_preference_enabled.md) | Returns true if this user has enabled speech-to-text conversion. |  
| [synthesize_text_to_speech](methods/chat_user_local_synthesize_text_to_speech.md) | Synthesizes the text message as audio and generates audio packets as if the audio came from the local user's microphone. |  
| [text_to_speech_conversion_preference_enabled](methods/chat_user_local_text_to_speech_conversion_preference_enabled.md) | Returns true if this user has enabled text-to-speech conversion. |  

  
## Remarks  
  
Calling the [chat_user\::local()](../methods/chat_user_local_function-overloads.md) method returns a pointer to an instance of the chat_user\::chat_user_local class if the user is local, and null otherwise.
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameChat2 members](../../../gamechat2_members.md)  
[chat_user](../chat_user.md)  
[chat_user::local()](../methods/chat_user_local_function.md)
  
  
  