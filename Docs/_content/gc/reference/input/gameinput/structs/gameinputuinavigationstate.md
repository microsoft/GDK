---
author: M-Stahl
title: GameInputUiNavigationState
description: Describes the state of UI navigation input.
kindex: GameInputUiNavigationState
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputUiNavigationState  

Describes the state of UI navigation input.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputUiNavigationState {  
    GameInputUiNavigationButtons buttons;  
} GameInputUiNavigationState  
```
  
<a id="membersSection"></a>

### Members  
  
*buttons*  
Type: [GameInputUiNavigationButtons](../enums/gameinputuinavigationbuttons.md)  
  
States of the UI navigation buttons. 
  
<a id="remarksSection"></a>
  
## Remarks  

This structure is used by the [IGameInputReading::GetUiNavigationState](../interfaces/igameinputreading/methods/igameinputreading_getuinavigationstate.md) method. 

For more information, see the [Getting data from readings](../../../../input/overviews/input-readings.md#gettingStateSection) section of [GameInput readings](../../../../input/overviews/input-readings.md). For a related code example, see [A simple gamepad input loop](../../../../input/overviews/input-readings.md#sampleSection). 

<a id="requirementsSection"></a>
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Input API Overview](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  