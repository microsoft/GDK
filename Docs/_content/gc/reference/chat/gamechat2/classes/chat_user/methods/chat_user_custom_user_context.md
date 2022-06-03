---
author: M-Stahl
title: custom_user_context
description: Retrieves the app's optional, private, custom pointer-sized context value previously associated with this user.
kindex: custom_user_context
ms.author: jkepner
ms.topic: reference
ms.date: '09/13/2019'
edited: '09/11/2020'
security: public
applies-to: pc-gdk
---

# chat_user::custom_user_context
  
Retrieves the app's optional, private, custom pointer-sized context value previously associated with this user.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void* custom_user_context(  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
None.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: void\*
  
The pointer-sized value previously associated with this user; otherwise, a null pointer.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method retrieves the app's private, custom pointer-sized context value previously associated with this [chat_user](../chat_user.md) object. If no custom user context has been set yet for this `chat_user` object, this method returns a null pointer.  
  
The custom user context is typically used as a "shortcut" that simplifies accessing local, app-specific memory associated with the user without requiring a mapping lookup. Use the [chat_user::set_custom_user_context](chat_user_set_custom_user_context.md) method to set the custom user context for a `chat_user` object.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_user](../chat_user.md)  
  