---
author: M-Stahl
title: XColor
description: Specifies an ARGB color.
kindex: XColor
ms.author: v-denken
ms.topic: reference
edited: 06/10/2019
quality: good
security: public
applies-to: pc-gdk
---

# XColor  
Specifies an ARGB color.  

## Syntax  
  
```cpp
typedef struct XColor {  
    union  
    {  
        struct  
        {  
            uint8_t A;  
            uint8_t R;  
            uint8_t G;  
            uint8_t B;  
        };  
        uint32_t Value;  
    };  
} XColor  
```
  
### Members  
  
*A*  
Type: uint8_t  
  
The alpha channel's value.  
  
*R*  
Type: uint8_t  
  
The red channel's value.  
  
*G*  
Type: uint8_t  
  
The green channel's value.  
  
*B*  
Type: uint8_t  
  
The blue channel's value.  
  
*Value*  
Type: uint32_t  
  
The ARGB value.  
  
## Remarks  
  
The **XColor** structure is used by other Gaming Runtime features to represent ARGB values. For example, the [XClosedCaptionProperties](../../xaccessibility/structs/xclosedcaptionproperties.md) structure uses **XColor** to represent background, font, and window colors for closed captions. 
  
An ARGB value is represented as a 32-bit number: 8 bits each for alpha, red, green, and blue channels. Each of the four channels is an 8-bit number from 0 through 255; 0 represents no intensity, and 255 represents full intensity. The *Value* member represents the 32-bit ARGB value, and the *A*, *R*, *G*, and *B* members represent, respectively, the 8-bit alpha, red, green, and blue channels' portions of that value. 
  
## Requirements  
  
**Header:** XGameRuntimeTypes.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XAccessibility](../../xaccessibility/xaccessibility_members.md)  
[XClosedCaptionProperties](../../xaccessibility/structs/xclosedcaptionproperties.md)  
[XGameRuntimeTypes](../xgameruntimetypes_members.md)  
  