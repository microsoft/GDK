---
author: M-Stahl
title: text_to_speech_conversion_preference_enabled
description: Returns true if this user has enabled text-to-speech conversion.
kindex: text_to_speech_conversion_preference_enabled
ms.author: jkepner
ms.topic: reference
ms.date: '09/13/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# chat_user_local::text_to_speech_conversion_preference_enabled  

Returns true if this user has enabled text-to-speech conversion.  

## Syntax  
  
```cpp
bool text_to_speech_conversion_preference_enabled(  
)  
```  
  
### Parameters  
  
  
### Return value  
Type: bool
   
  
## Remarks  
  
If this user has enabled text-to-speech conversion, this method returns true. Apps may listen for a game_chat_chat_text_conversion_preference_changed_state_change to know when a local player enables or disables this preference.

If this preference is enabled, when chat_user\::chat_user_local\::synthesize_text_to_speech() is called for this user, remote users will hear synthesized audio representing the contents of the message.  

Apps can use the value of this preference to customize the user interface to support sending synthesized text-to-speech messages, for example by enabling a dedicated button to bring up the text input keyboard.
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[chat_user_local](../chat_user_local.md)  
[chat_user\::chat_user_local\::speech_to_text_conversion_preference_enabled](chat_user_local_speech_to_text_conversion_preference_enabled.md)  
[chat_user\::chat_user_local\::send_chat_text](chat_user_local_send_chat_text.md)
  
  