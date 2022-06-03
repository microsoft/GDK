---
author: M-Stahl
title: XFrontPanelPresentBuffer
description: Renders the specified buffer to the front panel display.
kindex: XFrontPanelPresentBuffer
ms.author: scotmi
ms.topic: reference
edited: 10/14/2020
security: public
---

# XFrontPanelPresentBuffer  

Renders the specified buffer to the front panel display.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
HRESULT XFrontPanelPresentBuffer(  
         uint32_t bufferSize,  
         const uint8_t* buffer  
)  
```  

<a id="parametersSection"></a>

### Parameters  

*bufferSize* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

Size of the buffer, in bytes.  

*buffer* &nbsp;&nbsp;\_In\_reads\_(bufferSize)  
Type: uint8_t\*  

Pointer to an array of pixels to render to the screen.  

<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

Returns `S_OK` if successful; otherwise, returns an error code.  

<a id="remarksSection"></a>

## Remarks  

Generally, call this function only when the front panel display needs to be updated. Calling it for every frame is needed only for animation.  

To get the pixel format to use in *buffer*, use [XFrontPanelGetScreenPixelFormat](xfrontpanelgetscreenpixelformat.md).  

To get the dimensions of the front panel display, use [XFrontPanelGetScreenDimensions](xfrontpanelgetscreendimensions.md).  

For more information, see [Xbox One X: Using the front panel display (NDA topic)](../../../../tools-console/usinggsdk/scorpio-frontpanel.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** xfrontpaneldisplay.h  

**Library:** xfrontpaneldisplay.lib  

**Supported platforms:** Xbox One family consoles and Xbox Series consoles  

<a id="seealsoSection"></a>

## See also  

[XFrontPanelDisplay](../xfrontpaneldisplay_members.md)  
  