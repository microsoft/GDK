---
title: XGameStreamingIsStreaming
author: M-Stahl
description: Determine if the game is currently being.
ms.author: arikc
ms.date: 04/24/2019
ms.topic: reference
kindex: xcloud, cloud aware, api, streaming
ms.localizationpriority: medium
edited: 00/00/0000
security: public
applies-to: pc-gdk
quality: good
---

# XGameStreamingIsStreaming

Determine if the game is currently being streamed.

## Syntax

```cpp
bool XGameStreamingIsStreaming();
```

### Return value

Type: bool

`XGameStreamingIsStreaming` returns true if the game is running on an Xbox that has at least one streaming client device connected. 


## Remarks

`XGameStreamingIsStreaming` does not differentiate if the console is streaming via Console Streaming or via Project xCloud.

To be notified of individual streaming client devices connecting and/or disconnecting consider registering a callback via [XGameStreamingRegisterConnectionStateChanged](xgamestreamingregisterconnectionstatechanged.md)  

## Examples

```C++
 if (XGameStreamingIsStreaming())
 {
     // The game is currently streaming to at least one device
     // Enable any customizations that might be useful when running from the cloud
 }
```

## Requirements

**Header:** xgamestreaming.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  

## See also
[XGameStreamingConnectionState](../enums/xgamestreamingconnectionstate.md)  
[XGameStreamingUnregisterConnectionStateChanged](xgamestreamingunregisterconnectionstatechanged.md)  
[XGameStreamingRegisterConnectionStateChanged](xgamestreamingregisterconnectionstatechanged.md)  
[XGameStreaming](../xgamestreaming_members.md#ConnectionState)  