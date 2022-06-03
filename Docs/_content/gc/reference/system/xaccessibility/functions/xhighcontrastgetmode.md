---
author: M-Stahl
title: XHighContrastGetMode
description: Returns the current high contrast mode.
kindex: XHighContrastGetMode
ms.author: v-sahain
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XHighContrastGetMode  

Returns the current high contrast mode.  

## Syntax  
  
```cpp
HRESULT XHighContrastGetMode(  
         XHighContrastMode* mode  
)  
```  
  
### Parameters  
  
*mode* &nbsp;&nbsp;\_Out\_  
Type: [XHighContrastMode*](../enums/xhighcontrastmode.md)  

The current [high contrast mode style](../enums/xhighcontrastmode.md).

### Return value

Type: HRESULT
  
HRESULT success if *mode* contains the current [XHighContrastMode](../enums/xhighcontrastmode.md). Otherwise, returns an error code.  
For a list of error codes, see [Error Codes](../../../errorcodes.md).

## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
For this function to be successful, closed captions must be enabled.
The user must enable the closed captions feature in the UI of the Game title.
If the user enabled closed captions, your Game title can flag the status of closed captions by calling [XClosedCaptionSetEnabled](xclosedcaptionsetenabled.md).
  
The following example demonstrates how to return the current high contrast mode.  
  
```cpp
XHighContrastMode highContrastMode;
if (SUCCEEDED(XHighContrastGetMode(&highContrastMode))
{
    // The game title can now use the enumeration result to set colors and other visual
    // options for the user interface.
}
```
  
## Requirements  
  
**Header:** XAccessibility.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XAccessibility](../xaccessibility_members.md)

[XHighContrastMode](../enums/xhighcontrastmode.md)
  
[XClosedCaptionSetEnabled](xclosedcaptionsetenabled.md)