---
author: M-Stahl
title: start_processing_stream_state_changes
description: Retrieves an array of all Game Chat 2 audio stream state changes that occurred since the last call to this method.
kindex: start_processing_stream_state_changes
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/11/2020'
security: public
applies-to: pc-gdk
---

# chat_manager::start_processing_stream_state_changes
  
Retrieves an array of all Game Chat 2 audio stream state changes that occurred since the last call to this method.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void start_processing_stream_state_changes(  
    uint32_t* streamStateChangeCount,  
    game_chat_stream_state_change_array* streamStateChanges  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
*streamStateChangeCount* &nbsp;&nbsp;\_Out\_  
Type: uint32_t\*  
  
The total number of state changes in *streamStateChanges*.  
  
*streamStateChanges* &nbsp;&nbsp;\_Outptr\_result\_buffer\_(\*streamStateChangeCount)  
Type: [game_chat_stream_state_change_array](../../../structs/game_chat_stream_state_change.md#array)\*  
  
An array of [game_chat_stream_state_change](../../../structs/game_chat_stream_state_change.md) structure pointers that represents the stream state changes to be processed by the app.
  
<a id="retvalSection"></a>
  
### Return value
  
Type: void  
  
None.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method retrieves all state changes queued by Game Chat 2 for audio streams, to be processed by the app. Calling this method retrieves information about how audio streams have been updated as an array of `game_chat_stream_state_change` structure pointers. The app iterates over the array and processes each stream state change as needed.  
  > [!NOTE]
> This method should not be called on your UI thread. Calling this method requires coordination with your audio thread.  
  
After all stream state changes included in `streamStateChanges` have been processed, the app then calls [chat_manager::finish_processing_stream_state_changes](chat_manager_finish_processing_stream_state_changes.md), passing the processed stream state changes back to Game Chat 2, to indicate that the resources associated with the processed stream state changes can be released.  
  > [!NOTE]
> If you call this method, you must call `chat_manager::finish_processing_stream_state_changes` after you have finished processing stream state changes. If you call this method again without first calling `chat_manager::finish_processing_stream_state_changes`, an error occurs.  
  
For more information about processing stream state changes, see [Using the Game Chat 2 C++ API](../../../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_manager](../chat_manager.md)  
  