---
author: M-Stahl
title: GetControllerButtonCount
description: Retrieves the number of buttons on a game controller.
kindex: GetControllerButtonCount
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
security: public
---

# IGameInputReading::GetControllerButtonCount  

Retrieves the number of buttons on a game controller.  

## Syntax  
  
```cpp
uint32_t GetControllerButtonCount(  
)  
```  
  
### Parameters  
  
This method has no parameters.
  
### Return value  

Type: uint32_t

Returns the number of buttons on the game controller.  
  
## Remarks  
  
The ``IGameInputReading::GetControllerButtonCount`` method retrieves the number of buttons for a game controller. It also determines the buffers required by the [IGameInputReading::GetControllerButtonState](igameinputreading_getcontrollerbuttonstate.md) method. 

For intermediate and advanced use-cases of the GameInput API, see [Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md).  
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInputReading](../igameinputreading.md)  
  
  