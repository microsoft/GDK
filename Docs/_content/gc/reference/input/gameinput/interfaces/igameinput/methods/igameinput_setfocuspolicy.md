---
author: M-Stahl
title: SetFocusPolicy
description: Sets the focus policy for a game's input devices.
kindex: IGameInput::SetFocusPolicy
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
security: public
---

# IGameInput::SetFocusPolicy  

Sets the focus policy for a game's input devices. 

## Syntax  
  
```cpp
void SetFocusPolicy(  
         GameInputFocusPolicy policy  
)  
```  
  
### Parameters  
  
*policy* &nbsp;&nbsp;\_In\_  
Type: [GameInputFocusPolicy](../../../enums/gameinputfocuspolicy.md)  
  
The focus policy to be set.  
  
  
### Return value  
Type: void
  
No return.  
  
## Remarks  
  
The ``IGameInput::SetFocusPolicy`` method sets the focus policy for a game’s input devices. The focus policy determines whether the input devices provide input based on the focus of the game. Focus refers to whether the game is selected as the main focus or if it is currently running in the background while another application has focus. For intermediate and advanced use-cases of the GameInput API, see [Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md). 
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[GameInputFocusPolicy](../../../enums/gameinputfocuspolicy.md)  
[IGameInput](../igameinput.md)   
  
  