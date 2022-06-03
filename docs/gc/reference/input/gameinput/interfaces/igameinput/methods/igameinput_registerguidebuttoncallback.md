---
author: M-Stahl
title: RegisterGuideButtonCallback
description: Registers a callback function that is called when the Xbox logo button is pressed or released.
kindex: RegisterGuideButtonCallback
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
security: public
---

# IGameInput::RegisterGuideButtonCallback  
> [!NOTE]
> This function is not yet implemented.

Registers a callback function that is called when the Xbox logo button is pressed or released. 

## Syntax  
  
```cpp
HRESULT RegisterGuideButtonCallback(  
         IGameInputDevice* device,  
         void* context,  
         GameInputGuideButtonCallback callbackFunc,  
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
Type: GameInputGuideButtonCallback  

  
Title-defined callback function that is called when the Xbox logo button is pressed or released.  


*callbackToken* &nbsp;&nbsp;\_Out\_opt\_  
Type: GameInputCallbackToken*  

  
Token identifying the registered callback function. This token is used to identify the registered function if you need to cancel or unregister the callback function.  

  
### Return value  

Type: HRESULT
  
Returns ``E_NOTIMPL``.  

## Remarks
  
This method registers a callback function call when the Xbox logo button is pressed or released. Guide button callbacks are dispatched only if the shell does not consume the guide button. On the PC, this happens on when the Game Bar settings are set not to launch the Game Bar when the guide button is pressed. On the Xbox, the shell always consumes the guide button, so these callbacks are never dispatched on Xbox.

For related information, see the [IGameInput::UnregisterCallback](igameinput_unregistercallback.md) and [IGameInput::StopCallback](igameinput_stopcallback.md) methods.

The following code example demonstrates how to listen for presses of the guide button.
  
```cpp
Microsoft::WRL::ComPtr<IGameInput> gameInput; 
 
void CALLBACK OnGuideButton( 
    _In_ GameInputCallbackToken callbackToken, 
    _In_ void * context, 
    _In_ uint64_t timestamp, 
    _In_ IGameInputDevice * device, 
    _In_ bool isPressed) 
{ 
    // Application-specific code to handle the guide 
    // button state change from the specified device 
} 
 
void WaitForGuideButtonWorker( 
    _In_ AsyncQueueHandleT queue, 
    _In_ volatile bool & cancelWait) noexcept 
{ 
    GameInputCallbackToken token; 
    if (SUCCEEDED(gameInput->RegisterGuideButtonCallback( 
        queue, 
        nullptr, 
        OnGuideButton, 
        &token))) 
    { 
        while (!cancelWait) 
        { 
            DispatchAsyncQueue(queue, AsyncQueueCallbackType_Completion, 100); 
        } 
 
        gameInput->UnregisterCallback(token, 5000); 
    } 
}  
```

 
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md)  
[Overview GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInput](../igameinput.md)  