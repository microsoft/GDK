---
author: M-Stahl
title: finish_processing_data_frames
description: Indicates that the app has finished processing data frames, and that Game Chat 2 can release associated resources.
kindex: chat_manager_finish_processing_data_frames
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/10/2020'
security: public
applies-to: pc-gdk
---

# chat_manager::finish_processing_data_frames
  
Indicates that the app has finished processing data frames, and that Game Chat 2 can release associated resources.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void finish_processing_data_frames(  
    game_chat_data_frame_array dataFrames  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
*dataFrames* &nbsp;&nbsp;\_In\_  
Type: [game_chat_data_frame_array](../../../structs/game_chat_data_frame.md#game_chat_data_frame_array)  
  
An array of [game_chat_data_frame](../../../structs/game_chat_data_frame.md) structure pointers that represents the processed data frames.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: void  
  
None.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method indicates that the app has finished processing the data frames queued by Game Chat 2 when the app invoked the [chat_manager::start_processing_data_frames](chat_manager_start_processing_data_frames.md) method, transporting the data frames to their appropriate remote app instances. This method indicates that Game Chat 2 can release the resources associated with the processed data frames. Every call to the `chat_manager::start_processing_data_frames` method must have a corresponding call to this method. For more information about processing data frames, see [Using the Game Chat 2 C++ API](../../../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
## Requirements  
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="syntaxSection"></a>
  
## See also
  
[chat_manager::start_processing_data_frames](chat_manager_start_processing_data_frames.md)  
[chat_manager](../chat_manager.md)  
  