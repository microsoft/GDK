---
author: M-Stahl
title: GetTouchCount
description: Retrieves the number of touch points on a game controller.
kindex: GetTouchCount
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
security: public
---

# IGameInputReading::GetTouchCount  
> [!NOTE]
> This function is not yet implemented.

Retrieves the number of touch points on a game controller.  

## Syntax  
  
```cpp
uint32_t GetTouchCount(  
)  
```  
  
### Parameters  
  
This method has no parameters.
  
### Return value  

Type: uint32_t

Returns 0.

After this method gets implemented, it will return the number of touch points on a game controller.  
  
## Remarks  
  
The ``IGameInputReading::GetTouchCount`` method retrieves the number of touch points for a game controller. It is used to determine the number of arrays needed for [IGameInputReading::GetTouchState](igameinputreading_gettouchstate.md) method. For intermediate and advanced use-cases of the GameInput API, see [Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md).

  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInputReading](../igameinputreading.md)  
  
  