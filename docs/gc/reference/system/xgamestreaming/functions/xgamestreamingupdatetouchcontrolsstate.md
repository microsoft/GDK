---
author: M-Stahl
title: XGameStreamingUpdateTouchControlsState
description: Update state on all streaming clients that touch layouts can use to alter their behavior.
kindex: XGameStreamingUpdateTouchControlsState
ms.author: arikcohen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XGameStreamingUpdateTouchControlsState

Update state on all streaming clients that touch layouts can use to alter their behavior.  Any visual changes to the currently being displayed touch control set will be done after ALL the variables are updated.


## Syntax  
  
```cpp
HRESULT XGameStreamingUpdateTouchControlsState(  
         size_t operationCount,  
         const XGameStreamingTouchControlsStateOperation* operations  
)  
```  
  
### Parameters  
  
*operationCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Size of the array of operations being passed    

  
*operations* &nbsp;&nbsp;\_In\_reads\_opt\_(operationCount)  
Type: [XGameStreamingTouchControlsStateOperation*](../structs/xgamestreamingtouchcontrolsstateoperation.md)  
  
Array of all the state variable updates that are being requested    
  
  
### Return value
Type: HRESULT
  
Returns **S_OK** if successful; otherwise, returns an error code.

#### Potential Errors

| Error Code | Error Value | Reason for Error |
| --- | --- | --- | 
| E_GAMESTREAMING_NOT_INITIALIZED | 0x89245400 | The XGameStreaming runtime has not been initialized. Call XGameStreamingInitialize before calling other APIs. |
| E_INVALIDARG | 0x80070057  | if a specified operation does not have data that matches the data type specified in the operations XGameStreamingTouchControlsStateValueKind |       
  
## Remarks  
  
Touch layouts used by streaming clients can depend on state, whose initial values are embedded into the touch layout bundle.  The game can update the state, which can cause the layout that is currently being displayed to the player to change.  

The game can use `XGameStreamingUpdateTouchControlsState` to update the state for all connected clients or [XGameStreamingUpdateTouchControlsStateOnClient](xgamestreamingupdatetouchcontrolsstateonclient.md) to update a specific connected client.

If the game would like to update the state AND make a layout change at the same time, it can utilize [XGameStreamingShowTouchControlsWithStateUpdate](xgamestreamingshowtouchcontrolswithstateupdate.md) or [XGameStreamingShowTouchControlsWithStateUpdateOnClient](xgamestreamingshowtouchcontrolswithstateupdateonclient.md).
  
## Examples

```C++
// In this example, after the player has switched their active weapon – update the image of the fire
// button to match the current weapon and set the enabled state of reload based on whether the player has
// extra magazines.  
// 
// Assumes passing in game structure that includes the active weapon with appropriate state.  
//
// Assumes a game speciic GetImageName function which returns a constant string for the specified weapoon


void GameStreamingClientManager::UpdateStateAfterWeaponChange(const playerWeapon& playerWeapon)
{
    // create an update for the active weapon's image
    XGameStreamingTouchControlsStateOperation weaponImage;
    weaponImage.path = "/ActiveWeaponImage";
    weaponImage.value.valueKind = XGameStreamingTouchControlsStateValueKind::String;
    weaponImage.value.stringValue = GetImageName(playerWeapon.activeWeapon.id);

    // create an update for whether the reload button should be enabled
    XGameStreamingTouchControlsStateOperation reloadEnabled;
    weaponImage.path = "/ReloadEnabled";
    weaponImage.valueKind = XGameStreamingTouchControlsStateValueKind::Bool;
    weaponImage.booleanValue = playerWeapon.activeWeapon.reloadClips > 0;

    // combine all the updates into the update state call and make the call
    XGameStreamingTouchControlsStateOperation[2] updateOperations = {weaponImage, reloadEnabled};
    
    XGameStreamingUpdateTouchControlsState(updateOperations, _countof(updateOperations));
}
```

```c++
// In this example, after the player has gone to their inventory screen and had the ability to apply items
// to two active slots. Update the state for layouts to have layouts match the player’s current
// loaded items from inventory (may or may not be the current layout being displayed).
// 
// Assumes passing in game structure that includes the player's active inventory


void GameStreamingClientManager::AfterInventoryScreen(const PlayerInventory& playerInventory)
{
    std::vector<XGameStreamingTouchControlsStateOperation> updateOperations;
    
    // check the first inventory slots, if empty hide that button from the layout
    // if item is placed in that slot, update the image to match the inventory items
    
    XGameStreamingTouchControlsStateOperation slot1Visible;
    slot1Visible.path = "/Slot1IsVisible";
    slot1Visible.valueKind = XGameStreamingTouchControlsStateValueKind::Boolean;
    slot1Visible.boolValue =  playerInventory.slot1 != nullptr;
    
    updateOperations.push_back(slot1Visible);

    if (playerInventory.slot1 != nullptr) 
    {
        // create an update for the active weapon's image
        XGameStreamingTouchControlsStateOperation slot1Image;
        slot1Image.path = "/Slot1Image";
        slot1Image.value.valueKind = XGameStreamingTouchControlsStateValueKind::String;
        slot1Image.value.stringValue = GetImageName(playerInventory.slot1.id);        
        updateOperations.pushBack(slot1Image);
    }
    

    // ... 
    // do the same for the second inventory spot
    // ...

    // Update the state so that layouts will be updated correctly
    XGameStreamingUpdateTouchControlsState(updateOperations.data(), updateOperations.size());
}

```


## Requirements  
  
**Header:** XGameStreaming.h
  
**Library:** ****.lib
**Supported Platforms**: Windows, Xbox One family consoles and Xbox Series consoles

## See also  
[XGameStreaming](../xgamestreaming_members.md#TouchAdaptation)  
[XGameStreamingTouchControlsStateOperationKind](../enums/xgamestreamingtouchcontrolsstateoperationkind.md)  
[XGameStreamingTouchControlsStateOperation](../structs/xgamestreamingtouchcontrolsstateoperation.md)  
[XGameStreamingTouchControlsStateValue](../structs/xgamestreamingtouchcontrolsstatevalue.md)  
[XGameStreamingShowTouchControlsWithStateUpdate](xgamestreamingshowtouchcontrolswithstateupdate.md)  
[XGameStreamingShowTouchControlsWithStateUpdateOnClient](xgamestreamingshowtouchcontrolswithstateupdateonclient.md)  
[XGameStreamingUpdateTouchControlsStateOnClient](xgamestreamingupdatetouchcontrolsstateonclient.md)  

  