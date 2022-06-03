---
author: M-Stahl
title: game_chat_data_transport_requirement
description: Defines the data transport requirements for outgoing data.
kindex: game_chat_data_transport_requirement
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/16/2020'
security: public
applies-to: pc-gdk
---

# game_chat_data_transport_requirement
  
Defines the data transport requirements for outgoing data.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
enum class game_chat_data_transport_requirement  
{  
    guaranteed,  
    best_effort,  
}  
```  
  
<a id="constantsSection"></a>
  
## Constants
  
| Constant | Description |  
| --- | --- |  
| guaranteed | The data must be transmitted with guaranteed delivery.<br/><br/> The data delivery must be guaranteed, regardless of environmental packet loss, unless the target recipient has been removed from the app's network before delivery completion. Sequentialness is not required. |  
| best_effort | The data should be transmitted with best effort delivery.<br/><br/> The data delivery should be sent with best possible effort; however, environmental packet loss is acceptable. Sequentialness is not required. |  
  
<a id="remarksSection"></a>
  
## Remarks
  
This enumeration describes the data transport requirement for an outgoing data frame in Game Chat 2. You can specify or retrieve the data transport requirement for a data frame from the `transport_requirement` member of the corresponding [game_chat_data_frame](../structs/game_chat_data_frame.md) structure.  
  
For more information about processing data frames, see the [Processing data frames](../../../../chat/overviews/game-chat2/using-game-chat-2.md#processing_data_frames) section in [Using the Game Chat 2 C++ API](../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[GameChat2 members](../gamechat2_members.md)  
  