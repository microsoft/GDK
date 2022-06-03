---
author: M-Stahl
title: GetKeyCount
description: Retrieves the number of keys active on a game controller.
kindex: GetKeyCount
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
security: public
---

# IGameInputReading::GetKeyCount  

Retrieves the number of keys active on a keyboard.  

## Syntax  
  
```cpp
uint32_t GetKeyCount(  
)  
```  
  
### Parameters  
  
This method has no parameters.
  
### Return value  

Type: uint32_t


This returns the number of keys active on a game controller.  
  
## Remarks  
  
The ``IGameInputReading::GetKeyCount`` method retrieves the number of keys active on a game controller. It is used to determine the number of arrays needed for [IGameInputReading::GetKeyState](igameinputreading_getkeystate.md) method. For intermediate and advanced use-cases of the GameInput API, see [Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md).

 
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInputReading](../igameinputreading.md)  
  
  