---
author: M-Stahl
title: remote_user_muted
description: Returns whether the remote user has previously been muted in relation to the local user.
kindex: remote_user_muted
ms.author: jkepner
ms.topic: reference
ms.date: '09/13/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# chat_user_local::remote_user_muted  

Returns whether the remote user has previously been muted in relation to the local user.  

## Syntax  
  
```cpp
bool remote_user_muted(  
    chat_user* targetUser  
)  
```  
  
### Parameters  
  
*targetUser* &nbsp;&nbsp;\_In\_  
Type: [chat_user*](../../chat_user.md)  
  
  
  
### Return value  
Type: bool
  
  
## Remarks  
  
Muting determines whether incoming communications (both audio and text) from the target user will be presented to the local user. When the target user is muted by the local user, the incoming communications will not be presented to the local user; the remote user's audio will not be rendered for the local user, and the local user will never be in the receiver list for a text message from the remote user.

A remote user's mute state can be modified using the chat_user\::chat_user_local\::set_remote_user_muted() method.
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[chat_user_local](../chat_user_local.md)  
[chat_user::set_remote_user_muted](chat_user_local_set_remote_user_muted.md)  
[chat_user\::chat_user_local\::audio_render_volume](chat_user_local_audio_render_volume.md)  
[chat_user::chat_indicator](../../methods/chat_user_chat_indicator.md)
  
  