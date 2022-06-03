---
author: M-Stahl
title: GameInputRawDeviceItemCollectionKind
description: Enumerates types of collections of raw device items.
kindex: GameInputRawDeviceItemCollectionKind
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputRawDeviceItemCollectionKind  

Enumerates types of collections of raw device items. 

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputRawDeviceItemCollectionKind  
{  
    GameInputUnknownItemCollection = -1,  
    GameInputPhysicalItemCollection = 0,  
    GameInputApplicationItemCollection = 1,  
    GameInputLogicalItemCollection = 2,  
    GameInputReportItemCollection = 3,  
    GameInputNamedArrayItemCollection = 4,  
    GameInputUsageSwitchItemCollection = 5,  
    GameInputUsageModifierItemCollection = 6  
} GameInputRawDeviceItemCollectionKind  
```  
  
<a id="constantsSection"></a>

## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputUnknownItemCollection | Collection type is unknown. |  
| GameInputPhysicalItemCollection | Collection type is physical. |  
| GameInputApplicationItemCollection | Collection type is application. |  
| GameInputLogicalItemCollection | Collection type is logical. |  
| GameInputReportItemCollection | Collection type is report. |  
| GameInputNamedArrayItemCollection | Collection type is array. |  
| GameInputUsageSwitchItemCollection | Collection type is switch. |  
| GameInputUsageModifierItemCollection | Collection type is modifier. |  
  
<a id="remarksSection"></a>

## Remarks  

This enumeration is used in the [GameInputRawDeviceItemCollectionInfo](../structs/gameinputrawdeviceitemcollectioninfo.md) structure. 

For more information, see the [GetDeviceInfo](../interfaces/igameinputdevice/methods/igameinputdevice_getdeviceinfo.md) method of [IGameInputDevice](../interfaces/igameinputdevice/igameinputdevice.md). 

For intermediate and advanced use cases of the GameInput API, see [Advanced GameInput](../../../../input/advanced/input-advanced-topics.md) topics. 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  