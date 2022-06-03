---
author: M-Stahl
title: XClosedCaptionProperties
description: Describes the closed caption properties.
kindex: XClosedCaptionProperties
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XClosedCaptionProperties  

Describes the closed caption properties.  

## Syntax  
  
```cpp
typedef struct XClosedCaptionProperties {  
    XColor BackgroundColor;  
    XColor FontColor;  
    XColor WindowColor;  
    XClosedCaptionFontEdgeAttribute FontEdgeAttribute;  
    XClosedCaptionFontStyle FontStyle;  
    float FontScale;  
    bool Enabled;  
} XClosedCaptionProperties  
```
  
### Members  
  
*BackgroundColor*  
Type: XColor  
  
The color of the closed caption background.  
  
*FontColor*  
Type: XColor  
  
The color of the closed caption text font.  
  
*WindowColor*  
Type: XColor  
  
The color of the closed caption window.  
  
*FontEdgeAttribute*  
Type: [XClosedCaptionFontEdgeAttribute](../enums/xclosedcaptionfontedgeattribute.md)  
  
The font edge attribute of the closed caption text.  
  
*FontStyle*  
Type: [XClosedCaptionFontStyle](../enums/xclosedcaptionfontstyle.md)  
  
The font style of the closed caption text.  
  
*FontScale*  
Type: float  
  
The font scale of the closed caption text.  
  
*Enabled*  
Type: bool  
  
True if closed captioning is enabled, false otherwise.  

## Remarks

To retrieve the current closed caption properties, call the [XClosedCaptionGetProperties](../functions/xclosedcaptiongetproperties.md) function.
The [XClosedCaptionGetProperties](../functions/xclosedcaptiongetproperties.md) function takes  a pointer to a **XClosedCaptionProperties** structure as an argument.

The following example demonstrates how to retrieve the closed caption properties.

```cpp
XClosedCaptionProperties ccProperties;
if (SUCCEEDED(XClosedCaptionGetProperties(&ccProperties))
{
    // The game title can now access color and font settings in the ccProperties structure.
}
```
  
## Requirements  
  
**Header:** XAccessibility.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XAccessibility](../xaccessibility_members.md)
  
[XClosedCaptionFontEdgeAttribute](../enums/xclosedcaptionfontedgeattribute.md)

[XClosedCaptionFontStyle](../enums/xclosedcaptionfontstyle.md)

[XClosedCaptionGetProperties](../functions/xclosedcaptiongetproperties.md)