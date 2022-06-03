---
author: M-Stahl
title: GetUiNavigationState
description: IGameInputReading GetUiNavigationState API reference
kindex: GetUiNavigationState
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
quality: good
security: public
---

# IGameInputReading::GetUiNavigationState  

Retrieve a view of the input reading that describes the state of a UI navigation.  

## Syntax  
  
```cpp
bool GetUiNavigationState(  
         GameInputUiNavigationState* state  
)  
```  
  
### Parameters  
  
*state* &nbsp;&nbsp;\_Out\_  
Type: [GameInputUiNavigationState*](../../../structs/gameinputuinavigationstate.md)  

  
Interpretation of the input as UI navigation.  


  
### Return value  
Type: bool

Returns true on successful interpretation of a UI Navigation input. Returns false when attempting to read an input that is not recognized as a UI Navigation input.  
  
## Remarks  
  
Call the [IGameInputReading::GetInputKind](igameinputreading_getinputkind.md) method to see which Get\*State functions will return a valid interpretation for some [IGameInputReading](../igameinputreading.md). Each Get\*State function has a corresponding entry in the [IGameInputReading::GetInputKind](igameinputreading_getinputkind.md) enum. If you attempt to call a Get\*State function where the corresponding [IGameInputReading::GetInputKind](igameinputreading_getinputkind.md) flag is not set the function will return with default at rest values as well as a false return value.  
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
[IGameInputReading](../igameinputreading.md)  
  
  