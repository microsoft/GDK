---
author: M-Stahl
title: XInputGetState
description: Retrieves the current state of the specified controller.
kindex: XInputGetState
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# XInputGetState  

Retrieves the current state of the specified controller.  

<a id="syntaxSection"></a> 

## Syntax  
  
```cpp
DWORD XInputGetState(  
         DWORD dwUserIndex,  
         XINPUT_STATE * pState  
)  
```  
  
<a id="parametersSection"></a> 

### Parameters  
  
*dwUserIndex* &nbsp;&nbsp;\_In\_  
Type: DWORD  
  
Index of the gamer associated with the device; a value in the range of 0 to `XUSER_MAX_COUNT – 1`.  
  
*pState* &nbsp;&nbsp;\_Out\_  
Type: [XINPUT_STATE](../structs/xinput_state.md)\*  
  
Pointer to an [XINPUT_STATE](../structs/xinput_state.md) object that receives the current state of the controller.  
  
<a id="retvalSection"></a> 

### Return value  

Type: DWORD
  
If the function succeeds, it returns `ERROR_SUCCESS`.  

If the controller is not connected, the function returns `ERROR_DEVICE_NOT_CONNECTED`.  

If the function fails, it returns an error code defined in WinError.h.  
  
<a id="remarksSection"></a> 

## Remarks  

This function reports the left and right triggers separately. In DirectInput, the two triggers shared the same axis. 

The [XInputGetStateWithToken](xinputgetstatewithtoken.md) function is similar but allows the caller to supply a D3DX frame pipeline token to associate a specific input reading with a graphics frame for later analysis in PIX. 

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
  