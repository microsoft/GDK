---
author: M-Stahl
title: XClosedCaptionFontEdgeAttribute
description: Specifies the edge style of the closed caption text.
kindex: XClosedCaptionFontEdgeAttribute
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XClosedCaptionFontEdgeAttribute  

Specifies the edge style of the closed caption text.  

## Syntax  
  
```cpp
enum class XClosedCaptionFontEdgeAttribute  : uint32_t  
{  
    Default = 0,  
    NoEdgeAttribute = 1,  
    RaisedEdges = 2,  
    DepressedEdges = 3,  
    UniformedEdges = 4,  
    DropShadowedEdges = 5  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Default | Default style edges/shadows appear around closed caption text. |  
| NoEdgeAttribute | No edges/shadows appear around closed caption text.  |  
| RaisedEdges | Raised edges/shadows appear around closed caption text.  |  
| DepressedEdges | Depressed edges/shadows appear around closed caption text.  |  
| UniformedEdges | Uniform edges/shadows appear around closed caption text.  |  
| DropShadowedEdges | Drop shadowed edges/shadows appear around closed caption text.  |  
  
## Remarks

You can retrieve the current closed caption properties by calling the [XClosedCaptionGetProperties](../functions/xclosedcaptiongetproperties.md) function.
The [XClosedCaptionGetProperties](../functions/xclosedcaptiongetproperties.md) function takes a pointer to a  [XClosedCaptionProperties](../structs/xclosedcaptionproperties.md) structure as an argument.
The **XClosedCaptionFontEdgeAttribute** enumeration is a member of the [XClosedCaptionProperties](../structs/xclosedcaptionproperties.md) structure.

## Requirements  
  
**Header:** XAccessibility.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[XAccessibility](../xaccessibility_members.md)
  
[XClosedCaptionGetProperties](../functions/xclosedcaptiongetproperties.md)

[XClosedCaptionProperties](../structs/xclosedcaptionproperties.md)