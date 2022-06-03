---
author: M-Stahl
title: GameInputString
description: Describes a string that contains information about an input device.
kindex: GameInputString
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputString  

Describes a string that contains information about an input device.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputString {  
    uint32_t sizeInBytes;  
    uint32_t codePointCount;  
    char const * data;  
} GameInputString  
```
  
<a id="membersSection"></a>

### Members  
  
*sizeInBytes*  
  
Type: uint32_t  
  
Size of the string in bytes (not in characters).  
  
*codePointCount*  
Type: uint32_t  
  
Count of Unicode code points in the string.  
  
*data*  
Type: char const \*  
  
Pointer to the string, which is stored as a UTF-8 encoded Unicode string.  
  
<a id="remarksSection"></a>
  
## Remarks  

The *sizeInBytes* member enables fast raw memory copies of the string data without having to know the size of each code point. 

This structure is used in the following structures:

- [GameInputDeviceInfo](gameinputdeviceinfo.md) 
- [GameInputKeyboardInfo](gameinputkeyboardinfo.md) 
- [GameInputRawDeviceReportItemInfo](gameinputrawdevicereportiteminfo.md) 

To obtain information about an input device, use the [GetDeviceInfo](../interfaces/igameinputdevice/methods/igameinputdevice_getdeviceinfo.md) method. 

For more information, see [GameInput devices](../../../../input/overviews/input-devices.md). 

<a id="requirementsSection"></a>
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Input API Overview](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  