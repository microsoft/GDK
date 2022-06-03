---
author: M-Stahl
title: audio_render_volume
description: Provides the current volume setting for audio received from the target user that will be used for the local user.
kindex: audio_render_volume
ms.author: jkepner
ms.topic: reference
ms.date: '09/13/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# chat_user_local::audio_render_volume  

Provides the current volume setting for audio received from the target user that will be used for the local user.  

## Syntax  
  
```cpp
_Ret_range_(0, 1)
float audio_render_volume(
    _In_ chat_user * targetUser
    )
```  
  
### Parameters  
  
  
### Return value  
Type: float \_Ret_range_(0, 1)
  
  
## Remarks  
  
The volume is a fractional percentage between 0.0 (quietest possible) and 1.0 (the standard chat volume). Values outside the [0, 1] range are clamped to the nearest extremum.

If the local user is on a shared audio device, such as Kinect, the effective volume will be the minimum of all volumes set the target user and local users on the shared device. E.g. if User A and User B are on a Kinect, and User A has set remote User C's volume to 0.5, while User B has set remote User C's volume to 0.6, Game Chat will render remote User C's audio to the Kinect with a volume of 0.5.
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[chat_user_local](../chat_user_local.md)  
[chat_user::chat_user_local::set_audio_render_volume](chat_user_local_set_audio_render_volume.md)  
[chat_user::chat_user_local::set_microphone_muted](chat_user_local_set_microphone_muted.md)  
[chat_user::chat_user_local::set_remote_user_muted](chat_user_local_set_remote_user_muted.md)
  
  