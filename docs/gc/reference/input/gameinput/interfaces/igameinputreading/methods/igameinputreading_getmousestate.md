---
author: M-Stahl
title: GetMouseState
description: IGameInputReading GetMouseState API reference
kindex: GetMouseState
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# IGameInputReading::GetMouseState  

Retrieve a view of the input reading that describes the state of a mouse.  

## Syntax  
  
```cpp
bool GetMouseState(  
         GameInputMouseState* state  
)  
```  
  
### Parameters  
  
*state* &nbsp;&nbsp;\_Out\_  
Type: [GameInputMouseState*](../../../structs/gameinputmousestate.md)  

  
Interpretation of the input as a mouse.  


  
### Return value  
Type: bool

This function is not yet implemented.
Currently returns false.
  
Once implemented, returns true on successful interpretation of a mouse input. Returns false when attempting to read an input that is not recognized as a mouse input.  
  
## Remarks  
  
Call the [IGameInputReading::GetInputKind](igameinputreading_getinputkind.md) method to see which Get\*State functions will return a valid interpretation for some [IGameInputReading](../igameinputreading.md). Each Get\*State function has a corresponding entry in the [IGameInputReading::GetInputKind](igameinputreading_getinputkind.md) enum. If you attempt to call a Get\*State function where the corresponding [IGameInputReading::GetInputKind](igameinputreading_getinputkind.md) flag is not set the function will return with default at rest values as well as a false return value.  

Mouse movement is reported natively from the device as a series of delta values, rather than as an absolute position. Unfortunately, this is not very compatible with a polling API, because periodically asking for the current mouse reading is likely to miss several intermediate deltas. Rather than forcing apps that use the polling APIs to walk through potentially dozens of historical mouse readings and adding up the deltas, the GameInput API exposes mouse movement by continuously accumulating deltas into a virtual "position" value. Applications then compute their own deltas by subtracting the "position" value from the previous reading they obtained. This allows access to individual deltas when calculated for consecutive readings, or accumulated deltas when intermediate readings have been intentionally skipped. It should be stressed that the mouse "position" value is merely the sum of all movement deltas, and does not correlate with screen-space coordinates in any way.
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
[IGameInputReading](../igameinputreading.md)  
  
  