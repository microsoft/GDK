---
author: M-Stahl
title: GameInputRawDeviceReportItemFlags
description: Enumerates types of raw device-report items.
kindex: GameInputRawDeviceReportItemFlags
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputRawDeviceReportItemFlags  

Enumerates types of raw device-report items. 

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputRawDeviceReportItemFlags  
{  
    GameInputDefaultItem = 0x00000000,  
    GameInputConstantItem = 0x00000001,  
    GameInputArrayItem = 0x00000002,  
    GameInputRelativeItem = 0x00000004,  
    GameInputWraparoundItem = 0x00000008,  
    GameInputNonlinearItem = 0x00000010,  
    GameInputStableItem = 0x00000020,  
    GameInputNullableItem = 0x00000040,  
    GameInputVolatileItem = 0x00000080,  
    GameInputBufferedItem = 0x00000100  
} GameInputRawDeviceReportItemFlags  
```  
  
<a id="constantsSection"></a>

## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputDefaultItem | Item type is default. |  
| GameInputConstantItem | Item is a constant. |  
| GameInputArrayItem | Item is an array. |  
| GameInputRelativeItem | Item type is relative. |  
| GameInputWraparoundItem | Item type is wrap-around. |  
| GameInputNonlinearItem | Item type is non-linear. |  
| GameInputStableItem | Item type is stable. |  
| GameInputNullableItem | Item type is nullable. |  
| GameInputVolatileItem | Item type is volatile. |  
| GameInputBufferedItem | Ttem type is buffered. |  
  
<a id="remarksSection"></a>

## Remarks  

Values can be combined. 

This enumeration is used in the [GameInputRawDeviceReportItemInfo](../structs/gameinputrawdevicereportiteminfo.md) structure. 

For intermediate and advanced use cases of the GameInput API, see [Advanced GameInput](../../../../input/advanced/input-advanced-topics.md) topics. 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  