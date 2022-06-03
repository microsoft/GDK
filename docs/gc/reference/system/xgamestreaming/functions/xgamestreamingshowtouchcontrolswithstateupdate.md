---
author: M-Stahl
title: XGameStreamingShowTouchControlsWithStateUpdate
description: Request that all connected streaming client devices update their touch control state and then show a specified touch layout.
kindex: XGameStreamingShowTouchControlsWithStateUpdate
ms.author: arikcohen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XGameStreamingShowTouchControlsWithStateUpdate  

Request that all connected streaming client devices update their touch control state and show a specified touch layout.  All state updates happen before the new touch layout is displayed.

## Syntax  
  
```cpp
HRESULT XGameStreamingShowTouchControlsWithStateUpdate(  
         const char* layout,  
         size_t operationCount,  
         const XGameStreamingTouchControlsStateOperation* operations  
)  
```  
  
### Parameters  
  
*layout* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  
  
Name of the touch control layout to display or `nullptr` to display the standard layout.
  
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

This API should be utilized when the game would like to show a particular touch layout that also requires some state updates that may affect its rendering. Use this API if you would like to both update the state of variables that are referenced in a new touch layout AND switch to the touch layout on all connected streaming client devices. This API makes sure that all state updates are made before the new layout is displayed.

If you would like to only affect a specific client utilize [XGameStreamingShowTouchControlsWithStateUpdateOnClient](xgamestreamingshowtouchcontrolswithstateupdateonclient.md).


If the game would only like to change the layout, the game should utilize [XGameStreamingShowTouchControlLayout](xgamestreamingshowtouchcontrollayout.md) instead.

If the state updates can affect the current layout or other layouts and upadtes should happen regardless of a specific touch layout change, the game should utilize [XGameStreamingUpdateTouchControlsState](xgamestreamingupdatetouchcontrolsstate.md) instead.


## Examples

```c++
// In this example, the player has just selected a specific building in an strategy game 
// and the game wants to populate the two building specific action slots with the appropriate imagery
// before selecting the layouts
//
// Assumes passing in game structure that refers to the selected building and a game function to get the image
// assets for a particular building capability.


void GameStreamingClientManager::UpdateBuildingStateAndControls(const BuildingProperties& building)
{
    
    

    std::vector<XGameStreamingTouchControlsStateOperation> updateOperations;
    
    // update the image for the first two building slots   
    XGameStreamingTouchControlsStateOperation buildingCapability1Image;
    buildingCapability1Image.path = "/buildingCapability1Image";
    buildingCapability1Image.valueKind = XGameStreamingTouchControlsStateValueKind::String;
    buildingCapability1Image.stringValue =  GetImageName(building.capability[0].id);        
    updateOperations.push_back(buildingCapability1Image);

    XGameStreamingTouchControlsStateOperation buildingCapability2Image;
    buildingCapability2Image.path = "/buildingCapability2Image";
    buildingCapability2Image.valueKind = XGameStreamingTouchControlsStateValueKind::String;
    buildingCapability2Image.stringValue =  GetImageName(building.capability[1].id);        
    updateOperations.push_back(buildingCapability2Image);
    
    // enable the second slot if the building is of level 3 or above, otherwise the third slot will be disabled
    XGameStreamingTouchControlsStateOperation buildingCapability2Enabled;
    buildingCapability2Enabled.path = "/buildingCapability2IsEnabled";
    buildingCapability2Enabled.valueKind = XGameStreamingTouchControlsStateValueKind::Boolean;
    buildingCapability2Enabled.booleanValue =  building.level >= 3;
    updateOperations.push_back(buildingCapability2Enabled);
  
    // Switch to the building layout with the state update being sent as well
    XGameStreamingShowTouchControlsWithStateUpdate("building", updateOperations.size(), updateOperations.data());
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
[XGameStreamingShowTouchControlsWithStateUpdateOnClient](xgamestreamingshowtouchcontrolswithstateupdateonclient.md)  
[XGameStreamingUpdateTouchControlsState](xgamestreamingupdatetouchcontrolsstate.md)  
[XGameStreamingUpdateTouchControlsStateOnClient](xgamestreamingupdatetouchcontrolsstateonclient.md)  