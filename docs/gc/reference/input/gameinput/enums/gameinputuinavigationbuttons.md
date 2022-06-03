---
author: M-Stahl
title: GameInputUiNavigationButtons
description: Enumerates UI navigation buttons.
kindex: GameInputUiNavigationButtons
ms.author: angillie
ms.topic: reference
edited: '08/28/2020'
security: public
---

# GameInputUiNavigationButtons  

Enumerates UI navigation buttons. 

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputUiNavigationButtons  
{  
    GameInputUiNavigationNone = 0x00000000,  
    GameInputUiNavigationMenu = 0x00000001,  
    GameInputUiNavigationView = 0x00000002,  
    GameInputUiNavigationAccept = 0x00000004,  
    GameInputUiNavigationCancel = 0x00000008,  
    GameInputUiNavigationUp = 0x00000010,  
    GameInputUiNavigationDown = 0x00000020,  
    GameInputUiNavigationLeft = 0x00000040,  
    GameInputUiNavigationRight = 0x00000080,  
    GameInputUiNavigationContext1 = 0x00000100,  
    GameInputUiNavigationContext2 = 0x00000200,  
    GameInputUiNavigationContext3 = 0x00000400,  
    GameInputUiNavigationContext4 = 0x00000800,  
    GameInputUiNavigationPageUp = 0x00001000,  
    GameInputUiNavigationPageDown = 0x00002000,  
    GameInputUiNavigationPageLeft = 0x00004000,  
    GameInputUiNavigationPageRight = 0x00008000,  
    GameInputUiNavigationScrollUp = 0x00010000,  
    GameInputUiNavigationScrollDown = 0x00020000,  
    GameInputUiNavigationScrollLeft = 0x00040000,  
    GameInputUiNavigationScrollRight = 0x00080000  
} GameInputUiNavigationButtons  
```  
  
<a id="constantsSection"></a>

## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputUiNavigationNone | No navigation input. |  
| GameInputUiNavigationMenu | Menu button. |  
| GameInputUiNavigationView | View button. |  
| GameInputUiNavigationAccept | Accept button. |  
| GameInputUiNavigationCancel | Cancel button. |  
| GameInputUiNavigationUp | Up input. |  
| GameInputUiNavigationDown | Down input. |  
| GameInputUiNavigationLeft | Left input. |  
| GameInputUiNavigationRight | Right input. |  
| GameInputUiNavigationContext1 | Context 1 input. |  
| GameInputUiNavigationContext2 | Context 2 input. |  
| GameInputUiNavigationContext3 | Context 3 input. |  
| GameInputUiNavigationContext4 | Context 4 input. |  
| GameInputUiNavigationPageUp | Page up input. |  
| GameInputUiNavigationPageDown | Page down input. |  
| GameInputUiNavigationPageLeft | Page left input. |  
| GameInputUiNavigationPageRight | Page right input. |  
| GameInputUiNavigationScrollUp | Scroll up input. |  
| GameInputUiNavigationScrollDown | Scroll down input. |  
| GameInputUiNavigationScrollLeft | Scroll left input. |  
| GameInputUiNavigationScrollRight | Scroll right input. |  
  
<a id="remarksSection"></a>

## Remarks  

This enumeration is used in the [GameInputUiNavigationState](../structs/gameinputuinavigationstate.md) structure. `GameInputUiNavigationState` is used by the [IGameInputReading::GetUiNavigationState](../interfaces/igameinputreading/methods/igameinputreading_getuinavigationstate.md) method. 

By using a UI navigation controller, which is a virtual device, a title needs to process only one kind of input for UI navigation instead of processing input from each kind of device that the title supports. 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)
  