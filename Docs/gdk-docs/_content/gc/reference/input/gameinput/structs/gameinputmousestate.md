---
author: M-Stahl
title: GameInputMouseState
description: Describes the state of a mouse.
kindex: GameInputMouseState
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputMouseState  

Describes the state of a mouse. 

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputMouseState {  
    GameInputMouseButtons buttons;  
    int64_t positionX;  
    int64_t positionY;  
    int64_t wheelX;  
    int64_t wheelY;  
} GameInputMouseState  
```
  
<a id="membersSection"></a>

### Members  
  
*buttons*  
Type: [GameInputMouseButtons](../enums/gameinputmousebuttons.md)  
  
State of the mouse buttons. 
  
*positionX*  
Type: int64_t  
  
Cumulative x-axis change in the position of the mouse.  
  
*positionY*  
Type: int64_t  
  
Cumulative y-axis change in the position of the mouse.  
  
*wheelX*  
Type: int64_t  
  
Cumulative change in the x-axis scroll wheel.  
  
*wheelY*  
Type: int64_t  
  
Cumulative change in the y-axis scroll wheel.  
  
<a id="remarksSection"></a>

## Remarks  

This structure is used by the [IGameInputReading::GetMouseState](../interfaces/igameinputreading/methods/igameinputreading_getmousestate.md) method. 

Mouse and scroll-wheel movements are not reported as absolute positions. Calculate deltas by subtracting the values in the current reading from the values in the previous reading. 

For more information, see [GameInput readings](../../../../input/overviews/input-readings.md). 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  