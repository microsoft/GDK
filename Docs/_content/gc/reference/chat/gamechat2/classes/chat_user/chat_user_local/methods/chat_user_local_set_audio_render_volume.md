---
author: M-Stahl
title: set_audio_render_volume
description: Configures the volume setting applied to audio received by the local user from the specified target user.
kindex: set_audio_render_volume
ms.author: jkepner
ms.topic: reference
ms.date: '09/13/2019'
edited: '09/11/2020'
security: public
applies-to: pc-gdk
---

# chat_user_local::set_audio_render_volume
  
Configures the volume setting applied to audio received by the local user from the specified target user.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void set_audio_render_volume(  
    chat_user* targetUser,  
    float volume  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
*targetUser* &nbsp;&nbsp;\_In\_  
Type: [chat_user](../../chat_user.md)\*  
  
The target user to whom the volume setting specified in *volume* is applied in relation to the local user. The target user can be either local or remote. The default volume for remote target users is 1.0, while the default volume for local target users is 0.0.  
  
*volume* &nbsp;&nbsp;\_In\_range\_(0,1)  
Type: float  
  
The new volume setting.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: void  
  
None.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method configures the volume setting for audio sent to the local user from the specified target user. The volume setting is a fractional percentage between 0.0 (quietest possible) and 1.0 (the standard chat volume). Values less than 0.0 or greater than 1.0 are clamped to the nearest extremum. This is a local setting that takes effect immediately. You can call the [chat_user::chat_user_local::audio_render_volume](chat_user_local_audio_render_volume.md) method to get the current volume setting for a specified target user.  
  
If the local user is on a shared audio device, such as Kinect, the effective volume for a target user is the minimum of all volumes set for that target user by all local users on the shared device. For example, if User A and User B are on a Kinect, and User A has set remote User C's volume to 0.5, while User B has set remote User C's volume to 0.6, Game Chat 2 renders remote User C's audio to that Kinect with a volume of 0.5.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_user_local](../chat_user_local.md)  
  