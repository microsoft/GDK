---
author: M-Stahl
title: get_users
description: Retrieves the users that generate the audio retrieved from this source.
kindex: get_users
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/15/2020'
security: public
applies-to: pc-gdk
---

# post_decode_audio_source_stream::get_users
  
Retrieves the users that generate the audio retrieved from this source.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void get_users(  
    uint32_t* chatUserCount,  
    chat_user_array* chatUsers  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
*chatUserCount* &nbsp;&nbsp;\_Out\_  
Type: uint32_t\*  
  
The total number of users that generate the audio retrieved from this source.  
  
*chatUsers* &nbsp;&nbsp;\_Outptr\_result\_buffer\_(\*chatUserCount)  
Type: [chat_user_array](../../chat_user/chat_user.md#array)\*  
  
An array of [chat_user](../../chat_user/chat_user.md) pointers which represents the users that generate the audio retrieved from this source.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: void  
  
None.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method retrieves the collection of users which represents the users that generate the audio retrieved from this source stream, returning the total number of users in `chatUserCount` and an array of `chat_user` pointers in `chatUsers`. The array pointer returned in `chatUsers` remains valid until this stream is destroyed.  
  
The individual `chat_user` objects remain valid until a user has been removed by a call to [chat_manager::remove_user](../../chat_manager/methods/chat_manager_remove_user.md). If this stream is destroyed as the result of calling `chat_manager::remove_user`, the `chat_user` pointer for that removed user also becomes invalid.  
  
For more information about initializing and cleaning up a chat instance, see [Using the Game Chat 2 C++ API](../../../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[post_decode_audio_source_stream](../post_decode_audio_source_stream.md)  
  