---
author: M-Stahl
title: speech_to_text_conversion_preference_enabled
description: Returns true if this user has enabled speech-to-text conversion.
kindex: speech_to_text_conversion_preference_enabled
ms.author: jkepner
ms.topic: reference
ms.date: '09/13/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# chat_user_local::speech_to_text_conversion_preference_enabled  

Returns true if this user has enabled speech-to-text conversion.  

## Syntax  
  
```cpp
bool speech_to_text_conversion_preference_enabled(  
)  
```  
  
### Parameters  
  
  
### Return value  
Type: bool
  
  
## Remarks  
  
If this user has enabled speech-to-text conversion, this method returns true. Apps may listen for a game_chat_chat_text_conversion_preference_changed_state_change to know when a local player enables or disables this preference.

When this preference is enabled, Game Chat will automatically transcribe outgoing audio associated with the local user and incoming audio associated with users that are allowed to speak to the local user. Each transcription will be provided to the app as a [game_chat_transcribed_chat_received_state_change](../../../../structs/game_chat_transcribed_chat_received_state_change.md). The app should display this message on screen for the user that has requested speech-to-text. Apps should render these messages similarly to other text messages, but should also show an icon or indicator that the message was transcribed from speech.  

Apps can use the value of this preference to customize the user interface to support incoming transcribed speech-to-text messages, for example by showing a caption pane.  

When speech-to-text is enabled by a local user in a Game Chat session, the Game Chat client on each remote device initiates a web socket connection with the speech services endpoint. Each remote Game Chat client uploads audio to the speech services endpoint through this websocket; the speech services endpoint occasionally gives back a transcription to the remote device. The remote device then sends the transcription message (i.e. a text message) to the local device, where the transcribed message is given by Game Chat to the app to render. The majority of the websocket traffic is the upload of encoded audio data to the speech services endpoint. The audio data uploaded is used from Game Chat's internal encoding operations for data going to other users in session; as such, the bandwidth is proportional to the bitrate configured by a call to set_audio_encoding_bitrate().
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[chat_user_local](../chat_user_local.md)  
[chat_user\::chat_user_local\::text_to_speech_conversion_preference_enabled](chat_user_local_text_to_speech_conversion_preference_enabled.md)  
[chat_user\::chat_user_local\::send_chat_text](chat_user_local_send_chat_text.md)  
[chat_manager::set_audio_encoding_bitrate](../../../chat_manager/methods/chat_manager_set_audio_encoding_bitrate.md)  
[chat_manager::audio_encoding_bitrate](../../../chat_manager/methods/chat_manager_audio_encoding_bitrate.md)
  
  