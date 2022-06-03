---
author: M-Stahl
title: GameInputRawDeviceItemCollectionInfo
description: Describes a collection of raw device items.
kindex: GameInputRawDeviceItemCollectionInfo
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputRawDeviceItemCollectionInfo  

Describes a collection of raw device items. 

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputRawDeviceItemCollectionInfo {  
    GameInputRawDeviceItemCollectionKind kind;  
    uint32_t childCount;  
    uint32_t siblingCount;  
    uint32_t usageCount;  
    GameInputUsage const * usages;  
    GameInputRawDeviceItemCollectionInfo const * parent;  
    GameInputRawDeviceItemCollectionInfo const * firstSibling;  
    GameInputRawDeviceItemCollectionInfo const * previousSibling;  
    GameInputRawDeviceItemCollectionInfo const * nextSibling;  
    GameInputRawDeviceItemCollectionInfo const * lastSibling;  
    GameInputRawDeviceItemCollectionInfo const * firstChild;  
    GameInputRawDeviceItemCollectionInfo const * lastChild;  
} GameInputRawDeviceItemCollectionInfo  
```
  
<a id="membersSection"></a>

### Members  
  
*kind*  
Type: [GameInputRawDeviceItemCollectionKind](../enums/gameinputrawdeviceitemcollectionkind.md)  
  
The type of the collection. 
  
*childCount*  
Type: uint32_t  
  
The number of children of this collection.  
  
*siblingCount*  
Type: uint32_t  
  
The number of siblings of this collection.  
  
*usageCount*  
Type: uint32_t  
  
The number of usages of this collection.  
  
*usages*  
Type: [GameInputUsage](gameinputusage.md) const *  
  
A pointer to a list of usages.  
  
*parent*  
Type: [GameInputRawDeviceItemCollectionInfo](gameinputrawdeviceitemcollectioninfo.md) const *  
  
A pointer to the parent of this collection.  
  
*firstSibling*  
Type: [GameInputRawDeviceItemCollectionInfo](gameinputrawdeviceitemcollectioninfo.md) const *  
  
A pointer to the first sibling of this collection.  
  
*previousSibling*  
Type: [GameInputRawDeviceItemCollectionInfo](gameinputrawdeviceitemcollectioninfo.md) const *  
  
A pointer to the previous sibling of this collection.  
  
*nextSibling*  
Type: [GameInputRawDeviceItemCollectionInfo](gameinputrawdeviceitemcollectioninfo.md) const *  
  
A pointer to the next sibling of this collection.  
  
*lastSibling*  
Type: [GameInputRawDeviceItemCollectionInfo](gameinputrawdeviceitemcollectioninfo.md) const *  
  
A pointer to the last sibling of this collection.  
  
*firstChild*  
Type: [GameInputRawDeviceItemCollectionInfo](gameinputrawdeviceitemcollectioninfo.md) const *  
  
A pointer to the first child of this collection.  
  
*lastChild*  
Type: [GameInputRawDeviceItemCollectionInfo](gameinputrawdeviceitemcollectioninfo.md) const *  
  
A pointer to the last child of this collection.  
  
<a id="remarksSection"></a>

## Remarks  

This structure is used in the [GameInputRawDeviceReportItemInfo](gameinputrawdevicereportiteminfo.md) structure. 

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
  