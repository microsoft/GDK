---
author: M-Stahl
title: XGameStreamingGetStreamAddedLatency
description: Gets the recent average of the streaming related latency.
kindex: XGameStreamingGetStreamAddedLatency
ms.author: arikc
ms.topic: reference
edited: 02/10/2020
security: public
applies-to: pc-gdk
---

# XGameStreamingGetStreamAddedLatency  


Gets the recent average of the streaming related latency.    

## Syntax  
  
```cpp
HRESULT XGameStreamingGetStreamAddedLatency(  
         XGameStreamingClientId client,  
         uint32_t* averageInputLatencyUs,  
         uint32_t* averageOutputLatencyUs,  
         uint32_t* standardDeviationUs  
)  
```  
  
### Parameters  
  
*client* &nbsp;&nbsp;\_In\_  
Type: XGameStreamingClientId  
  
The streaming client device that latency is being queried for.
  
*averageInputLatencyUs* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
  
The average latency, in microseconds, over a recent period of time for input to be received by the Xbox game.
  
*averageOutputLatencyUs* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
  
The average latency, in microseconds, over a recent period of time for a game frame to be rendered on the client device.
  
*standardDeviationUs* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
  
Observed average of the measured standard deviation of jitter, in microseconds, over a recent period of time of the in the latency.
  
  
### Return value
Type: HRESULT
  
Returns **S_OK** if successful; otherwise, returns an error code.

#### Potential Errors

| Error Code | Error Value | Reason for Error |
| --- | --- | --- | 
| E_GAMESTREAMING_NOT_INITIALIZED | 0x89245400 | The XGameStreaming runtime has not been initialized. Call XGameStreamingInitialize before calling other APIs.
| E_GAMESTREAMING_NO_DATA | 0x89245402 | The requested data is not available. The data may be available later.

For a list of error codes, see [Error Codes](../../../errorcodes.md).    

## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
`XGameStreamingGetStreamAddedLatency` provides data around the measured latency due to the streaming of the game.  This can be utilized by games to better understand the experience that the player is having with the streamed experience.

It is important to note that this does **not** provide the full end to end latency that a player may notice (e.g., it does **not** map directly to from a button press on a controller attached to the streaming client device until a new frame is rendered that takes that into account.)  For example, the following components are **not** included in these measurements:  
 - Game engine render time
 - Time from when passed to render on the client device to when the player sees the image
 - Bluetooth transport and decode time from the controller on the client device 

Instead, the input latency includes:
 - The time it takes for the game streaming application to process inputs received from a controller.
 - Transmission time from the game streaming application over the network to the server which is running the game.

Output latency includes:
 - Encoding time for each frame that is rendered by the title.
 - Time to transmit this frame across the network to the application the player is interacting with.
 - Decoding time in the application, as it prepares to present the frame to the player.

`XGameStreamingGetStreamAddedLatency` is an average measurement which is updated every few seconds.  For more precise measurements, the [XGameStreamingGetAssociatedFrame](xgamestreaminggetassociatedframe.md) API may be used. See [Game streaming latency compensation deep dive](../../../../system/overviews/game-streaming/game-streaming-latency-compensation-deep-dive.md) for more information.

## Requirements  
  
**Header:** xgamestreaming.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameStreaming](../xgamestreaming_members.md)  
[Game Streaming Latency Compensation Overview](../../../../system/overviews/game-streaming/game-streaming-latency-compensation-overview.md)  