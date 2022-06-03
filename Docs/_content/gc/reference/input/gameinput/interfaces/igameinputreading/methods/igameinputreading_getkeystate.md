---
author: M-Stahl
title: GetKeyState
description: Retrieves the state of active keys on a game controller input.
kindex: GetKeyState
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
security: public
---

# IGameInputReading::GetKeyState  

Retrieves the state of active keys on a keyboard input.  

## Syntax  
  
```cpp
uint32_t GetKeyState(  
         uint32_t stateArrayCount,  
         GameInputKeyState* stateArray  
)  
```  
  
### Parameters  
  
*stateArrayCount* &nbsp;&nbsp;\_In\_  
Type: uint32_t  


Returns 0.

When this method gets implemented, it will return  the number of keys active on a game controller. This is acquired by calling the [IGameInputReading::GetKeyCount](igameinputreading_getkeycount.md) method.

*stateArray* &nbsp;&nbsp;\_Out\_writes\_(stateArrayCount)  
Type: [GameInputKeyState*](../../../structs/gameinputkeystate.md)  

  
Pointer to the [GameInputKeyState*](../../../structs/gameinputkeystate.md) structure.  

  
### Return value  

Type: uint32_t
  
Number of valid buffer entries.  
  
## Remarks  
  
The ``IGameInputReading::GetKeyState`` method retrieves the state of active keys on a game controller input. Rudimentary keyboard state is meant solely for mapping keyboard input to game actions, like movement or firing a weapon. It is not meant for regular text input. A game needs a significant amount of code on top of this state to implement something as simple as a text box (to say nothing of complex features like IMEs). Other APIs should be used where that functionality is desired. 

The state for each key is not stored at a fixed index within the array. Rather, the number of valid elements in the array grows as keys are pressed and shrinks as keys are released. New keys are added at the end of the array, and when a key is released everything shifts down to fill the gap. The first array element where the ``scancode`` and ``vkey`` values are both zero. This indicates the end of valid data in the array. Standard keyboards are only able to report four to six key presses at a time, and even high-end gaming keyboards rarely support more than 12-16 keys at once. As such, this approach typically keeps the maximum size of the array small (the maximum size can be queried via the ``IGameInputDevice`` interface). This is much more efficient than having applications iterate over an array of 256 values every time they check the keyboard state.
   
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

 
[Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md)  
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)   
[IGameInputReading](../igameinputreading.md)  
  
  