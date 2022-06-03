---
title: Changing Touch Control Layouts Based On Game State
description: Changing a layout based on game state.
kindex: Changing a layout based on game state
author: arikcohen
ms.author: arikc
ms.prod: gaming
ms.date: 1/14/2021
ms.topic: conceptual
security: public
---

# Changing Touch Control Layouts Based On Game State

Games have the ability to change the touch layout that is being displayed to the player or modify state that a currently displayed layout is using. Both methods can be used together to create the most natural experience for players.

**[Changing layouts](#change_layout)**

Changing layouts should be used when:

- Transitioning between different control schemes (e.g., driving a vehicle and first person shooter)
- Hiding the touch layout temporarily (to have a full touch experience, enable a cinematic experience, etc)

**[Changing state](#change_state)**

Changing the game state that is included in the context portion of the touch adaptation bundle should be used when:

- Modifying the images/iconography of controls based on the player's current game state. Some examples include:
  - Change the image on the fire button based on what weapon the player has selected.
  - Change the images of the abilities based on what items the player currently has in their inventory.
- Modifying the visual state (visiblity and enabled) of controls based on the player's current game state. Some examples include:
  - Disable the reload button when the player has no additional ammunition.
  - Make the interact button visible when the player approach an item they can interact with (and invisible when they move away).

<a id="change_layout"></a>

## Changing Layouts at Runtime

**Showing a specified layout**
The game should use the [`XGameStreamingShowTouchControlLayout`](../../../../reference/system/xgamestreaming/functions/xgamestreamingshowtouchcontrollayout.md) API to show a new layout.

**Hiding the current layout**
The game should use the [`XGameStreamingHideTouchControls`](../../../../reference/system/xgamestreaming/functions/xgamestreaminghidetouchcontrols.md) API to hide the currently being displayed layout.

Example of how a game can set the layout based on the current state of the game:

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

<a id="change_state"></a>

## Changing State At Runtime

Initial state at the launch of the game is defined by the [default state](../game-streaming-touch-touch-adaptation-bundle.md#context) that was included in the touch adapation bundle. In the touch control layout, the control should reference the state for the property that may be changed at runtime.

The game can utilize the `XGameStreamingUpdateTouchControlsState` API to update the state during runtime.

For example, the following would be used to have a "reload" control that starts disabled, but gets enabled when they should have that capability.

```JSON
//Example context file
{
  "$schema": "https://raw.githubusercontent.com/microsoft/xbox-game-streaming-tools/master/touch-adaptation-kit/schemas/context/v3.0/context.json",

  "state": {
    "enableReload": false
  }
}

//Example control in the layout:
{
    "type": "button",
    "action": "leftBumper",
    "enabled": {
        "$ref": "../../context.json#/state/enableReload"
    }
    ...
}
```

The game would make the API calls to update the state:

```C++

// In this example, after the player has switched their active weapon – the game updates the
// enabled state of reload based on whether the player has extra magazines.
//
// Assumes passing in game structure that includes the active weapon with appropriate state.
//

void GameStreamingClientManager::UpdateStateAfterItemsChange(const playerWeapon& playerWeapon)
{
    // create an update for whether the reload button should be enabled
    XGameStreamingTouchControlsStateOperation reloadEnabled;
    weaponImage.path = "/enableReload";
    weaponImage.valueKind = XGameStreamingTouchControlsStateValueKind::Bool;
    weaponImage.booleanValue = playerWeapon.activeWeapon.reloadClips > 0;

    // combine all the updates into the update state call and make the call
    XGameStreamingTouchControlsStateOperation[1] updateOperations = {reloadEnabled};

    XGameStreamingUpdateTouchControlsState(updateOperations, _countof(updateOperations));
}
```
