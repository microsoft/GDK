---
author: M-Stahl
title: GetTouchState
description: Retrieves the state from all touch digitizers on a game controller.
kindex: GetTouchState
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
security: public
---

# IGameInputReading::GetTouchState  
> [!NOTE]
> This function is not yet implemented.

Retrieves the state from all touch digitizers on a game controller.

## Syntax  
  
```cpp
uint32_t GetTouchState(  
         uint32_t stateArrayCount,  
         GameInputTouchState* stateArray  
)  
```  
  
### Parameters  
  
*stateArrayCount* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

  
Number of touch points on the game controller.
This is acquired by calling [IGameInputReading::GetTouchCount](igameinputreading_gettouchcount.md).  


*stateArray* &nbsp;&nbsp;\_Out\_writes\_(stateArrayCount)  
Type: [GameInputTouchState*](../../../structs/gameinputtouchstate.md)  

Pointer to the array of returned touch states.  

  
### Return value  

Type: uint32_t


Returns 0.

After this method gets implemented, it will return the number of valid buffers.  
  
## Remarks  

The ``IGameInputReading::GetTouchState`` method only targets touchpads or other touch-sensitive surfaces that are part of a controller. Standalone touchpads or pen/touchscreen digitizers are ignored by the GameInput API. The coordinate data for touch state is always linearly normalized to the range [–1.0, 1.0], and like mouse state does not correlate with screen-space coordinates in any way.  

Each [GameInputTouchState](../../../structs/gameinputtouchstate.md) structure contains information about a single touch point on a specific digitizer. The required size of the state array corresponds to how many touch points the digitizer supports. For example, the DualShock 4 controller's touchpad supports two touch points, so the size of the state array would be two. Some devices have multiple touch digitizers. For example, several of the buttons on an Oculus Touch controller are touch-sensitive to enable gesture detection. For devices like this, the state array essentially becomes two-dimensional: The touch points for the first digitizer occupy the first N elements of the array. The touch points for the second digitizer occupy the next M elements, and so forth. It is not required that each digitizer supports the same number of touch points. (Methods are available on the IGameInputDevice interface to get information about how the array elements are laid out.) 
Unlike the keyboard state array, the elements of the touch state array have fixed positions. For example, a device that supports two touch points will output a state array of two elements. If there are two active touch points, then both elements will contain valid data. However, if the first touch point goes away, the second one remains at index 1 — it does not shift down to index 0. This inconsistency exists because it reduces complexity in application code that consumes touch state and because the number of supported touch points on a single game controller is typically very small.
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  


[Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md)  
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)    
[IGameInputReading](../igameinputreading.md)  