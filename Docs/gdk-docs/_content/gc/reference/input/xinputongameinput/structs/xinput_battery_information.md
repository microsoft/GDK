---
author: M-Stahl
title: XINPUT_BATTERY_INFORMATION
description: Describes the type and charge state of a battery.
kindex: XINPUT_BATTERY_INFORMATION
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# XINPUT_BATTERY_INFORMATION  

Describes the type and charge state of a battery.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct XINPUT_BATTERY_INFORMATION {  
    BYTE BatteryType;  
    BYTE BatteryLevel;  
} XINPUT_BATTERY_INFORMATION  
```
  
<a id="membersSection"></a>

### Members  
  
*BatteryType*  
Type: BYTE  
  
The type of the battery, as one of the following values:

| Value | Description |
| --- | --- |
| BATTERY_TYPE_DISCONNECTED | The device is not connected. | 
| BATTERY_TYPE_WIRED | The device is wired and does not have a battery. | 
| BATTERY_TYPE_ALKALINE | The device has an alkaline battery. | 
| BATTERY_TYPE_NIMH | The device has a nickel–metal hydride (NiMH) battery. | 
| BATTERY_TYPE_UNKNOWN | The device has an unknown battery type. | 
  
*BatteryLevel*  
Type: BYTE  
  
The charge state of the battery, compared to its full-charge capacity, as one of the following values:  
  
| Value | Description |
| --- | --- |
| BATTERY_LEVEL_EMPTY | Charge is between zero and 10%. | 
| BATTERY_LEVEL_LOW | Charge is between 10% and 40%. | 
| BATTERY_LEVEL_MEDIUM | Charge is between 40% and 70%. |  
| BATTERY_LEVEL_FULL | Charge is between 70% and 100%. | 

<a id="remarksSection"></a>

## Remarks

The *BatteryLevel* value is valid only for a device that has a known battery type. 

This structure is used by the [XInputGetBatteryInformation](../functions/xinputgetbatteryinformation.md) function. 

For more information, see [The XInputOnGameInput wrapper](../../../../input/porting/input-porting-xinput.md#xinputWrapperSection). 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** XInputOnGameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also 

[Porting from XInput to GameInput](../../../../input/porting/input-porting-xinput.md)  
[XInputOnGameInput](../xinputongameinput_members.md)  
  