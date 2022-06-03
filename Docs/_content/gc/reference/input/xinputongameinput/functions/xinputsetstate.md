---
author: M-Stahl
title: XInputSetState
description: Sends vibration data to the specified controller. Supports the vibration capability of an Xbox 360 controller.
kindex: XInputSetState
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# XInputSetState  

Sends vibration data to the specified controller. Supports the vibration capability of an Xbox 360 controller.  

<a id="syntaxSection"></a> 

## Syntax  
  
```cpp
DWORD XInputSetState(  
         DWORD dwUserIndex,  
         const XINPUT_VIBRATION * pVibration  
)  
```  
  
<a id="parametersSection"></a> 

### Parameters  
  
*dwUserIndex* &nbsp;&nbsp;\_In\_  
Type: DWORD  
  
Index of the gamer associated with the device; a value in the range of 0 to `XUSER_MAX_COUNT – 1`.  
  
*pVibration* &nbsp;&nbsp;\_In\_  
Type: [XINPUT_VIBRATION](../structs/xinput_vibration.md)\*  
  
Pointer to an [XINPUT_VIBRATION](../structs/xinput_vibration.md) object that contains the vibration information to be sent to the controller.  
  
<a id="retvalSection"></a> 

### Return value  

Type: DWORD
  
If the function succeeds, it returns `ERROR_SUCCESS`.  

If the controller is not connected, the function returns `ERROR_DEVICE_NOT_CONNECTED`.  

If the function fails, it returns an error code defined in WinError.h.  
  
<a id="remarksSection"></a> 

## Remarks

This function supports the original Xbox 360 controller, which has only two haptic feedback motors. To support the additional feedback motors in the Xbox One controller, call [XInputSetStateEx](xinputsetstateex.md).  

For more information, see [The XInputOnGameInput wrapper](../../../../input/porting/input-porting-xinput.md#xinputWrapperSection). 

<a id="requirementsSection"></a> 

## Requirements  
  
**Header:** XInputOnGameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a> 

## See also  

[Porting from XInput to GameInput](../../../../input/porting/input-porting-xinput.md)  
[XInputOnGameInput](../xinputongameinput_members.md)  
  