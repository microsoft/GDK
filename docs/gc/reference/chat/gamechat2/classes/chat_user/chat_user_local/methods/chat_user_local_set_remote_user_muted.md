---
author: M-Stahl
title: set_remote_user_muted
description: Configures whether the remote user is muted in relation to the local user.
kindex: set_remote_user_muted
ms.author: jkepner
ms.topic: reference
ms.date: '09/13/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# chat_user_local::set_remote_user_muted  

Configures whether the remote user is muted in relation to the local user.  

## Syntax  
  
```cpp
void set_remote_user_muted(  
    chat_user* targetUser,  
    bool muted  
)  
```  
  
### Parameters  
  
*targetUser* &nbsp;&nbsp;\_In\_  
Type: [chat_user*](../../chat_user.md)  
  
  
*muted* &nbsp;&nbsp;\_In\_  
Type: bool  
  
  
  
### Return value  
Type: void
  
  
## Remarks  
  
Muting determines whether communications (both audio and text) will be presented to the local user. When muted, the remote user's audio will not be rendered for the local user and the local user will never been in the receiver list for a text message from the remote user.

If the local user is on a shared device, such as Kinect, the mute state for the target user will apply for all local users on the shared device.
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[chat_user_local](../chat_user_local.md)  
[chat_user::chat_user_local::remote_user_muted](chat_user_local_remote_user_muted.md)  
[chat_user::chat_user_local::audio_render_volume](chat_user_local_audio_render_volume.md)  
[chat_user::chat_indicator](../../methods/chat_user_chat_indicator.md)
  
  