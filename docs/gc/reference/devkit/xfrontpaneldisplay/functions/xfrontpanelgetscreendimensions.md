---
author: M-Stahl
title: XFrontPanelGetScreenDimensions
description: Gets the dimensions of the front panel display.
kindex: XFrontPanelGetScreenDimensions
ms.author: scotmi
ms.topic: reference
edited: 10/14/2020
security: public
---

# XFrontPanelGetScreenDimensions  

Gets the dimensions of the front panel display.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
HRESULT XFrontPanelGetScreenDimensions(  
         uint32_t* height,  
         uint32_t* width  
)  
```  

<a id="parametersSection"></a>

### Parameters  

*height* &nbsp;&nbsp;\_Out\_  
Type: uint32_t\*  

Pointer to a value indicating the height, in pixels, of the front panel display.  

*width* &nbsp;&nbsp;\_Out\_  
Type: uint32_t\*  

Pointer to a value indicating the width, in pixels, of the front panel display.  

<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

Returns `S_OK` if successful; otherwise, returns an error code.  

<a id="remarksSection"></a>

## Remarks  

For current dev kits, the dimensions returned are always 256 pixels wide by 64 pixels high.  

To determine whether this dev kit has a front panel display, use [XFrontPanelIsSupported](xfrontpanelissupported.md).  

For more information, see [Xbox One X: Using the front panel display (NDA topic)](../../../../tools-console/usinggsdk/scorpio-frontpanel.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** xfrontpaneldisplay.h  

**Library:** xfrontpaneldisplay.lib  

**Supported platforms:** Xbox One family consoles and Xbox Series consoles  

<a id="seealsoSection"></a>

## See also  

[XFrontPanelDisplay](../xfrontpaneldisplay_members.md)  
  