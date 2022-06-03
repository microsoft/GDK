---
author: M-Stahl
title: XHighContrastMode
description: Specifies the high contrast mode style of the closed caption text.
kindex: XHighContrastMode
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XHighContrastMode  

Specifies the high contrast mode style of the closed caption text.

## Syntax  
  
```cpp
enum class XHighContrastMode  : uint32_t  
{  
    Off = 0,  
    Dark = 1,  
    Light = 2,  
    Other = 3,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Off | Closed caption text does not use high contrast mode.|  
| Dark | Closed caption text uses dark color high contrast mode. |  
| Light | Closed caption text uses light color high contrast mode. |  
| Other | Closed caption text uses a custom high contrast mode. |  
  
## Remarks

You can retrieve the current high contrast mode by calling the [XHighContrastGetMode](../functions/xhighcontrastgetmode.md) function.
The [XHighContrastGetMode](../functions/xhighcontrastgetmode.md) function returns a **XHighContrastMode** enumeration.
For more information about high contrast mode, visit [High-contrast mode](/windows/win32/w8cookbook/high-contrast-mode).

## Requirements  
  
**Header:** XAccessibility.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[XAccessibility](../xaccessibility_members.md)
  
[XHighContrastGetMode](../functions/xhighcontrastgetmode.md)

[High-contrast mode](/windows/win32/w8cookbook/high-contrast-mode)