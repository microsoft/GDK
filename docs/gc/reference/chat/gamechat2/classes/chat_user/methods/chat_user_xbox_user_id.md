---
author: M-Stahl
title: xbox_user_id
description: Returns the unique Xbox User ID of this user.
kindex: xbox_user_id
ms.author: jkepner
ms.topic: reference
ms.date: '09/13/2019'
edited: '09/11/2020'
security: public
applies-to: pc-gdk
---

# chat_user::xbox_user_id
  
Returns the unique Xbox User ID of this user.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
_Ret_z_ xbox_user_id(  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
None.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: \_Ret\_z\_  
  
Returns a pointer to a null-terminated string that represents the unique Xbox User ID of this user.
  
<a id="remarksSection"></a>
  
## Remarks
  
This method returns a pointer to a null-terminated string that represents the unique Xbox User ID for this [chat_user](../chat_user.md) object. The memory for the returned string pointer remains valid for the life of the `chat_user object`, which is until the user has been removed by a call to the [chat_manager::remove_user](../../chat_manager/methods/chat_manager_remove_user.md) method. For more information about managing users with the local [chat_manager](../../chat_manager/chat_manager.md) instance for your app, see the [Adding users to Game Chat 2](../../../../../../chat/overviews/game-chat2/using-game-chat-2.md#adding_users_to_game_chat_2) section in [Using the Game Chat 2 C++ API](../../../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_user::custom_user_context](chat_user_custom_user_context.md)  
[chat_user](../chat_user.md)  
  