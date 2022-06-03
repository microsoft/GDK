---
author: M-Stahl
title: GameInputBatteryState
description: Describes the battery state of an input device.
kindex: GameInputBatteryState
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# GameInputBatteryState  

Describes the battery state of an input device.  

## Syntax  
  
```cpp
typedef struct GameInputBatteryState {  
    float chargeRate;  
    float maxChargeRate;  
    float remainingCapacity;  
    float fullChargeCapacity;  
    GameInputBatteryStatus status;  
} GameInputBatteryState  
```
  
### Members  
  
*chargeRate*  
Type: float  
  
Watt hour value of charge rate of device. If the device does not provide an estimate the chargeRate is set to +/- 10% of the fullChargeCapacity, or zero if the charging state is "idle".  
  
*maxChargeRate*  
Type: float  


Watt hour value of the maximum rate at which the battery may be charged without damage.  


*remainingCapacity*  
Type: float  
  
Watt hour value of the remaining charge in the input device battery. If the device does not provide an estimate, remainingCapacity is set to the value of fullChargeCapacity, multiplied by the remaining charge percentage.  
  
*fullChargeCapacity*  
Type: float  
  
Watt hour value of the full capacity of the input device batter. If the device does not provide an estimate, the fullChargeCapacity is set to 1 watt hour.
  
*status*  
Type: [GameInputBatteryStatus](../enums/gameinputbatterystatus.md)  
  
The state of the battery on an input device.  
  
## Remarks   

All floating-point values are expressed in terms of watt hours. If the device does not have a battery, or if the current battery state cannot be determined, all floating-point values are zero. Otherwise, all floating-point values are positive numbers, with the exception of the chargeRate member which is a negative value when the battery is discharging.  

Accurate watt hour values are provided whenever they can be retrieved from the device. However, not all devices provide this information, or may only provide it for some of the values. Any floating-point values that don’t have accurate watt hour readings available are assigned default values as follows:  

- *chargeRate* is set to +/- 10% of the *fullChargeCapacity* value when charging/discharging, or zero if the charging state is “idle” 
- *remainingCapacity* is set to the value of *fullChargeCapacity*, multiplied by the remaining charge percentage
- *fullChargeCapacity* is set to a value of 1 watt hour

Many game controllers have low-cost battery charging circuits that can only report granular charge levels, rather than a continuous charge percentage (this is true for all Xbox 360 and Xbox One game controllers). In that case, the granular values are mapped to charge percentages per the following table: 


|Granular Charge Level  |Mapped Percentage Value  |
|-----------------------|-------------------------|
|Full                   |100%                     |
|Medium                 |70%                      |
|Low                    |40%                      |
|Critical               |10%                      |

Any UI code that displays “bars” of battery power should align with the values in this table when displaying battery levels, for the best user experience.  

If the [IGameInputDevice::GetBatteryState](../interfaces/igameinputdevice/methods/igameinputdevice_getbatterystate.md) method is called when the device has been disconnected from the system, all floating-point values are set to zero and the status member is set to *GameInputBatteryUnknown* (even if valid values were available when the device was connected). This method simply retrieves data stored in local memory, and is safe to call from any context.  
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
[IGameInputDevice::GetBatteryState](../interfaces/igameinputdevice/methods/igameinputdevice_getbatterystate.md)  
  