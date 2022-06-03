---
author: M-Stahl
title: local
description: Returns a pointer to the [chat_user_local](../chat_user_local/chat_user_local.md) object associated with this user, if the user is local.
kindex: local
ms.author: jkepner
ms.topic: reference
ms.date: '09/13/2019'
edited: '09/11/2020'
security: public
applies-to: pc-gdk
---

# chat_user::local
  
Returns a pointer to the [chat_user_local](../chat_user_local/chat_user_local.md) object associated with this user, if the user is local.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
chat_user_local* local(  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
None.
  
<a id="retvalSection"></a>
  
### Return value
  
Type: [chat_user_local](../chat_user_local/chat_user_local.md)\*
  
Returns a pointer to the [chat_user_local](../chat_user_local/chat_user_local.md) object associated to this user, if the user is local; otherwise, `NULL`.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method returns a pointer to the [chat_user_local](../chat_user_local/chat_user_local.md) object associated with this [chat_user](../chat_user.md) object, if the user is local. The returned pointer remains valid for the life of the associated `chat_user` object, which is until the user has been removed by a call to the [chat_manager::remove_user](../../chat_manager/methods/chat_manager_remove_user.md) method. For more information about adding local and remote users to the local [chat_manager](../../chat_manager/chat_manager.md) instance for your app, see the [Adding users to Game Chat 2](../../../../../../chat/overviews/game-chat2/using-game-chat-2.md#adding_users_to_game_chat_2) section in [Using the Game Chat 2 C++ API](../../../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_user::local](chat_user_local_function-overloads.md)  
[chat_user](../chat_user.md)  
  