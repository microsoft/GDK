---
title: XGameStreamingShowTouchControlLayout
author: M-Stahl
description: Request that all connected streaming client devices show a specified the touch layout.
ms.author: arikc
ms.date: 04/24/2019
ms.topic: reference
kindex: xcloud, cloud aware, api, streaming
ms.localizationpriority: medium
edited: 00/00/0000
security: public
applies-to: pc-gdk
---

# XGameStreamingShowTouchControlLayout

Request that all connected streaming client devices show a specified the touch layout.

## Syntax

```cpp
void XGameStreamingShowTouchControlLayout(
         const char* layout  
)  
```

## Parameters

*layout* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  
Name of the touch control layout to display or `nullptr` to display the default layout.

The id of the touch control layout which should be displayed on the streaming client device. Layout ids are title-specific, and correspond to the ids of the layouts which are provided to the xCloud service as part of the Touch Adaption Kit. This string is expected to be UTF-8 encoded.

If `nullptr` is provided, the default set of touch controls will be shown.

Any string which does not correspond to a touch control layout id for the title will not change the state of the touch controls on the client device to remain unchanged. The Content Test Application may provide a diagnostic in these cases.

## Return Value

Type: void

## Remarks

This API requests that all current game streaming clients display a specific touch control layout on the player's client device. If the player is not streaming the game, or if they are streaming to a device which does not have touch enabled, this function does nothing.

If the player is using a physical controller instead of using touch controls, this function will not force touch controls to appear on their device. Instead, the client will use the last layout requested the next time that the player starts using touch controls.

You can think of this function as a hint to the client device, which tells it which touch control layout is most appropriate for the current game state if the player is using touch controls. The client device will then manage when it is best to put those controls on the player's screen.

Every call to `XGameStreamingShowTouchControlLayout` results in a message being sent over the network, so it should not be called every frame. Instead, only call this API when your game needs to transition between different touch control layouts.

If no client device is connected when `XGameStreamingShowTouchControlLayout` is called, when a client does connect it will receive the most recently requested touch control layout.

If your game would like to show the touch control layout on **a specific** connected streaming client device, consider using [XGameStreamingShowTouchControlLayoutOnClient](xgamestreamingshowtouchcontrollayoutonclient.md) instead.

## Examples

```C++
void OnGameStateChanged(GameState newState)
{
    // Toggle to the set of touch overlay controls which best match the new state of the game
    switch (newState)
    {
    case GameState::FirstPersonAction:
        XGameStreamingShowTouchControlLayout("FirstPersonAction");
        break;
    case GameState::Driving:
        XGameStreamingShowTouchControlLayout("Driving");
        break;
    case GameState::CutScene:
        // Don't show any touch overlay controls while the cut scene is rendering
        XGameStreamingHideTouchControls();
        break;
    }
}
```

## Requirements
**Header:** xgamestreaming.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  

## See also

[XGameStreamingHideTouchControls](xgamestreaminghidetouchcontrols.md)  
[XGameStreamingShowTouchControlLayoutOnClient](xgamestreamingshowtouchcontrollayoutonclient.md)  
[XGameStreaming](../xgamestreaming_members.md#TouchAdaptation)