---
author: M-Stahl
title: XFrontPanelGetLightStates
description: Gets the states of the front panel lights.
kindex: XFrontPanelGetLightStates
ms.author: scotmi
ms.topic: reference
edited: 10/14/2020
security: public
---

# XFrontPanelGetLightStates  

Get the states of the front panel lights.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
HRESULT XFrontPanelGetLightStates(  
         XFrontPanelLight* lights  
)  
```  

<a id="parametersSection"></a>

### Parameters  

*lights* &nbsp;&nbsp;\_Out\_  
Type: [XFrontPanelLight](../enums/xfrontpanellight.md)\*  

Pointer to a value indicating the current states of the front panel lights.  

<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

Returns `S_OK` if successful; otherwise, returns an error code.  

<a id="remarksSection"></a>

## Remarks  

The front panel of the Xbox One X dev kit includes five lights that correspond to the five programmable buttons.  

![Front panel display of the Xbox One X](../../../../../../resources/gamecore/secure/images/en-us/front_panel_display_small.png)  

The *lights* parameter points to a [XFrontPanelLight](../enums/xfrontpanellight.md) object that indicates the state of each light.  

To set the states of the front panel lights, use [XFrontPanelSetLightStates](xfrontpanelsetlightstates.md).  

For more information, see [Xbox One X: Using the front panel display (NDA topic)](../../../../tools-console/usinggsdk/scorpio-frontpanel.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** xfrontpaneldisplay.h  

**Library:** xfrontpaneldisplay.lib  

**Supported platforms:** Xbox One family consoles and Xbox Series consoles  

<a id="seealsoSection"></a>

## See also  

[XFrontPanelDisplay](../xfrontpaneldisplay_members.md)  
  