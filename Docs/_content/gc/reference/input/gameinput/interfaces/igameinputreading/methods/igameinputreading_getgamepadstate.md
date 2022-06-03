---
author: M-Stahl
title: GetGamepadState
description: IGameInputReading::GetGamepadState API
kindex: IGameInputReading::GetGamepadState
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# IGameInputReading::GetGamepadState  

Retrieve a view of the input reading that describes the state of a gamepad.  

## Syntax  
  
```cpp
bool GetGamepadState(  
         GameInputGamepadState* state  
)  
```  
  
### Parameters  
  
*state* &nbsp;&nbsp;\_Out\_  
Type: [GameInputGamepadState*](../../../structs/gameinputgamepadstate.md)  
  
Interpretation of the input as a gamepad.  
  
### Return value  
Type: bool

Returns true on successful interpretation of a gamepad.  
Returns false when attempting to read an input that is not recognized as a gamepad.
  
## Remarks  

Call the [IGameInputReading::GetInputKind](igameinputreading_getinputkind.md) method to see which Get\*State functions will return a valid interpretation for some [IGameInputReading](../igameinputreading.md). Each Get\*State function has a corresponding entry in the [IGameInputReading::GetInputKind](igameinputreading_getinputkind.md) enum. If you attempt to call a Get\*State function where the corresponding [IGameInputReading::GetInputKind](igameinputreading_getinputkind.md) flag is not set the function will return with default at rest values as well as a false return value.
  
The following C++ sample demonstrates how to read the gamepad state.  
 

```cpp
void PlayerCrouch(); 
void PlayerStand(); 
void PlayerReload(); 
void PlayerMove(float, float); 
void SetCameraOrientation(float, float); 
 
void ProcessGamepadState( 
    _In_ IGameInputReading * prevReading, 
    _In_ IGameInputReading * currentReading) noexcept 
{ 
    GameInputGamepadState prevState, currentState; 
    prevReading->GetGamepadState(&prevState); 
    currentReading->GetGamepadState(&currentState); 
 
    GameInputGamepadButtons changedButtons = prevState.buttons ^ currentState.buttons; 
    GameInputGamepadButtons pressedButtons = changedButtons & currentState.buttons; 
    GameInputGamepadButtons releasedButtons = changedButtons ^ pressedButtons; 
 
    if (pressedButtons & GameInputGamepadRightShoulder) 
    { 
        PlayerCrouch(); 
    } 
    else if (releasedButtons & GameInputGamepadRightShoulder) 
    { 
        PlayerStand(); 
    } 
 
    if (pressedButtons & GameInputGamepadLeftShoulder) 
    { 
        PlayerReload(); 
    } 
 
    PlayerMove(currentState.leftThumbstickX, currentState.leftThumbstickY); 
    SetCameraOrientation(currentState.rightThumbstickX, currentState.rightThumbstickY); 
}
```

  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
[IGameInputReading](../igameinputreading.md)  
[IGameInputReading::GetInputKind](igameinputreading_getinputkind.md)  
  