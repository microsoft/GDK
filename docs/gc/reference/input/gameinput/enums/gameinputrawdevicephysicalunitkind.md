---
author: M-Stahl
title: GameInputRawDevicePhysicalUnitKind
description: Enumerates physical units associated with an input of an input device.
kindex: GameInputRawDevicePhysicalUnitKind
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputRawDevicePhysicalUnitKind  

Enumerates physical units associated with an input of an input device.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputRawDevicePhysicalUnitKind  
{  
    GameInputPhysicalUnitUnknown = -1,  
    GameInputPhysicalUnitNone = 0,  
    GameInputPhysicalUnitTime = 1,  
    GameInputPhysicalUnitFrequency = 2,  
    GameInputPhysicalUnitLength = 3,  
    GameInputPhysicalUnitVelocity = 4,  
    GameInputPhysicalUnitAcceleration = 5,  
    GameInputPhysicalUnitMass = 6,  
    GameInputPhysicalUnitMomentum = 7,  
    GameInputPhysicalUnitForce = 8,  
    GameInputPhysicalUnitPressure = 9,  
    GameInputPhysicalUnitAngle = 10,  
    GameInputPhysicalUnitAngularVelocity = 11,  
    GameInputPhysicalUnitAngularAcceleration = 12,  
    GameInputPhysicalUnitAngularMass = 13,  
    GameInputPhysicalUnitAngularMomentum = 14,  
    GameInputPhysicalUnitAngularTorque = 15,  
    GameInputPhysicalUnitElectricCurrent = 16,  
    GameInputPhysicalUnitElectricCharge = 17,  
    GameInputPhysicalUnitElectricPotential = 18,  
    GameInputPhysicalUnitEnergy = 19,  
    GameInputPhysicalUnitPower = 20,  
    GameInputPhysicalUnitTemperature = 21,  
    GameInputPhysicalUnitLuminousIntensity = 22,  
    GameInputPhysicalUnitLuminousFlux = 23,  
    GameInputPhysicalUnitIlluminance = 24  
} GameInputRawDevicePhysicalUnitKind  
```  
  
<a id="constantsSection"></a>

## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputPhysicalUnitUnknown | The physical unit type is not known. See the *rawPhysicalUnits* and *rawPhysicalUnitsExponent* members of the [GameInputRawDeviceReportItemInfo](../structs/gameinputrawdevicereportiteminfo.md) structure for the raw HID unit values reported by the device. |  
| GameInputPhysicalUnitNone | No physical units are associated with the input. |  
| GameInputPhysicalUnitTime | The physical unit measures time in seconds (s). |  
| GameInputPhysicalUnitFrequency | The physical unit measures frequency in hertz (Hz). |  
| GameInputPhysicalUnitLength | The physical unit measures length in meters (m). |  
| GameInputPhysicalUnitVelocity | The physical unit measures velocity in meters per second (m/s). |  
| GameInputPhysicalUnitAcceleration | The physical unit measures acceleration in meters per second squared (m/s²). |  
| GameInputPhysicalUnitMass | The physical unit measures mass in kilograms (kg). |  
| GameInputPhysicalUnitMomentum | The physical unit measures momentum in newton-seconds (N·s). |  
| GameInputPhysicalUnitForce | The physical unit measures force in newtons (N). |  
| GameInputPhysicalUnitPressure | The physical unit measures pressure in pascals (Pa). |  
| GameInputPhysicalUnitAngle | The physical unit measures angle in radians (rad). |  
| GameInputPhysicalUnitAngularVelocity | The physical unit measures angular velocity in radians per second (rad/s). |  
| GameInputPhysicalUnitAngularAcceleration | The physical unit measures angular acceleration in radians per second squared (rad/s²). |  
| GameInputPhysicalUnitAngularMass | The physical unit measures angular mass in kilogram meters squared (kg·m²). |  
| GameInputPhysicalUnitAngularMomentum | The physical unit measures angular momentum in kilogram meters squared per second (kg·m²/s). |  
| GameInputPhysicalUnitAngularTorque | The physical unit measures angular torque in newton-meters (N·m). |  
| GameInputPhysicalUnitElectricCurrent | The physical unit measures electrical current in amperes (A). |  
| GameInputPhysicalUnitElectricCharge | The physical unit measures electrical charge in coulombs (C). |  
| GameInputPhysicalUnitElectricPotential | The physical unit measures electrical potential in volts (V). |  
| GameInputPhysicalUnitEnergy | The physical unit measures energy in joules (J). |  
| GameInputPhysicalUnitPower | The physical unit measures power in watts (W). |  
| GameInputPhysicalUnitTemperature | The physical unit measures temperature in degrees Kelvin (K). |  
| GameInputPhysicalUnitLuminousIntensity | The physical unit measures luminous intensity in candelas (cd). |  
| GameInputPhysicalUnitLuminousFlux | The physical unit measures luminous flux in lumens (lm). |  
| GameInputPhysicalUnitIlluminance | The physical unit measures illuminance in lux (lx). |  
  
<a id="remarksSection"></a>

## Remarks

Physical properties of an input are measured in standard SI units. 

Most input devices do not report physical units. An example of a device that does report physical units might be a thermometer that declares one of its inputs to be an axis value measured in temperature units.  

This enumeration is used in the [GameInputRawDeviceReportItemInfo](../structs/gameinputrawdevicereportiteminfo.md) structure. 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  