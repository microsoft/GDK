---
author: M-Stahl
title: IGameInputDispatcher (Interface contents)
description: llows you to take manual control of scheduling the background work run by the GameInput API.
kindex: IGameInputDispatcher
ms.author: angillie
ms.topic: navigation
edited: 06/05/2019
security: public
---

# IGameInputDispatcher  

Allows you to take manual control of scheduling the background work run by the GameInput API.  

## Syntax  
  
```cpp  
class IGameInputDispatcher : public IUnknown  
```  
  
  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [Dispatch](methods/igameinputdispatcher_dispatch.md) | Executes work in the dispatcher's queue. |  
| [OpenWaitHandle](methods/igameinputdispatcher_openwaithandle.md) | Returns a wait handle that signals when work is available in the dispatcher queue. |  
  

  
## Remarks

Making a reference to the IGameInputDispatcher switches GameInput to "manual dispatch" mode, and releasing all references to the IGameInputDispatcher object returns it to "automatic dispatch" mode.  
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../input/overviews/input-overview.md)  
[GameInput](../../gameinput_members.md)  