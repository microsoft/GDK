---
author: M-Stahl
title: GameInputFlightStickButtons
description: Enumerates flight stick buttons.
kindex: GameInputFlightStickButtons
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputFlightStickButtons  

Enumerates flight stick buttons.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputFlightStickButtons  
{  
    GameInputFlightStickNone = 0x00000000,  
    GameInputFlightStickMenu = 0x00000001,  
    GameInputFlightStickView = 0x00000002,  
    GameInputFlightStickFirePrimary = 0x00000004,  
    GameInputFlightStickFireSecondary = 0x00000008  
} GameInputFlightStickButtons  
```  
  
<a id="constantsSection"></a>

## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputFlightStickNone | No button pressed. |  
| GameInputFlightStickMenu | Menu button pressed. |  
| GameInputFlightStickView | View button pressed. |  
| GameInputFlightStickFirePrimary | Primary fire button pressed. |  
| GameInputFlightStickFireSecondary | Secondary fire button pressed. |  
  
<a id="remarksSection"></a>

## Remarks  

This enumeration is used in the [GameInputFlightStickState](../structs/gameinputflightstickstate.md) structure. You can combine values to read multiple buttons simultaneously. 

For more information, see the [Getting data from readings](../../../../input/overviews/input-readings.md#gettingStateSection) section of [GameInput readings](../../../../input/overviews/input-readings.md).  
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  