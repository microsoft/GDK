---
author: M-Stahl
title: XGameStreamingGetLastFrameDisplayed
description: Gets the frame pipeline token for the frame that was most recently displayed on the streaming client's screen.
kindex: XGameStreamingGetLastFrameDisplayed
ms.author: arikc
ms.topic: reference
edited: 00/00/0000
security: public
applies-to: pc-gdk
---

# XGameStreamingGetLastFrameDisplayed  

Gets the frame pipeline token for the frame that was most recently displayed on the streaming client's screen.    

## Syntax  
  
```cpp
HRESULT XGameStreamingGetLastFrameDisplayed(  
         XGameStreamingClientId client,  
         D3D12XBOX_FRAME_PIPELINE_TOKEN* framePipelineToken  
)  
```  
  
### Parameters  
  
*client* &nbsp;&nbsp;\_In\_  
Type: XGameStreamingClientId  
  
The streaming client device is being queried for.
  
*framePipelineToken* &nbsp;&nbsp;\_Out\_  
Type: D3D12XBOX_FRAME_PIPELINE_TOKEN*  
  
The frame pipeline token that was last displayed on the client device. 
  
  
### Return value
Type: HRESULT
  
Returns **S_OK** if successful; otherwise, returns an error code.

#### Potential Errors

| Error Code | Error Value | Reason for Error |
| --- | --- | --- | 
| E_GAMESTREAMING_NOT_INITIALIZED | 0x89245400 | The XGameStreaming runtime has not been initialized. Call XGameStreamingInitialize before calling other APIs. |
| E_GAMESTREAMING_CLIENT_NOT_CONNECTED | 0x89245401 | The specified client is not connected. |
| E_GAMESTREAMING_NO_DATA | 0x89245402 | The requested data is not available. The data may be available later. |


  
## Remarks  
  
When a player is streaming a game `XGameStreamingGetLastFrameDisplayed` can be utilized if the game would like to change game behavior upon confirmation that a particular frame was displayed on the user's screen.  


Some examples of when a game may utilize this include:
* A visual timer has expired and the player took no action before the expiration.
* An action was not taken within the appropriate window.
* A player continued their motion out of bounds and did not take action to recover.

`XGameStreamingGetLastFrameDisplayed` should be used when trying to determine when an action should have been taken, but wasn't.  In the case where the game would like to determine what was being displayed when an input **was** done by the player, the game should utilize [XGameStreamingGetAssociatedFrame](xgamestreaminggetassociatedframe.md).
  
## Example

```C++
// In this example, when processing input, the game would like to pass along the last frame 
// that was being displayed to the player so that their simulation engine can take that into account.
 

// The framePipelineToken was initially captured at the callback of WaitFrameEventX

void Game::Update(DX::StepTimer const& timer)
{
    ...

    D3D12XBOX_FRAME_PIPELINE_TOKEN framePipelineToken = D3D12XBOX_FRAME_PIPELINE_TOKEN_NULL;
    if SUCCEEDED(XGameStreamingGetLastFrameDisplayed(clientId, &framePipelineToken)
    {
        SimulateBasedOnLastFrameDisplayed(framePipelineToken);
    }
    else 
    {
        // don't have last token, potentially simulate based on current frame

        SimulateBasedOnCurrentFrame();
    }

    
      
    ...
}

```

## Requirements  
  
**Header:** xgamestreaming.h  
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  

## See also
[XGameStreamingGetAssociatedFrame](xgamestreaminggetassociatedframe.md)  
[XGameStreaming](../xgamestreaming_members.md#Latency)  
[Game Streaming Latency Compensation Overview](../../../../system/overviews/game-streaming/game-streaming-latency-compensation-overview.md)  

  
  