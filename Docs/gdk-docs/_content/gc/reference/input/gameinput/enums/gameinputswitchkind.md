---
author: M-Stahl
title: GameInputSwitchKind
description: Enumerates types of switches supported by an input device.
kindex: GameInputSwitchKind
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputSwitchKind  

Enumerates types of switches supported by an input device.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputSwitchKind  
{  
    GameInputUnknownSwitchKind = -1,  
    GameInput2WaySwitch = 0,  
    GameInput4WaySwitch = 1,  
    GameInput8WaySwitch = 2  
} GameInputSwitchKind  
```  
  
<a id="constantsSection"></a>

## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputUnknownSwitchKind | Unknown switch type. |  
| GameInput2WaySwitch | Two-way switch. |  
| GameInput4WaySwitch | Four-way switch. |  
| GameInput8WaySwitch | Eight-way switch. |  
  
<a id="remarksSection"></a>

## Remarks  

This enumeration is used in the [GameInputControllerSwitchInfo](../structs/gameinputcontrollerswitchinfo.md) and [GameInputFlightStickInfo](../structs/gameinputflightstickinfo.md) structures. For a flight stick, the values usually apply to the hat switch. 

For intermediate and advanced use cases of the GameInput API, see [Advanced GameInput](../../../../input/advanced/input-advanced-topics.md) topics. 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  