---
author: M-Stahl
title: GameInputArcadeStickButtons
description: Enumerates inputs from an arcade stick.
kindex: GameInputArcadeStickButtons
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputArcadeStickButtons  

Enumerates inputs from an arcade stick. 

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputArcadeStickButtons  
{  
    GameInputArcadeStickNone = 0x00000000,  
    GameInputArcadeStickMenu = 0x00000001,  
    GameInputArcadeStickView = 0x00000002,  
    GameInputArcadeStickUp = 0x00000004,  
    GameInputArcadeStickDown = 0x00000008,  
    GameInputArcadeStickLeft = 0x00000010,  
    GameInputArcadeStickRight = 0x00000020,  
    GameInputArcadeStickAction1 = 0x00000040,  
    GameInputArcadeStickAction2 = 0x00000080,  
    GameInputArcadeStickAction3 = 0x00000100,  
    GameInputArcadeStickAction4 = 0x00000200,  
    GameInputArcadeStickAction5 = 0x00000400,  
    GameInputArcadeStickAction6 = 0x00000800,  
    GameInputArcadeStickSpecial1 = 0x00001000,  
    GameInputArcadeStickSpecial2 = 0x00002000  
} GameInputArcadeStickButtons  
```  
  
<a id="constantsSection"></a>

## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputArcadeStickNone | Neutral state of the arcade stick. |  
| GameInputArcadeStickMenu | Menu button pressed. |  
| GameInputArcadeStickView | View button pressed. |  
| GameInputArcadeStickUp | Up input from the arcade stick. |  
| GameInputArcadeStickDown | Down input from the arcade stick. |  
| GameInputArcadeStickLeft | Left input from the arcade stick. |  
| GameInputArcadeStickRight | Right input from the arcade stick. |  
| GameInputArcadeStickAction1 | Action button 1 pressed. |  
| GameInputArcadeStickAction2 | Action button 2 pressed. |  
| GameInputArcadeStickAction3 | Action button 3 pressed. |  
| GameInputArcadeStickAction4 | Action button 4 pressed. |  
| GameInputArcadeStickAction5 | Action button 5 pressed. |  
| GameInputArcadeStickAction6 | Action button 6 pressed. |  
| GameInputArcadeStickSpecial1 | Special button 1 pressed. |  
| GameInputArcadeStickSpecial2 | Special button 2 pressed. |  
  
<a id="remarksSection"></a>

## Remarks  
  
This enumeration is used in the [GameInputArcadeStickState](../structs/gameinputarcadestickstate.md) structure. You can combine values to read multiple buttons simultaneously. 

For more information, see the [Getting data from readings](../../../../input/overviews/input-readings.md#gettingStateSection) section of [GameInput readings](../../../../input/overviews/input-readings.md).  

<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)
  