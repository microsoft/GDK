---
author: M-Stahl
title: GetBatteryState
description: Gets the battery state on a device.
kindex: GetBatteryState
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
security: public
---

# IGameInputDevice::GetBatteryState  
> [!NOTE]
> This function is not yet implemented.

Gets the battery state on a device.  

## Syntax  
  
```cpp
void GetBatteryState(  
         GameInputBatteryState* state  
)  
```  
  
### Parameters  
  
*state* &nbsp;&nbsp;\_Out\_  
Type: [GameInputBatteryState*](../../../structs/gameinputbatterystate.md)  
  
Information about the device battery state like charging rate, remaining charge, and charge capacity.  

  
### Return value  

Type: void

Returns the [GameInputBatteryState*](../../../structs/gameinputbatterystate.md) structure and populates with zero values and unknown status.  

## Remarks  

The ``GetBatteryState`` method returns information about the current state of the device’s battery.  This information is defined by the ``GameInputBatteryStatus`` enumeration and ``GameInputBatteryState`` structure.

Refer to the following code example to see the constants that define this enumeration and the members that define this structure.

```cpp
typedef enum GameInputBatteryStatus
{
    GameInputBatteryUnknown     = -1,
    GameInputBatteryNotPresent  =  0,
    GameInputBatteryDischarging =  1,
    GameInputBatteryIdle        =  2,
    GameInputBatteryCharging    =  3
} GameInputBatteryStatus;

typedef struct GameInputBatteryState
{
    float chargeRate;
    float remainingCapacity;
    float fullChargeCapacity;
    GameInputBatteryStatus status;
} GameInputBatteryState;
```

All floating-point values are expressed in terms of watt hours. If the device does not have a battery, or if the current battery state cannot be determined, all floating-point values are zero. Otherwise, all floating-point values are positive numbers, except for the ``chargeRate`` member that is a negative value when the battery is discharging.

Accurate watt hour values are provided whenever they can be retrieved from the device. However, not all devices provide this information, or may only provide it for some of the values. Any floating-point values that don’t have accurate watt hour readings available are assigned default values as follows:

* The ``chargeRate`` is set to +/- 10% of the ``fullChargeCapacity`` value when charging/discharging, or zero if the charging state is "idle".

* The ``remainingCapacity`` is set to the value of ``fullChargeCapacity``, and it is multiplied by the remaining charge percentage.

* The ``fullChargeCapacity`` is set to a value of 1 watt hour.


| Granular Charge Level | Mapped Percentage Value |  
| --- | --- | 
| Full | 100% |
| Medium | 70% |
| Low | 40% |
| Critical | 10% |


 For the best user experience when displaying battery levels, any UI code that displays “bars” of battery power should align with the values specified in the preceding table. For more information, see [Input practices for games](/windows/uwp/gaming/input-practices-for-games).

If the ``GetBatteryState`` method is called when the device has been disconnected from the system, all floating-point values are set to zero and the status member is set to ``GameInputBatteryUnknown`` (even if valid values were available when the device was connected). This method retrieves data stored in local memory and is safe to call from any context.


## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md)  
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInputDevice](../igameinputdevice.md)  
  
  