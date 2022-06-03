---
author: M-Stahl
title: GameInputArcadeStickState
description: Describes the state of an arcade stick.
kindex: GameInputArcadeStickState
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputArcadeStickState  

Describes the state of an arcade stick.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputArcadeStickState {  
    GameInputArcadeStickButtons buttons;  
} GameInputArcadeStickState  
```
  
<a id="membersSection"></a>

### Members  
  
*buttons*  
Type: [GameInputArcadeStickButtons](../enums/gameinputarcadestickbuttons.md)  
  
The inputs from an arcade stick.  
  
<a id="remarksSection"></a>

## Remarks  

This structure is used by the [IGameInputReading::GetArcadeStickState](../interfaces/igameinputreading/methods/igameinputreading_getarcadestickstate.md) method. 
  
For more information, see the [Getting data from readings](../../../../input/overviews/input-readings.md#gettingStateSection) section of [GameInput readings](../../../../input/overviews/input-readings.md). For a related code example, see [A simple gamepad input loop](../../../../input/overviews/input-readings.md#sampleSection). 

<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  