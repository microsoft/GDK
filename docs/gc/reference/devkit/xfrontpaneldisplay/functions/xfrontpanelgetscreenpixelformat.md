---
author: M-Stahl
title: XFrontPanelGetScreenPixelFormat
description: Gets the pixel format of the front panel display.
kindex: XFrontPanelGetScreenPixelFormat
ms.author: scotmi
ms.topic: reference
edited: 10/14/2020
security: public
---

# XFrontPanelGetScreenPixelFormat  

Gets the pixel format of the front panel display.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
HRESULT XFrontPanelGetScreenPixelFormat(  
         DXGI_FORMAT* pixelFormat  
)  
```  

<a id="parametersSection"></a>

### Parameters  

*pixelFormat* &nbsp;&nbsp;\_Out\_  
Type: DXGI_FORMAT\*  

Pointer to a value indicating the pixel format.  

<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

Returns `S_OK` if successful; otherwise, returns an error code.  

<a id="remarksSection"></a>

## Remarks  

The pixel format returned by this method is `DXGI_FORMAT_R8_UNORM`. The display supports only 4 bits per pixel; the lower four bits aren't used.  

Use the pixel format to construct the buffer for the [XFrontPanelPresentBuffer](xfrontpanelpresentbuffer.md) function.  

For more information, see [Xbox One X: Using the front panel display (NDA topic)](../../../../tools-console/usinggsdk/scorpio-frontpanel.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** xfrontpaneldisplay.h  

**Library:** xfrontpaneldisplay.lib  

**Supported platforms:** Xbox One family consoles and Xbox Series consoles  

<a id="seealsoSection"></a>

## See also  

[XFrontPanelDisplay](../xfrontpaneldisplay_members.md)  
  