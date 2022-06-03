---
author: M-Stahl
title: GameInputFocusPolicy
description: Enumerates focus policies for an input device.
kindex: GameInputFocusPolicy
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputFocusPolicy  

Enumerates focus policies for an input device.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputFocusPolicy    
{  
    GameInputDefaultFocusPolicy = 0x00000000,  
    GameInputDisableBackgroundInput = 0x00000001,  
    GameInputExclusiveForegroundInput = 0x00000002  
} GameInputFocusPolicy  
```  
  
<a id="constantsSection"></a>

## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputDefaultFocusPolicy | Input is always sent to the game, even when it is not in focus. This is the default focus policy for input devices. |  
| GameInputDisableBackgroundInput | Input is sent to the game only when it is in focus. When not in focus, the game receives a neutral or "rest" state report from the input device, as though the user is not interacting with the device. |  
| GameInputExclusiveForegroundInput | A game can prevent any other processes that are using GameInput from seeing the input it receives. This restriction is in effect only when the game is in focus. |  
  
<a id="remarksSection"></a>

## Remarks

This enumeration is used by the [IGameInput::SetFocusPolicy](../interfaces/igameinput/methods/igameinput_setfocuspolicy.md) method. Call `SetFocusPolicy` to specify whether input is sent to a game when it is not in focus. By default, input is broadcast to all processes regardless of whether they are in focus. 

For more information, see [GameInput fundamentals](../../../../input/overviews/input-fundamentals.md). 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  