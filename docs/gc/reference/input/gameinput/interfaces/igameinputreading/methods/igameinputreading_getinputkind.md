---
author: M-Stahl
title: GetInputKind
description: IGameInputReading::GetInputKind API
kindex: IGameInputReading::GetInputKind
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# IGameInputReading::GetInputKind  

Retrieves the type of input associated with a reading.  

## Syntax  
  
```cpp
GameInputKind GetInputKind(  
)  
```  
  
### Parameters  
  
  
### Return value  

Type: GameInputKind
  
Returns one of the enumerated types of [GameInputKind](../../../enums/gameinputkind.md)  
  
## Remarks  
  
The returned value describes types of input like mouse, touch, keyboard, gamepad, or some other type of input. The [GameInputKind](../../../enums/gameinputkind.md) returned is a combination of all of the types of input that can be retrieved from a device reading. This is possible due to the fact that a [GameInputKind](../../../enums/gameinputkind.md) may have multiple flags set in a single instance. Each flag corresponds to a Get\*State method of [IGameInputReading](../igameinputreading.md) which will return meaningful information. Calling one of the Get\*State methods when its corresponding [GameInputKind](../../../enums/gameinputkind.md) flag is not set for the device causes it to fill the output arrays with “at rest” values like false or zero.  
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
[IGameInputReading](../igameinputreading.md)  
[GameInputKind](../../../enums/gameinputkind.md)  