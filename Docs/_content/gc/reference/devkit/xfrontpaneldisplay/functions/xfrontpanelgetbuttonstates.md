---
author: M-Stahl
title: XFrontPanelGetButtonStates
description: Gets the states of the front panel buttons.
kindex: XFrontPanelGetButtonStates
ms.author: scotmi
ms.topic: reference
edited: 10/14/2020
security: public
---

# XFrontPanelGetButtonStates  

Gets the states of the front panel buttons.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
HRESULT XFrontPanelGetButtonStates(  
         XFrontPanelButton* buttons  
)  
```  

<a id="parametersSection"></a>

### Parameters  

*buttons* &nbsp;&nbsp;\_Out\_  
Type: [XFrontPanelButton](../enums/xfrontpanelbutton.md)\*  

Pointer to a value indicating the current states of the front panel buttons.  

<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

Returns `S_OK` if successful; otherwise, returns an error code.  

<a id="remarksSection"></a>

## Remarks  

The front panel of the Xbox One X dev kit includes five programmable buttons and a directional button that works like a 5-way D-pad.  

![Front panel display of the Xbox One X](../../../../../../resources/gamecore/secure/images/en-us/front_panel_display_small.png)  

The *buttons* parameter points to a [XFrontPanelButton](../enums/xfrontpanelbutton.md) object that indicates the state of each button.  

For more information, see [Xbox One X: Using the front panel display (NDA topic)](../../../../tools-console/usinggsdk/scorpio-frontpanel.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** xfrontpaneldisplay.h  

**Library:** xfrontpaneldisplay.lib  

**Supported platforms:** Xbox One family consoles and Xbox Series consoles  

<a id="seealsoSection"></a>

## See also  

[XFrontPanelDisplay](../xfrontpaneldisplay_members.md)  
  