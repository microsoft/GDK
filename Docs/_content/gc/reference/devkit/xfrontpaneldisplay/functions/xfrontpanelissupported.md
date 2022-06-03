---
author: M-Stahl
title: XFrontPanelIsSupported
description: Indicates whether this dev kit has a front panel display.
kindex: XFrontPanelIsSupported
ms.author: scotmi
ms.topic: reference
edited: 10/14/2020
security: public
---

# XFrontPanelIsSupported  

Indicates whether this dev kit has a front panel display.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
bool XFrontPanelIsSupported(  
)  
```  

<a id="parametersSection"></a>

### Parameters  

This function has no parameters.  

<a id="retvalSection"></a>

### Return value  

Type: bool  

Returns true if this dev kit has a front panel display.  

<a id="remarksSection"></a>

## Remarks  

If the dev kit has a front panel display, you can use [XFrontPanelGetScreenDimensions](xfrontpanelgetscreendimensions.md) to determine the dimensions of the display.  

To update the front panel display, use [XFrontPanelPresentBuffer](xfrontpanelpresentbuffer.md).  

For more information, see [Xbox One X: Using the front panel display (NDA topic)](../../../../tools-console/usinggsdk/scorpio-frontpanel.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** xfrontpaneldisplay.h  

**Library:** xfrontpaneldisplay.lib  

**Supported platforms:** Xbox One family consoles and Xbox Series consoles  

<a id="seealsoSection"></a>

## See also  

[XFrontPanelDisplay](../xfrontpaneldisplay_members.md)  
  