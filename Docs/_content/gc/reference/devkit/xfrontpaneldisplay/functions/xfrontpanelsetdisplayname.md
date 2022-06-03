---
author: M-Stahl
title: XFrontPanelSetDisplayName
description: Sets the name of the front panel display.
kindex: XFrontPanelSetDisplayName
ms.author: scotmi
ms.topic: reference
edited: 10/14/2020
security: public
---

# XFrontPanelSetDisplayName  

Sets the name of the front panel display.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
HRESULT XFrontPanelSetDisplayName(  
         const char* displayName  
)  
```  

<a id="parametersSection"></a>

### Parameters  

*displayName* &nbsp;&nbsp;\_In\_  
Type: char\*  

The name of the display.  

<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

Returns `S_OK` if successful; otherwise, returns an error code.  

<a id="remarksSection"></a>

## Remarks  

Currently, *displayName* is not used by the front panel display.  

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
  