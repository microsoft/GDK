---
author: M-Stahl
title: XGameStreamingGetClientCount
description: Get the number of clients which are currently streaming the game.
kindex: XGameStreamingGetClientCount
ms.author: arikc
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameStreamingGetClientCount  

Get the number of clients which are currently streaming the game.     

## Syntax  
  
```cpp
uint32_t XGameStreamingGetClientCount()
```  
  
### Parameters  
  None
  
### Return value
Type: uint32_t
      
## Remarks  

Returns the number of clients which are currently streaming the game. This value may be zero if no clients are currently streaming.

Use this to get the count of connected devices before allocating memory for the call to [XGameStreamingGetClients](xgamestreaminggetclients.md).

If the game is only trying to identify if ANY device is connected and streaming, consider using [XGameStreamingIsStreaming](xgamestreamingisstreaming.md).

If the game wants to get notifcation when a streaming client connects and/or disconnects, consider using [XGameStreamingRegisterConnectionStateChanged](xgamestreamingregisterconnectionstatechanged.md)


## Requirements  
  
**Header:** xgamestreaming.h  
**Library:** xgameruntime.lib  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameStreamingIsStreaming](xgamestreamingisstreaming.md)  
[XGameStreamingRegisterConnectionStateChanged](xgamestreamingregisterconnectionstatechanged.md)  
[XGameStreamingGetClients](xgamestreaminggetclients.md)  
[XGameStreaming](../xgamestreaming_members.md)  