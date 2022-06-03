---
author: M-Stahl
title: GetFlightStickState
description: IGameInputReading GetFlightStickState API reference
kindex: GetFlightStickState
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
quality: good
security: public
---

# IGameInputReading::GetFlightStickState  

Retrieve a view of the input reading that describes the state of a flight stick.  

## Syntax  
  
```cpp
bool GetFlightStickState(  
         GameInputFlightStickState* state  
)  
```  
  
### Parameters  
  
*state* &nbsp;&nbsp;\_Out\_  
Type: [GameInputFlightStickState*](../../../structs/gameinputflightstickstate.md)  

  
Interpretation of the input as a flight stick input.  


  
### Return value  
Type: bool

Returns true on successful interpretation of a flight stick. Returns false when attempting to read an input that is not recognized as a flight stick.  
  
## Remarks  
  
Call the [IGameInputReading::GetInputKind](igameinputreading_getinputkind.md) method to see which Get\*State functions will return a valid interpretation for some [IGameInputReading](../igameinputreading.md). Each Get\*State function has a corresponding entry in the [IGameInputReading::GetInputKind](igameinputreading_getinputkind.md) enum. If you attempt to call a Get\*State function where the corresponding [IGameInputReading::GetInputKind](igameinputreading_getinputkind.md) flag is not set the function will return with default at rest values as well as a false return value.  
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
[IGameInputReading](../igameinputreading.md)  
  
  