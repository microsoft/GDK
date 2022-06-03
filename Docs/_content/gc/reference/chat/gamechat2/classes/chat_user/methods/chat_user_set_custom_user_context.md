---
author: M-Stahl
title: set_custom_user_context
description: Sets the app's optional, private, custom pointer-sized context value for this user.
kindex: set_custom_user_context
ms.author: jkepner
ms.topic: reference
ms.date: '09/13/2019'
edited: '09/11/2020'
security: public
applies-to: pc-gdk
---

# chat_user::set_custom_user_context
  
Sets the app's optional, private, custom pointer-sized context value for this user.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void set_custom_user_context(  
    void* customUserContext  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
*customUserContext* &nbsp;&nbsp;\_In\_opt\_  
Type: void\*  
  
An arbitrary, pointer-sized value to store for the `chat_user` object.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: void  
  
None.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method sets the app's optional, private, custom pointer-sized context value for this [chat_user](../chat_user.md) object. The custom user context is typically used as a "shortcut" that simplifies accessing local, app-specific memory associated with the user without requiring a mapping lookup. Use the [chat_user::custom_user_context](chat_user_custom_user_context.md) method to retrieve the custom user context for a `chat_user` object.  
  
The custom user context is treated as opaque by the Game Chat 2 library, and is only valid on the local device; it is not transmitted over the network.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_user](../chat_user.md)  
  