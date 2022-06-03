---
author: M-Stahl
title: XInputGetCapabilities
description: Retrieves the capabilities and features of a connected controller.
kindex: XInputGetCapabilities
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
security: public
---

# XInputGetCapabilities  
  
Retrieves the capabilities and features of a connected controller.  
  
<a id="syntaxSection"></a>

## Syntax  
  
```cpp
DWORD XInputGetCapabilities(  
         DWORD dwUserIndex,  
         DWORD dwFlags,  
         XINPUT_CAPABILITIES * pCapabilities  
)  
```  
  
<a id="parametersSection"></a>

### Parameters  
  
*dwUserIndex* &nbsp;&nbsp;\_In\_  
Type: DWORD  
  
Index of the gamer associated with the device; a value in the range of 0 to `XUSER_MAX_COUNT – 1`.  
  
*dwFlags* &nbsp;&nbsp;\_In\_  
Type: DWORD  
  
Input flags that identify the controller type. If this value is 0, the capabilities of all controllers connected to the system are returned. Currently, only `XINPUT_FLAG_GAMEPAD` is supported. 
  
*pCapabilities* &nbsp;&nbsp;\_Out\_  
Type: [XINPUT_CAPABILITIES](../structs/xinput_capabilities.md)\*  
  
Pointer to an [XINPUT_CAPABILITIES](../structs/xinput_capabilities.md) object that receives the controller capabilities.    
  
<a id="retvalSection"></a>

### Return value 

Type: DWORD
  
If the function succeeds, the return value is `ERROR_SUCCESS`.  

If the controller is not connected, the return value is `ERROR_DEVICE_NOT_CONNECTED`.  

If the function fails, the return value is an error code defined in WinError.h. The function does not use `SetLastError` to set the calling thread's last-error code.  
  
<a id="remarksSection"></a>

## Remarks
  > [!NOTE]
> The legacy XINPUT 9.1.0 version (included in Windows Vista and later) always returned a fixed set of capabilities regardless of attached device. 

For details about reported capabilities, see [XINPUT_CAPABILITIES](../structs/xinput_capabilities.md). 

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
  