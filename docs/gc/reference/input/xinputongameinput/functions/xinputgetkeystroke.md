---
author: M-Stahl
title: XInputGetKeystroke
description: XInputGetKeystroke API reference
kindex: XInputGetKeystroke
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
quality: good
security: public
---

# XInputGetKeystroke  

Retrieves a gamepad input event.  

## Syntax  
  
```cpp
DWORD XInputGetKeystroke(  
         DWORD dwUserIndex,  
         _Reserved_ dwReserved,  
         XINPUT_KEYSTROKE* pKeystroke  
)  
```  
  
### Parameters  
  
*dwUserIndex* &nbsp;&nbsp;\_In\_  
Type: DWORD  
  
Index of the signed-in gamer associated with the device. A value in the range of 0–XUSER_MAX_COUNT to 1; XUSER_INDEX_ANY is used to fetch the next available input event from any user.  
  
*dwReserved* &nbsp;&nbsp;  
Type: _Reserved_  
  
Reserved  
  
*pKeystroke* &nbsp;&nbsp;\_Out\_  
Type: [XINPUT_KEYSTROKE*](../structs/xinput_keystroke.md)  
  
Pointer to an [XINPUT_KEYSTROKE](../structs/xinput_keystroke.md) structure that receives an input event.  
  
  
### Return value
Type: DWORD
  
* If the function succeeds, it will return **ERROR_SUCCESS**. 
* If no new keys have been pressed, the function will return **ERROR_EMPTY**. 
* If the controller is not connected or the user has not activated it, the function will return **ERROR_DEVICE_NOT_CONNECTED**; see the Remarks section below. 
* If the function fails, it will return an error code defined in Winerror.h. 
  
## Remarks
  
Wireless controllers are not considered active upon system startup; if a call is made to any of the XInput functions before a wireless controller is made active, that call will return **ERROR_DEVICE_NOT_CONNECTED**. Game titles must examine the return code and must be prepared to handle this condition. Wired controllers are automatically activated when they are inserted. Wireless controllers are activated when the user presses the START or Xbox Guide button to turn on the controller.

If the code you're porting from XInput to GameInput does not call the GetKeyStroke function, then you can reduce the size of the XInput wrapper by defining XINPUT_ON_GAMEINPUT_NO_XINPUTGETKEYSTROKE. For more information, see [Porting from XInput to GameInput](../../../../input/porting/input-porting-xinput.md#optimizingSection).  

## Requirements  
  
**Header:** XInputOnGameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also 
[Port XInput to GameInput](../../../../input/porting/input-porting-xinput.md)  
[XInputOnGameInput](../xinputongameinput_members.md)