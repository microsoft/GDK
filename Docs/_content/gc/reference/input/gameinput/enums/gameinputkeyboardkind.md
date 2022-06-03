---
author: M-Stahl
title: GameInputKeyboardKind
description: Enumerates keyboard types by key layout.
kindex: GameInputKeyboardKind
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputKeyboardKind  

Enumerates keyboard types by key layout.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputKeyboardKind  
{  
    GameInputUnknownKeyboard = -1,  
    GameInputAnsiKeyboard = 0,  
    GameInputIsoKeyboard = 1,  
    GameInputKsKeyboard = 2,  
    GameInputAbntKeyboard = 3,  
    GameInputJisKeyboard = 4  
} GameInputKeyboardKind  
```  
  
<a id="constantsSection"></a>

## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputUnknownKeyboard | Keyboard type is unknown. |  
| GameInputAnsiKeyboard | Keyboard type is ANSI (104-key). |  
| GameInputIsoKeyboard | Keyboard type is ISO (105-key). |  
| GameInputKsKeyboard | Keyboard type is KS (106-key). |  
| GameInputAbntKeyboard | Keyboard type is ABNT (107-key). |  
| GameInputJisKeyboard | Keyboard type is JIS (109-key). |  
  
<a id="remarksSection"></a>

## Remarks  
  
The keyboard types in this enumeration refer to the layouts of keys on various types of keyboards.  

This enumeration is used in the [GameInputKeyboardInfo](../structs/gameinputkeyboardinfo.md) structure. 

For more information, see [GameInput devices](../../../../input/overviews/input-devices.md). 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  