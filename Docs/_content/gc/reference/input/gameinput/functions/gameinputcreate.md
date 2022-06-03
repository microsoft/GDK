---
author: M-Stahl
title: GameInputCreate
description: Gets an instance of the IGameInput interface.
kindex: GameInputCreate
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
security: public
---

# GameInputCreate  

Gets an instance of the IGameInput interface.  

## Syntax  
  
```cpp
HRESULT GameInputCreate(  
         IGameInput** gameInput  
)  
```  
  
### Parameters  
  
*gameInput* &nbsp;&nbsp;\_COM\_Outptr\_  
Type: IGameInput**  
  
An instance of the underlying per-process singleton returned by the call.
  
### Return value

Type: HRESULT
  
Function result.  
  
## Remarks  
  
The ``GameInputCreate`` function is the Nano-COM factory for getting instances of the ``IGameInput`` interface. The ``IGameInput`` interface is implemented on a per-process singleton that is created the first time this function is called. Therefore, the first call to this function can take a short time to return — short enough that it is generally safe to call from a UI thread, but not from time-sensitive contexts such as a game loop. Subsequent calls to this function from the same process merely add another reference to the underlying singleton and return quickly.

Applications should call the ``GameInputCreate`` function once during startup and retain the ``IGameInput`` object reference until the application is ready to shut down. This is true even for Universal Windows Platform (UWP) apps responding to process lifetime management (PLM) suspend events because the cost of reinitializing the ``GameInput`` singleton (when the app resumes) typically outweighs the benefits of freeing a small amount of memory in the application.  

## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Advanced GameInput topics](../../../../input/advanced/input-advanced-topics.md)  
[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)