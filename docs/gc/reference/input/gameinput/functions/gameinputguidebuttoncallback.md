---
author: M-Stahl
title: GameInputGuideButtonCallback
description: Title-defined callback for the guide-button (pressed or released) event.
kindex: GameInputGuideButtonCallback
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
security: public
---

# GameInputGuideButtonCallback  

Title-defined callback for the guide-button (pressed or released) event.  

## Syntax  
  
```cpp
void GameInputGuideButtonCallback(  
         GameInputCallbackToken callbackToken,  
         void* context,  
         IGameInputDevice* device,  
         uint64_t timestamp,  
         bool isPressed  
)  
```  
  
### Parameters  
  
*callbackToken* &nbsp;&nbsp;\_In\_  
Type: GameInputCallbackToken  
  
The callback token returned by [IGameInput::RegisterDeviceCallback](../interfaces/igameinput/methods/igameinput_registerdevicecallback.md).  

*context* &nbsp;&nbsp;\_In\_  
Type: void*  
  
The title defined context passed to [IGameInput::RegisterDeviceCallback](../interfaces/igameinput/methods/igameinput_registerdevicecallback.md).    
  
*device* &nbsp;&nbsp;\_In\_  
Type: IGameInputDevice*  
  
The device that triggered the event.  
  
*timestamp* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The microsecond timestamp associated with the event.  
  
*isPressed* &nbsp;&nbsp;\_In\_  
Type: bool  
  
Boolean indicating whether the guide button is pressed.  
  
### Return value
Type: void
  
## Remarks  

The ``GameInputGuideButtonCallback`` function is used by the title-defined callback for the guide button (pressed or released) event. It is registered with the [IGameInput::RegisterDeviceCallback](../interfaces/igameinput/methods/igameinput_registerdevicecallback.md) method. This function is triggered by the conditions set from the registration method. For more information, see [Advanced GameInput topics](../../../../input/advanced/input-advanced-topics.md).

## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  