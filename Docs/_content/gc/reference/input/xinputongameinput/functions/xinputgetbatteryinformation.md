---
author: M-Stahl
title: XInputGetBatteryInformation
description: Retrieves the battery type and charge status of a wireless controller.
kindex: XInputGetBatteryInformation
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# XInputGetBatteryInformation  

Retrieves the battery type and charge status of a wireless controller.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
DWORD XInputGetBatteryInformation(  
         DWORD dwUserIndex,  
         BYTE devType,  
         XINPUT_BATTERY_INFORMATION* pBatteryInformation  
)  
```  
  
<a id="parametersSection"></a>

### Parameters  
  
*dwUserIndex* &nbsp;&nbsp;\_In\_  
Type: DWORD  
  
Index of the gamer associated with the device; a value in the range of 0 to `XUSER_MAX_COUNT – 1`.  
  
*devType* &nbsp;&nbsp;\_In\_  
Type: BYTE  
  
The type of device associated with *dwUserIndex* to query. Must be `BATTERY_DEVTYPE_GAMEPAD` or `BATTERY_DEVTYPE_HEADSET`.  
  
*pBatteryInformation* &nbsp;&nbsp;\_Out\_  
Type: [XINPUT_BATTERY_INFORMATION](../structs/xinput_battery_information.md)\*  
  
Pointer to an [XINPUT_BATTERY_INFORMATION](../structs/xinput_battery_information.md) object that receives the battery information.  
  
<a id="retvalSection"></a>

### Return value

Type: DWORD
  
If the function succeeds, the return value is `ERROR_SUCCESS`.  

<a id="remarksSection"></a>

## Remarks  

The values returned in *pBatteryInformation* specify the type of battery and the state of its charge. The charge state is valid only for a device that has a known battery type. 

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
  