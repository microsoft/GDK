---
author: M-Stahl
title: send_chat_text
description: Generates a chat text string to be sent to all users in the local [chat_manager](../../../chat_manager/chat_manager.md) instance that are configured to receive communication from this user.
kindex: send_chat_text
ms.author: jkepner
ms.topic: reference
ms.date: '09/13/2019'
edited: '09/11/2020'
security: public
applies-to: pc-gdk
---

# chat_user_local::send_chat_text
  
Generates a chat text string to be sent to all users in the local [chat_manager](../../../chat_manager/chat_manager.md) instance that are configured to receive communication from this user.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void send_chat_text(  
    PCWSTR message  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
*message* &nbsp;&nbsp;\_In\_  
Type: PCWSTR  
  
The message string to transmit. This string must contain at least one and no more than `c_maxChatTextMessageLength` characters, not including the null terminator.  
  > [!NOTE]
> `c_maxChatTextMessageLength` is a `constexpr uint16_t` with a value of 1023.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: void  
  
None.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method generates a chat text string to be sent to all users in the local [chat_manager](../../../chat_manager/chat_manager.md) instance that are configured to receive communication from this user. For more information about adding local and remote users to the local `chat_manager` instance for your app, see the [Adding users to Game Chat 2](../../../../../../../chat/overviews/game-chat2/using-game-chat-2.md#adding_users_to_game_chat_2) section in [Using the Game Chat 2 C++ API](../../../../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
When this method is called, an outgoing data packet is generated that contains the text string for target users that are allowed to receive communications from this user, based on privilege, privacy, and relationship configurations.  
  
There is no guaranteed translation, localization, or offensive language filtering of the text content; the outgoing data packet is generated with the text specified in `message`.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_user_local](../chat_user_local.md)  
  