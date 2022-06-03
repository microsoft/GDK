---
author: M-Stahl
title: XGameStreamingGetAssociatedFrame
description: Gets the frame pipeline token from a specific input reading.
kindex: XGameStreamingGetAssociatedFrame
ms.author: arikcohen
ms.topic: reference
edited: 00/00/0000
security: public
applies-to: pc-gdk
---

# XGameStreamingGetAssociatedFrame  

Gets the frame pipeline token from a specific input reading.    

## Syntax  
  
```cpp
HRESULT XGameStreamingGetAssociatedFrame(  
         IGameInputReading* gamepadReading,  
         D3D12XBOX_FRAME_PIPELINE_TOKEN* framePipelineToken  
)  
```  
  
### Parameters  
  
*gamepadReading* &nbsp;&nbsp;\_In\_  
Type: IGameInputReading*  
  
The gamepad reading that is being queried.  
  
*framePipelineToken* &nbsp;&nbsp;\_Out\_  
Type: D3D12XBOX_FRAME_PIPELINE_TOKEN*  
  
The frame pipeline token associated with the frame that was displayed on the client's device when the input was taken by the player.  This pipeline token corresponds to the PresentX call when it was presented by the game and sent to the client device.

  
  
### Return value
Type: HRESULT
  
Returns **S_OK** if successful; otherwise, returns an error code.

#### Potential Errors

| Error Code | Error Value | Reason for Error |
| --- | --- | --- | 
| E_GAMESTREAMING_NOT_INITIALIZED | 0x89245400 | The XGameStreaming runtime has not been initialized. Call XGameStreamingInitialize before calling other APIs. |
| E_GAMESTREAMING_NO_DATA | 0x89245402 | The requested data is not available. The data may be available later.
| E_GAMESTREAMING_NOT_STREAMING_CONTROLLER | 0x89245404 | The current reading didn't come from a streaming controller. |  

  
## Remarks  
  
When a player is streaming a game `XGameStreamingGetAssociatedFrame` can be utilized if the game would like to change game behavior based upon what particular frame was displayed on the players's device when the input was taken.  

This would allow the game to make its simulation decisions based on the frame that the player saw at time of input, not the current one.

`XGameStreamingGetAssociatedFrame` can only provide information for the game about the frame being displayed when a new input reading is created.  In the case where the game would like to determine what was being displayed when an input may not have been done by the player, the game should utilize [XGameStreamingGetLastFrameDisplayed](xgamestreaminggetlastframedisplayed.md).
  

## Example

~~~C++
// In this example, when processing input, the game would like to pass along the frame 
// that was being displayed to the player at the time of input so that their simulation
// engine can take that into account.

// The framePipelineToken was initially captured at the callback of WaitFrameEventX

void Game::Update(DX::StepTimer const& timer)
{
    IGameInputReading* reading;
    if (SUCCEEDED(g_gameInput->GetCurrentReading(GameInputKindGamepad, g_gamepad, &reading)))
    {
        D3D12XBOX_FRAME_PIPELINE_TOKEN framePipelineToken = D3D12XBOX_FRAME_PIPELINE_TOKEN_NULL;        

        if SUCCEEDED(XGameStreamingGetAssociatedFrame(&reading, &framePipelineToken)) 
        {
            SimulateBasedOnInputAndFrameDisplayed(reading, framePipelineToken);
        }
        else 
        {
            // simulate based on current frame
            SimulateBasedOnInput(reading);
        }

        reading->Release();
    }
}

~~~

## Requirements  
  
**Header:** xgamestreaming.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameStreamingGetLastFrameDisplayed](xgamestreaminggetlastframedisplayed.md)  
[XGameStreaming](../xgamestreaming_members.md#Latency)  
[Game Streaming Latency Compensation Overview](../../../../system/overviews/game-streaming/game-streaming-latency-compensation-overview.md)  

  
  