---
author: M-Stahl
title: RegisterKeyboardLayoutCallback
description: Registers a callback function when a keyboard layout is changed.
kindex: IGameInput::RegisterKeyboardLayoutCallback
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
security: public
---

# IGameInput::RegisterKeyboardLayoutCallback  

> [!NOTE]
> This function is not yet implemented.

Registers a callback function when a keyboard layout is changed.  


## Syntax  
  
```cpp
HRESULT RegisterKeyboardLayoutCallback(  
         IGameInputDevice* device,  
         void* context,  
         GameInputKeyboardLayoutCallback callbackFunc,  
         GameInputCallbackToken* callbackToken  
)  
```  
  
### Parameters  
  
*device* &nbsp;&nbsp;\_In\_opt\_  
Type: IGameInputDevice*  
  
Optionally limits registered callback to trigger a specific device.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
An object that provides relevant information for the callback function. Typically, it is the calling object.  
  
*callbackFunc* &nbsp;&nbsp;\_In\_  
Type: GameInputKeyboardLayoutCallback  
  
Title-defined callback function that is called when the keyboard layout is registered.  
  
*callbackToken* &nbsp;&nbsp;\_Result\_zeroonfailure\_  
Type: GameInputCallbackToken*  
  
Token identifying the registered callback function. This token is used to identify the registered function if you need to cancel or unregister the callback function.  
  
  
### Return value  

Type: HRESULT
  
Returns ``E_NOTIMPL``.  
  
## Remarks  

The ``RegisterKeyboardLayoutCallback`` method registers a callback function when a keyboard layout is changed. For related information, see the [IGameInput::UnregisterCallback](igameinput_unregistercallback.md) and [IGameInput::StopCallback](igameinput_stopcallback.md) methods. For intermediate and advanced use-cases of the GameInput API, see [Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md).  

## Requirements 

The ``RegisterKeyboardLayoutCallback`` method registers a callback function when a keyboard layout is changed. For related information, see the [IGameInput::UnregisterCallback](igameinput_unregistercallback.md) and [IGameInput::StopCallback](igameinput_stopcallback.md) methods. For intermediate and advanced use-cases of the GameInput API, see [Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md).
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInput](../igameinput.md)  