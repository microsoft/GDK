---
author: M-Stahl
title: XFrontPanelLight
description: Enumerates front panel lights.
kindex: XFrontPanelLight
ms.author: scotmi
ms.topic: reference
edited: 10/14/2020
security: public
---

# XFrontPanelLight  

Enumerates front panel lights.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
enum class XFrontPanelLight : uint32_t  
{  
    None = 0x0,  
    Light1 = 0x1,  
    Light2 = 0x2,  
    Light3 = 0x4,  
    Light4 = 0x8,  
    Light5 = 0x10,  
}  
```  

<a id="constantsSection"></a>

## Constants  

| Constant | Description |  
| --- | --- |  
| None | No lights on. |  
| Light1 | Light 1 on. |    
| Light2 | Light 2 on. |  
| Light3 | Light 3 on. |  
| Light4 | Light 4 on. |  
| Light5 | Light 5 on. |  

<a id="remarksSection"></a>

## Remarks  

The front panel of the Xbox One X dev kit includes five lights that correspond to the five programmable buttons.  

![Front panel display of the Xbox One X](../../../../../../resources/gamecore/secure/images/en-us/front_panel_display_small.png)  

This enumeration is used in the [XFrontPanelGetLightStates](../functions/xfrontpanelgetlightstates.md) and [XFrontPanelSetLightStates](../functions/xfrontpanelsetlightstates.md) functions. You can combine values to address multiple lights simultaneously.  

For more information, see [Xbox One X: Using the front panel display (NDA topic)](../../../../tools-console/usinggsdk/scorpio-frontpanel.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** xfrontpaneldisplay.h  

**Supported platforms:** Xbox One family consoles and Xbox Series consoles  

<a id="seealsoSection"></a>

## See also  

[XFrontPanelDisplay](../xfrontpaneldisplay_members.md)  
  