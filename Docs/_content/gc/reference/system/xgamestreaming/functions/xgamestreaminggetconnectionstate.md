---
author: M-Stahl
title: XGameStreamingGetConnectionState
description: Gets the current connection state for specified device.
kindex: XGameStreamingHideTouchControlsOnClient
ms.author: arikc
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameStreamingGetConnectionState  

Gets the current connection state for specified device.
   

## Syntax  
  
```cpp
XGameStreamingConnectionState XGameStreamingGetConnectionState(  
         XGameStreamingClientId client  
)  
```  
  
### Parameters  
  
*client* &nbsp;&nbsp;\_In\_  
Type: XGameStreamingClientId  
  
The client to request the connection state of.
  
  
### Return value

Type: [XGameStreamingConnectionState](../enums/xgamestreamingconnectionstate.md)  
  

## Remarks

This API returns the [XGameStreamingConnectionState](../enums/xgamestreamingconnectionstate.md) of the specified client.   This allows for a check to see if the device has disconnected since the game last checked.

If the game is only trying to identify if ANY device is connected and streaming, consider using [XGameStreamingIsStreaming](xgamestreamingisstreaming.md).

If the game wants to get notification when a streaming client connects and/or disconnects, consider using [XGameStreamingRegisterConnectionStateChanged](xgamestreamingregisterconnectionstatechanged.md)


## Requirements

**Header:** xgamestreaming.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameStreamingIsStreaming](xgamestreamingisstreaming.md)  
[XGameStreamingRegisterConnectionStateChanged](xgamestreamingregisterconnectionstatechanged.md)  
[XGameStreamingGetClientCount](xgamestreaminggetclientcount.md)  
[XGameStreamingGetClients](xgamestreaminggetclients.md)  
[XGameStreaming](../xgamestreaming_members.md)  