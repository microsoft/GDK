---
author: M-Stahl
title: XFrontPanelButton
description: Enumerates front panel buttons, including the directional button (D-pad).
kindex: XFrontPanelButton
ms.author: scotmi
ms.topic: reference
edited: 10/14/2020
security: public
---

# XFrontPanelButton  

Enumerates front panel buttons, including the directional button (D-pad).  

<a id="syntaxSection"></a>

## Syntax  

```cpp
enum class XFrontPanelButton : uint32_t  
{  
    None = 0x0,  
    Button1 = 0x1,  
    Button2 = 0x2,  
    Button3 = 0x4,  
    Button4 = 0x8,  
    Button5 = 0x10,  
    DPadLeft = 0x20,  
    DPadRight = 0x40,  
    DPadUp = 0x80,  
    DPadDown = 0x100,  
    DPadSelect = 0x200,  
}  
```  

<a id="constantsSection"></a>

## Constants  

| Constant | Description |  
| --- | --- |  
| None | No button pressed. |  
| Button1 | Button 1 pressed. |    
| Button2 | Button 2 pressed. |  
| Button3 | Button 3 pressed. |  
| Button4 | Button 4 pressed. |  
| Button5 | Button 5 pressed. |  
| DPadLeft | D-pad pressed left. |  
| DPadRight | D-pad pressed right. |  
| DPadUp | D-pad pressed up. |  
| DPadDown | D-pad pressed down. |  
| DPadSelect | Center of D-pad pressed. |  

<a id="remarksSection"></a>

## Remarks  

The front panel of the Xbox One X dev kit includes five programmable buttons and a directional button that works like a 5-way D-pad.  

![Front panel display of the Xbox One X](../../../../../../resources/gamecore/secure/images/en-us/front_panel_display_small.png)  

This enumeration is used in the [XFrontPanelGetButtonStates](../functions/xfrontpanelgetbuttonstates.md) function. You can combine values to read multiple buttons simultaneously.  

For more information, see [Xbox One X: Using the front panel display (NDA topic)](../../../../tools-console/usinggsdk/scorpio-frontpanel.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** xfrontpaneldisplay.h  

**Supported platforms:** Xbox One family consoles and Xbox Series consoles  

<a id="seealsoSection"></a>

## See also  

[XFrontPanelDisplay](../xfrontpaneldisplay_members.md)  
  