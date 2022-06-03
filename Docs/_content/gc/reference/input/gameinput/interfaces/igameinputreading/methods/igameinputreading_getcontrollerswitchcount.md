---
author: M-Stahl
title: GetControllerSwitchCount
description: Retrieves the number of switches on a game controller.
kindex: GetControllerSwitchCount
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
security: public
---

# IGameInputReading::GetControllerSwitchCount  
> [!NOTE]
> This function is not yet implemented.

Retrieves the number of switches on a game controller.  

## Syntax  
  
```cpp
uint32_t GetControllerSwitchCount(  
)  
```  
  
### Parameters  
  
This method has no parameters.
  
### Return value  

Type: uint32_t


Returns the number of switches on a game controller.  
  
## Remarks  
  
The ``IGameInputReading::GetControllerSwitchCount`` method retrieves the number of switches for a game controller. It also determines the buffers required by the [IGameInputReading::GetControllerSwitchState](igameinputreading_getcontrollerswitchstate.md) method. For intermediate and advanced use-cases of the GameInput API, see [Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md). 
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInputReading](../igameinputreading.md)  
  
  