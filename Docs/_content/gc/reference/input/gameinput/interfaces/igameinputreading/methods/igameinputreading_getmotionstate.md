---
author: M-Stahl
title: GetMotionState
description: IGameInputReading GetMotionState API reference
kindex: GetMotionState
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# IGameInputReading::GetMotionState  

Retrieve a view of the input reading that describes the state of a motion input.  

## Syntax  
  
```cpp
bool GetMotionState(  
         GameInputMotionState* state  
)  
```  
  
### Parameters  
  
*state* &nbsp;&nbsp;\_Out\_  
Type: [GameInputMotionState*](../../../structs/gameinputmotionstate.md)  

  
Interpretation of the input as a motion input.  


  
### Return value  
Type: bool

This function is not yet implemented.
Currently returns false.
  
Once implemented, returns true on successful interpretation of a motion input. Returns false when attempting to read an input that is not recognized as a motion input.  
  
## Remarks  

The GetMotionState method retrieves 3DoF motion sensor state from a game controller, which is returned in a single GameInputMotionState structure. This structure contains raw unfiltered accelerometer, gyroscope, and magnetometer sensor data, linearly normalized to the range [0.0, 1.0].  (Methods are available on the IGameInputDevice interface to get information about the unnormalized min/max values.)  

The GameInputMotionState structure also contains an orientation vector (in Quaternion form) indicating the orientation of the device. The orientation data comes from the hardware if it has an embedded sensor fusion engine, otherwise it is computed by the GameInput implementation's own sensor fusion code. By default, the frame of reference for all orientation axes is device-defined. If a magnetometer is available, then the orientation's X/Y axes are relative to magnetic north. If both an accelerometer and gyroscope are available, the orientation's Z axis is relative to gravity.  

Call the [IGameInputReading::GetInputKind](igameinputreading_getinputkind.md) method to see which Get\*State functions will return a valid interpretation for some [IGameInputReading](../igameinputreading.md). Each Get\*State function has a corresponding entry in the [IGameInputReading::GetInputKind](igameinputreading_getinputkind.md) enum. If you attempt to call a Get\*State function where the corresponding [IGameInputReading::GetInputKind](igameinputreading_getinputkind.md) flag is not set the function will return with default at rest values as well as a false return value. 
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
[IGameInputReading](../igameinputreading.md)  
  
  