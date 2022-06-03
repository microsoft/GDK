---
author: M-Stahl
title: cleanup
description: Immediately reclaims all resources associated with the chat instance.
kindex: chat_manager_cleanup
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/10/2020'
security: public
applies-to: pc-gdk
---

# chat_manager::cleanup
  
Immediately reclaims all resources associated with the chat instance.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void cleanup(  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
None.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: void  
  
None.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method immediately reclaims all resources associated with this chat instance. Call this method when the app no longer requires communications using Game Chat 2, or when the app is suspended, to release resources allocated to the initialized chat instance. Every call to the [chat_manager::initialize](chat_manager_initialize.md) method must have a corresponding call to this method. For more information about initializing and cleaning up a chat instance, see [Using the Game Chat 2 C++ API](../../../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_manager](../chat_manager.md)  
  