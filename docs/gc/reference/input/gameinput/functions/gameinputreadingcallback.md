---
author: M-Stahl
title: GameInputReadingCallback
description: Title defined callback for the new reading arrived event.
kindex: GameInputReadingCallback
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# GameInputReadingCallback  

Title defined callback for the new reading arrived event.  

## Syntax  
  
```cpp
void GameInputReadingCallback(  
         GameInputCallbackToken callbackToken,  
         void* context,  
         IGameInputReading* reading,  
         bool hasOverrunOccurred  
)  
```  
  
### Parameters  
  
*callbackToken* &nbsp;&nbsp;\_In\_  
Type: GameInputCallbackToken  

  
The callback token identifying the callback.  
Token returned by [IGameInput::RegisterReadingCallback](../interfaces/igameinput/methods/igameinput_registerreadingcallback.md).


*context* &nbsp;&nbsp;\_In\_  
Type: void*  

  
Title defined context.  


*reading* &nbsp;&nbsp;\_In\_  
Type: IGameInputReading*  

  
The new reading.  


*hasOverrunOccurred* &nbsp;&nbsp;\_In\_  
Type: bool  

  
Boolean indicating whether an overrun has occurred.
An overrun occurrence means the callback dispensing thread has not run for .5 seconds, which has caused reading callback to be skipped or lost as a result.
  
### Return value
Type: void
  
## Remarks

This function's definition is determined by the developer, but the parameters of that function must match in order for the callback to occur. This function is used to define the GameInput reading callback registered with [IGameInput::RegisterReadingCallback](../interfaces/igameinput/methods/igameinput_registerreadingcallback.md). It will define the function that is called whenever a desired reading is received from an input device.  

An overrun is unlikely to occur when GameInput is using the default dispatcher thread. However if an app takes manual control of dispatching, using the [IGameInput:CreateDispatcher](../interfaces/igameinput/methods/igameinput_createdispatcher.md) function, and then fails to pump the queue for an extended period of time an overrun can occur.  


## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
[IGameInput::RegisterReadingCallback](../interfaces/igameinput/methods/igameinput_registerreadingcallback.md)  