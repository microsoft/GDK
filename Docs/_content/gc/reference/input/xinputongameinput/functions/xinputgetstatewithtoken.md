---
author: M-Stahl
title: XInputGetStateWithToken
description: Retrieves the current state of the specified controller and associates it with a D3DX frame pipeline token.
kindex: XInputGetStateWithToken
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
quality: good
security: public
---

# XInputGetStateWithToken  

Retrieves the current state of the specified controller and associates it with a D3DX frame pipeline token.  

<a id="syntaxSection"></a> 

## Syntax  
  
```cpp
DWORD XInputGetStateWithToken(  
         DWORD dwUserIndex,  
         UINT64 framePipelineToken,  
         XINPUT_STATE * pState  
)  
```  
  
<a id="parametersSection"></a> 

### Parameters  
  
*dwUserIndex* &nbsp;&nbsp;\_In\_  
Type: DWORD  
  
Index of the gamer associated with the device; a value in the range of 0 to `XUSER_MAX_COUNT – 1`.  
  
*framePipelineToken* &nbsp;&nbsp;\_In\_  
Type: UINT64  
  
D3DX frame pipeline token.  
  
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

This function is similar to [XInputGetState](xinputgetstate.md), but it associates a specific input reading with a graphics frame for later analysis. 
> [!NOTE]
> As of the May Preview release, the behavior of `XInputGetStateWithToken` is identical to that of `XInputGetState`, because the underlying GameInput code is not fully implemented. 

 By supplying the frame pipeline token, you can later correlate input API calls with specific graphics frames in the PIX software. 

<a id="requirementsSection"></a> 

## Requirements  
  
**Header:** XInputOnGameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a> 

## See also  

[Porting from XInput to GameInput](../../../../input/porting/input-porting-xinput.md)  
[XInputOnGameInput](../xinputongameinput_members.md)  
  