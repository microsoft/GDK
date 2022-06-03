---
author: M-Stahl
title: process_incoming_data
description: Delivers data to Game Chat 2 that was received from a remote instance of Game Chat 2.
kindex: process_incoming_data
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/10/2020'
security: public
applies-to: pc-gdk
---

# chat_manager::process_incoming_data
  
Delivers data to Game Chat 2 that was received from a remote instance of Game Chat 2.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void process_incoming_data(  
    uint64_t sourceEndpointIdentifier,  
    uint32_t bufferByteCount,  
    const void* buffer  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
*sourceEndpointIdentifier* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The identifier associated with an endpoint that was advertised to Game Chat 2 with a previous call to [chat_manager::add_remote_user](chat_manager_add_remote_user.md).  
  
*bufferByteCount* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The size of the data buffer, in bytes.  
  
*buffer* &nbsp;&nbsp;\_In\_reads\_(bufferByteCount)  
Type: void\*  
  
The data buffer.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: void  
  
None.  
  
<a id="remarksSection"></a>
  
## Remarks
  
When the app's transport layer receives data that originated from a remote instance of Game Chat 2, call this method to deliver the data to the local instance of Game Chat 2. Game Chat 2 then decodes the incoming data and renders it to the local user's device. For more information about processing data frames, see [Using the Game Chat 2 C++ API](../../../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[game_chat_data_frame](../../../structs/game_chat_data_frame.md)  
[chat_manager](../chat_manager.md)  
  