---
author: M-Stahl
title: StopCallback
description: IGameInput::StopCallback API
kindex: StopCallback
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# IGameInput::StopCallback  

Stops a callback function from being triggered.  

## Syntax  
  
```cpp
void StopCallback(  
         GameInputCallbackToken callbackToken  
)  
```  
  
### Parameters  
  
*callbackToken* &nbsp;&nbsp;\_In\_  
Type: GameInputCallbackToken  

  
Token for the callback function to be unregistered. Generated when the function was initially registered with [IGameInput::RegisterDeviceCallback](igameinput_registerdevicecallback.md).  


  
### Return value  
Type: void
  
No return value.  
  
## Remarks  
  
This function differs from the  function in that it does not make it safe for you to remove resources from the callback function, it can however be called from the callback function. 

The **StopCallback** method and [IGameInput::UnregisterCallback](igameinput_unregistercallback.md) methods differ slightly. Calling either method ensures that the associated callback will not be dispatched again. However, it is not safe to free any resources associated with the callback (for example, unloading the DLL the hosts the callback function) until the [IGameInput::UnregisterCallback](igameinput_unregistercallback.md) function successfully returns.   Therefore, it is not possible to unregister a callback from within its registered callback function, and attempting to do so causes an error to be returned. However, it is safe to cancel a callback from within the callback function.
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
[IGameInput](../igameinput.md)  
[IGameInput::RegisterDeviceCallback](igameinput_registerdevicecallback.md)  
[IGameInput::RegisterReadingCallback](igameinput_registerreadingcallback.md)  
[IGameInput::RegisterGuideButtonCallback](igameinput_registerguidebuttoncallback.md)  
  