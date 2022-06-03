---
author: M-Stahl
title: GameInputKeyboardInfo
description: Describes the properties of a keyboard.
kindex: GameInputKeyboardInfo
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputKeyboardInfo  

Describes the properties of a keyboard. 

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputKeyboardInfo {  
    GameInputKeyboardKind kind;  
    GameInputKeyboardLayout layout;  
    uint32_t keyCount;  
    uint32_t functionKeyCount;  
    uint32_t maxSimultaneousKeys;  
    uint32_t platformType;  
    uint32_t platformSubtype;  
    GameInputString const * nativeLanguage;  
} GameInputKeyboardInfo  
```
  
<a id="membersSection"></a>

### Members  
  
*kind*  
Type: [GameInputKeyboardKind](../enums/gameinputkeyboardkind.md)  
  
Layout of the keyboard by keyboard type.  
  
*layout*  
Type: [GameInputKeyboardLayout](../enums/gameinputkeyboardlayout.md)  
  
Layout of the keyboard by country or region and language. 
  
*keyCount*  
Type: uint32_t  
  
Number of keys on the keyboard.  
  
*functionKeyCount*  
Type: uint32_t  
  
Number of function keys on the keyboard.  
  
*maxSimultaneousKeys*  
Type: uint32_t  
  
Maximum number of simultaneous keystrokes that can be registered.  
  
*platformType*  
Type: uint32_t  
  
Keyboard platform type.  
  
*platformSubtype*  
Type: uint32_t  
  
Keyboard platform subtype.  
  
*nativeLanguage*  
Type: [GameInputString](gameinputstring.md) const *  
  
Native language of the keyboard.  
  
<a id="remarksSection"></a>

## Remarks  

This structure is used in the [GameInputDeviceInfo](gameinputdeviceinfo.md) structure. `GameInputDeviceInfo` is used by the [IGameInputDevice::GetDeviceInfo](../interfaces/igameinputdevice/methods/igameinputdevice_getdeviceinfo.md) method. 

For more information, see [GameInput devices](../../../../input/overviews/input-devices.md). 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  