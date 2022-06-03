---
author: M-Stahl
title: GameInputRawDeviceReportItemInfo
description: Information describing a Raw Device Report Item.
kindex: GameInputRawDeviceReportItemInfo
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# GameInputRawDeviceReportItemInfo  

Information describing a Raw Device Report Item.  

## Syntax  
  
```cpp
typedef struct GameInputRawDeviceReportItemInfo {  
    uint32_t bitOffset;  
    uint32_t bitSize;  
    int64_t logicalMin;  
    int64_t logicalMax;  
    double physicalMin;  
    double physicalMax;  
    GameInputRawDevicePhysicalUnitKind physicalUnits;  
    uint32_t rawPhysicalUnits;  
    int32_t rawPhysicalUnitsExponent;  
    GameInputRawDeviceReportItemFlags flags;  
    uint32_t usageCount;  
    GameInputUsage const * usages;  
    GameInputRawDeviceItemCollectionInfo const * collection;  
    GameInputString const * itemString;  
} GameInputRawDeviceReportItemInfo  
```
  
### Members  
  
*bitOffset*  
Type: uint32_t  
  
Location of the reported input data within the raw device message buffer.  
  
*bitSize*  
Type: uint32_t  
  
Size of the reported input data within the raw device message buffer.  
  
*logicalMin*  
Type: int64_t  
  
Low end of the possible values in the raw message buffer, depending on the possible states of the input.  
  
*logicalMax*  
Type: int64_t  
  
High end of the possible values in the raw message buffer, depending on the possible states of the input.  
  
*physicalMin*  
Type: double  
  
Minimum physical characteristic of an input usually 0, but could be negative for some devices which have opposite movement options.  
  
*physicalMax*  
Type: double  
  
Maximum physical characteristic of an input, like a representation of the maximum travel distance of a button or knob.  
  
*physicalUnits*  
Type: [GameInputRawDevicePhysicalUnitKind](../enums/gameinputrawdevicephysicalunitkind.md)  
  
List of physical descriptors.  
  
*rawPhysicalUnits*  
Type: uint32_t  
  
Raw physical units value from the HID descriptor, if available.
When possible this number is represented in a more friendly value in the **physicalUnits** attribute.

*rawPhysicalUnitsExponent*  
Type: int32_t  
  
Indicates the scale of the physical unit values. For example if the units are meters, an exponent of -3 would represent millimeters, and a value of -2 would represent centimeters.  
  
*flags*  
Type: [GameInputRawDeviceReportItemFlags](../enums/gameinputrawdevicereportitemflags.md)  
  
List of flags describing the report.  
  
*usageCount*  
Type: uint32_t  
  
Number of usages in the report info.  
  
*usages*  
Type: [GameInputUsage](gameinputusage.md) const *  
  
Usage indexes.  
  
*collection*  
Type: [GameInputRawDeviceItemCollectionInfo](gameinputrawdeviceitemcollectioninfo.md) const *  
  
Item Collection info.  
  
*itemString*  
Type: [GameInputString](gameinputstring.md) const *  
  
Game input string.  
  
## Remarks  

Member of [GameInputControllerAxisInfo](gameinputcontrolleraxisinfo.md).  
Member of [GameInputControllerButtonInfo](gameinputcontrollerbuttoninfo.md).  
Member of [GameInputControllerSwitchInfo](gameinputcontrollerswitchinfo.md).  
Member of [GameInputRawDeviceReportInfo](gameinputrawdevicereportinfo.md).  
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
[GameInputControllerAxisInfo](gameinputcontrolleraxisinfo.md)  
[GameInputControllerButtonInfo](gameinputcontrollerbuttoninfo.md)  
[GameInputControllerSwitchInfo](gameinputcontrollerswitchinfo.md)  
[GameInputRawDeviceReportInfo](gameinputrawdevicereportinfo.md)  