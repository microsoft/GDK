---
author: M-Stahl
title: XInputGetDeviceId
description: Retrieves the device ID for the specified controller.
kindex: XInputGetDeviceId
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# XInputGetDeviceId  

Retrieves the device ID for the specified controller. 

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
DWORD XInputGetDeviceId(  
         DWORD dwUserIndex,  
         APP_LOCAL_DEVICE_ID * pDeviceId  
)  
```  
  
<a id="parametersSection"></a>

### Parameters  
  
*dwUserIndex* &nbsp;&nbsp;\_In\_  
Type: DWORD  
  
Index of the gamer associated with the device; a value in the range of 0 to `XUSER_MAX_COUNT – 1`.  
  
*pDeviceId* &nbsp;&nbsp;\_Out\_  
Type: APP_LOCAL_DEVICE_ID\*  
  
ID of the device at the specified user index. 
  
<a id="retvalSection"></a>

### Return value 

Type: DWORD
  
If the function successfully retrieves the device ID, it returns `ERROR_SUCCESS`. 

If the controller is not connected, the function returns `ERROR_DEVICE_NOT_CONNECTED`.

If the function fails, it returns a Win32 error code. 
  
<a id="remarksSection"></a>

## Remarks

An application-local device ID uniquely identifies a device, even across restarts of the title or the system. For more information, see [Device IDs](../../../../input/overviews/input-devices.md#deviceIdsSection). 

For more information about using XInputOnGameInput, see [The XInputOnGameInput wrapper](../../../../input/porting/input-porting-xinput.md#xinputWrapperSection). 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** XInputOnGameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also 

[Porting from XInput to GameInput](../../../../input/porting/input-porting-xinput.md)  
[XInputOnGameInput](../xinputongameinput_members.md)  
  