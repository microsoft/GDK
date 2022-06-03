---
author: M-Stahl
title: XClosedCaptionFontStyle
description: Specifies the font style of the closed caption text.
kindex: XClosedCaptionFontStyle
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XClosedCaptionFontStyle  

Specifies the font style of the closed caption text.

## Syntax  
  
```cpp
enum class XClosedCaptionFontStyle  : uint32_t  
{  
    Default = 0,  
    MonospacedWithSerifs = 1,  
    ProportionalWithSerifs = 2,  
    MonospacedWithoutSerifs = 3,  
    ProportionalWithoutSerifs = 4,  
    Casual = 5,  
    Cursive = 6,  
    SmallCapitals = 7  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Default | Closed captioned text uses the default font style. |  
| MonospacedWithSerifs | Closed captioned text uses the monospaced font style with serifs. |  
| ProportionalWithSerifs | Closed captioned text uses the proportional spaced font style with serifs.  |  
| MonospacedWithoutSerifs | Closed captioned text uses the monospaced font style without serifs. |  
| ProportionalWithoutSerifs | Closed captioned text uses the proportional font style without serifs. |  
| Casual | Closed captioned text uses the casual font style with serifs. |  
| Cursive | Closed captioned text uses the cursive font style. |  
| SmallCapitals | Closed captioned text uses the small capitals font style. |  
  
## Remarks

You can retrieve the current closed caption properties by calling the [XClosedCaptionGetProperties](../functions/xclosedcaptiongetproperties.md) function.
The [XClosedCaptionGetProperties](../functions/xclosedcaptiongetproperties.md) function takes a pointer to a [XClosedCaptionProperties](../structs/xclosedcaptionproperties.md) structure as an argument.
The **XClosedCaptionFontStyle** enumeration is a member of the [XClosedCaptionProperties](../structs/xclosedcaptionproperties.md) structure.

## Requirements  
  
**Header:** XAccessibility.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[XAccessibility](../xaccessibility_members.md)

[XClosedCaptionGetProperties](../functions/xclosedcaptiongetproperties.md)

[XClosedCaptionProperties](../structs/xclosedcaptionproperties.md)