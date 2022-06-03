---
author: M-Stahl
title: XInputEnable
description: XInputEnable API reference
kindex: XInputEnable
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
quality: good
security: public
---

# XInputEnable  

Sets the reporting state of XInput.  

## Syntax  
  
```cpp
void XInputEnable(  
         BOOL enable  
)  
```  
  
### Parameters  
  
*enable* &nbsp;&nbsp;\_In\_  
Type: BOOL  
  
If enable is **FALSE**, XInput will send only neutral data in response to [XInputGetState](xinputgetstate.md): that is, all buttons up, axes centered, and triggers at 0. [XInputSetState](xinputsetstate.md) calls will be registered but won't be sent to the device. Sending any value other than **FALSE** will restore the reading and writing functionality to normal.
  
### Return value
Type: void
  
None.
  
## Remarks

This function is deprecated and shouldn't be written into any new code. XInputEnable adds overhead to many XInput wrapper calls. You can `#define XINPUT_ON_GAMEINPUT_NO_XINPUTENABLE` to get rid of XInputEnable and the resulting overhead. For more information, see [Porting from XInput to GameInput](../../../../input/porting/input-porting-xinput.md#optimizingSection).
  
This function is meant to be called when an application gains or loses focus. When using this function, you won't have to change the XInput query loop in your application, because neutral data will always be reported if XInput is disabled.  

In a controller that supports vibration effects:  

- Passing **FALSE** will stop any vibration effects playing at the moment. In this state, calls to [XInputSetState](xinputsetstate.md) will be registered but won't be passed to the device.
- Passing **TRUE** will pass the last vibration request (even if it's 0) sent to [XInputSetState](xinputsetstate.md) and to the device.
  
## Requirements  
  
**Header:** XInputOnGameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also 
[Port XInput to GameInput](../../../../input/porting/input-porting-xinput.md)  
[XInputOnGameInput](../xinputongameinput_members.md)  
[XInputGetState](xinputgetstate.md)  
[XInputSetState](xinputsetstate.md)  
  