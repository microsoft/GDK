---
author: M-Stahl
title: XGameStreamingHideTouchControlsOnClient
description: Request that a specified streaming client devices hide the touch layout if they are visible.
kindex: XGameStreamingHideTouchControlsOnClient
ms.author: arikc
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameStreamingHideTouchControlsOnClient  

Request that a specified streaming client devices hide the touch layout if they are visible.
   

## Syntax  
  
```cpp
void XGameStreamingHideTouchControlsOnClient(  
         XGameStreamingClientId client  
)  
```  
  
### Parameters  
  
*client* &nbsp;&nbsp;\_In\_  
Type: XGameStreamingClientId  
  
The streaming client device to hide touch controls on.
  
  
### Return value
Type: void
  

## Remarks

This API requests the specified game streaming client to remove any displayed touch overlay controls. If the player is not streaming the game, or if they are streaming to a device which is not showing touch overlay controls, this function does nothing.

To display a specified touch control layout, call [XGameStreamingShowTouchControlLayoutOnClient](xgamestreamingshowtouchcontrollayoutonclient.md).

Every call to `XGameStreamingHideTouchControlsOnClient` results in a message being sent over the network, so it should not be called every frame. Instead, only call this API when your game needs to transition out of having touch controls displayed on screen.

If your game would like to hide the touch control layout on **all** connected streaming client devices, consider using [XGameStreamingHideTouchControls](xgamestreaminghidetouchcontrols.md) instead.


## Examples

```C++
void OnShowMenu(XGameStreamingClientId client)
{
    // This game has native touch support for the menu system, so hide touch overlay controls
    XGameStreamingHideTouchControlsOnClient(client);
}

void OnDismissMenu(XGameStreamingClientId client)
{
    // Show the touch overlay controls which were previously on the screen before we hid them
    // due to bringing up the menu.
    XGameStreamingShowTouchControlsOnClient(client);
}
```

## Requirements

**Header:** xgamestreaming.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameStreamingShowTouchControlLayoutOnClient](xgamestreamingshowtouchcontrollayoutonclient.md)  
[XGameStreamingHideTouchControls](xgamestreaminghidetouchcontrols.md)  
[XGameStreaming](../xgamestreaming_members.md#TouchAdaptation)  