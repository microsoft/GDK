---
author: M-Stahl
title: singleton_instance
description: Retrieves a reference to the Game Chat 2 singleton instance.
kindex: singleton_instance
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/10/2020'
security: public
applies-to: pc-gdk
---

# chat_manager::singleton_instance
  
Retrieves a reference to the Game Chat 2 singleton instance.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
chat_manager& singleton_instance(  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
None.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: [chat_manager](../chat_manager.md)&
  
A reference to the Game Chat 2 singleton instance.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method returns a reference to the Game Chat 2 singleton instance, with which you can include Game Chat 2 functionality in your game. The [chat_manager](../chat_manager.md) instance can be used to add voice and text communications to your app, allowing your app to manage local and remote game users, process data from both local and remote Game Chat 2 instances, and process state changes such as text message receipts and chat transcriptions. For more information about using the Game Chat 2 singleton instance, see [Using the Game Chat 2 C++ API](../../../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
<a id="requirementsSection"></a>
  
## Requirements  
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_manager](../chat_manager.md)  
  