---
title: XGameStreamingHideTouchControls
author: M-Stahl
description: Request that all connected streaming client devices hide the touch layout if they are visible.
ms.author: arikc
ms.date: 04/24/2019
ms.topic: reference
kindex: xcloud, cloud aware, api, hide touch controls
ms.localizationpriority: medium
edited: 00/00/0000
security: public
applies-to: pc-gdk
quality: good
---

# XGameStreamingHideTouchControls

Request that all connected streaming client devices hide the touch layout if they are visible.

## Syntax

```cpp
void XGameStreamingHideTouchControls();
```

### Return value
Type: void

## Remarks

This API requests that all connected game streaming clients remove any displayed touch overlay controls. If the player is not streaming the game, or if they are streaming to a device which is not showing touch overlay controls, this function does nothing.

To display a specific touch control layout, call [XGameStreamingShowTouchControlLayout](xgamestreamingshowtouchcontrollayout.md).

Every call to `XGameStreamingHideTouchControls` results in a message being sent over the network, so it should not be called every frame. Instead, only call this API when your game needs to transition out of having touch controls displayed on screen.

If your game would like to hide the touch control layout on **a specific** connected streaming client device, consider using [XGameStreamingHideTouchControlsOnClient](xgamestreaminghidetouchcontrolsonclient.md) instead.


## Examples

```cpp
void OnShowMenu()
{
    // This game has native touch support for the menu system, so hide touch overlay controls
    XGameStreamingHideTouchControls();
}

void OnDismissMenu()
{
    // Show the touch overlay controls which were previously on the screen before we hid them
    // due to bringing up the menu.
    XGameStreamingShowTouchControlLayout(m_currentTouchLayout);
}
```

## Requirements

**Header:** xgamestreaming.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  

## See also
[XGameStreamingShowTouchControlLayout](xgamestreamingshowtouchcontrollayout.md)  
[XGameStreamingHideTouchControlsOnClient](xgamestreaminghidetouchcontrolsonclient.md)  
[XGameStreaming](../xgamestreaming_members.md#TouchAdaptation)  