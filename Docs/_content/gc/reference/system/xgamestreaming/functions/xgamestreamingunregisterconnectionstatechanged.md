---
author: M-Stahl
title: XGameStreamingUnregisterConnectionStateChanged
description: Unregisters a previously registered XGameStreamingConnectionStateChangedCallback.
kindex: XGameStreamingUnregisterConnectionStateChanged
ms.author: arikc
ms.topic: reference
edited: 02/10/2020
security: public
applies-to: pc-gdk
quality: good
---

# XGameStreamingUnregisterConnectionStateChanged  

Unregisters a previously registered [XGameStreamingConnectionStateChangedCallback](xgamestreamingconnectionstatechangedcallback.md). 


## Syntax  
  
```cpp
bool XGameStreamingUnregisterConnectionStateChanged(  
         XTaskQueueRegistrationToken token,  
         bool wait  
)  
```  
  
### Parameters  
  
*token* &nbsp;&nbsp;\_In\_  
Type: XTaskQueueRegistrationToken  
  
Token that corresponded to the callback registration done via [XGameStreamingRegisterConnectionStateChanged](xgamestreamingregisterconnectionstatechanged.md).
  
*wait* &nbsp;&nbsp;  
Type: bool  
  
TBD    
### Return value
Type: bool

TBD  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
This API can be used to stop listening to streaming client device's connection changes.  

This should be done when the game is either going to only a broad check of whether any clients are streaming by utilizing [XGameStreamingIsStreaming](xgamestreamingisstreaming.md) or is no longer going to do any optimizing of the experience due to streaming clients.
  
## Requirements  
  
**Header:** xgamestreaming.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameStreamingConnectionStateChangedCallback](xgamestreamingconnectionstatechangedcallback.md)  
[XGameStreamingRegisterConnectionStateChanged](xgamestreamingregisterconnectionstatechanged.md)  
[XGameStreaming](../xgamestreaming_members.md)  