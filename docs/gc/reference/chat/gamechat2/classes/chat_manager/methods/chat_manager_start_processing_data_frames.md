---
author: M-Stahl
title: start_processing_data_frames
description: Retrieves all data frames queued by Game Chat 2 to be delivered by the app's transport layer to the appropriate remote app instances.
kindex: start_processing_data_frames
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/11/2020'
security: public
applies-to: pc-gdk
---

# chat_manager::start_processing_data_frames
  
Retrieves all data frames queued by Game Chat 2 to be delivered by the app's transport layer to the appropriate remote app instances.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void start_processing_data_frames(  
    uint32_t* dataFrameCount,  
    game_chat_data_frame_array* dataFrames  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
*dataFrameCount* &nbsp;&nbsp;\_Out\_  
Type: uint32_t\*  
  
The total number of queued data frames in *dataFrames*.  
  
*dataFrames* &nbsp;&nbsp;\_Outptr\_result\_buffer\_(\*dataFrameCount)  
Type: [game_chat_data_frame_array](../../../structs/game_chat_data_frame.md#array)\*  
  
An array of [game_chat_data_frame](../../../structs/game_chat_data_frame.md) structure pointers that represents the queued data frames to be delivered by the app's transport layer to the appropriate remote app instances.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: void  
  
None.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method retrieves all data frames queued by Game Chat 2, to be processed by the app. Game Chat 2 doesn't have its own transport layer, so the app must provide one. Calling this method retrieves data frames that need to be processed by the app's transport layer as an array of `game_chat_data_frame` structure pointers. The app iterates over the array, inspects the endpoint identifiers for the data frame, and uses the app's networking layer to deliver the data for that data frame to the appropriate remote app instances.  
  
After all data frames included in `dataFrames` have been processed, the app then calls [chat_manager::finish_processing_data_frames](chat_manager_finish_processing_data_frames.md), passing the processed data frames back to Game Chat 2, to indicate that the resources associated with the processed data frames can be released. For more information about processing data frames, see [Using the Game Chat 2 C++ API](../../../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
Calling this method less frequently introduces audio latency, but allows Game Chat 2 to coalesce data into large data frames. Calling this more frequently reduces audio latency, but results in more, smaller data frames. The audio is coalesced into 40-millisecond (ms) data frames; this is the suggested polling period.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_manager](../chat_manager.md)  
  