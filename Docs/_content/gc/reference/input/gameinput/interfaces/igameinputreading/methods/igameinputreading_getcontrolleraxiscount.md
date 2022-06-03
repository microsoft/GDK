---
author: M-Stahl
title: GetControllerAxisCount
description: Retrieves the number of axes on a game controller.
kindex: GetControllerAxisCount
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
security: public
---

# IGameInputReading::GetControllerAxisCount  

Retrieves the number of axes on a game controller.  

## Syntax  
  
```cpp
uint32_t GetControllerAxisCount(  
)  
```  
  
### Parameters  
  
  
### Return value  
Type: uint32_t

Returns the number of axes on the game controller.  
  
## Remarks  
  
The ``IGameInputReading::GetControllerAxisCount`` method determines the buffers needed for the [IGameInputReading::GetControllerAxisState](igameinputreading_getcontrolleraxisstate.md) method. ``GetControllerAxisCount`` retrieves axis, button, and switch state from a game controller. Each state is returned as a separate variable-length array into buffers provided by the caller. The number of valid buffer entries upon return is indicated by the return value.
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md)    
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInputReading](../igameinputreading.md)  
  
  