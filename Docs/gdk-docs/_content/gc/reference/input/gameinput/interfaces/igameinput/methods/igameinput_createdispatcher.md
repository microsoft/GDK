---
author: M-Stahl
title: CreateDispatcher
description: CreateDispatcher API reference
kindex: CreateDispatcher
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# IGameInput::CreateDispatcher  

Creates a dispatcher for manually scheduling GameInput background work.  

## Syntax  
  
```cpp
HRESULT CreateDispatcher(  
         IGameInputDispatcher** dispatcher  
)  
```  
  
### Parameters  
  
*dispatcher* &nbsp;&nbsp;\_COM\_Outptr\_  
Type: IGameInputDispatcher**  

  
The created dispatcher which will be used to handle background work.  

  
### Return value  
Type: HRESULT
  
Function result.  
  
## Remarks  
  
Making a reference to the [IGameInputDispatcher](../../IGameInputDispatcher/igameinputdispatcher.md) switches GameInput to “manual dispatch” mode. Releasing all references to the[IGameInputDispatcher](../../IGameInputDispatcher/igameinputdispatcher.md) object returns GameInput to “automatic dispatch” mode. [IGameInputDispatcher](../../IGameInputDispatcher/igameinputdispatcher.md) is its own interface which you can use to dispatch events and open wait handles.
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
[IGameInput](../igameinput.md)  
[IGameInputDispatcher](../../IGameInputDispatcher/igameinputdispatcher.md)  
[IGameInputDispatcher::Dispatch](../../IGameInputDispatcher/methods/igameinputdispatcher_dispatch.md)  
[IGameInputDispatcher::OpenWaitHandle](../../IGameInputDispatcher/methods/igameinputdispatcher_openwaithandle.md)  