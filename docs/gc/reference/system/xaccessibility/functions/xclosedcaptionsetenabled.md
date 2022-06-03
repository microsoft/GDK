---
author: M-Stahl
title: XClosedCaptionSetEnabled
description: Sets a Boolean value that indicates if closed captions are enabled or disabled.
kindex: XClosedCaptionSetEnabled
ms.author: v-sahain
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XClosedCaptionSetEnabled  

Sets a Boolean value that indicates if closed captions are enabled or disabled.

## Syntax  
  
```cpp
HRESULT XClosedCaptionSetEnabled(  
         bool enabled  
)  
```  
  
### Parameters  
  
*enabled* &nbsp;&nbsp;\_In\_  
Type: bool  

A Boolean value indicating if closed captions are enabled or disabled.  

### Return value

Type: HRESULT
  
HRESULT if successful.  Otherwise, returns an error code.  
For a list of error codes, see [Error Codes](../../../errorcodes.md).

## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
For this function to be successful, closed captions must be enabled.
The user must enable the closed captions feature in the UI of the Game title.

To flag closed captions as enabled, set *enabled* to true or 1.
To flag closed captions as disabled, set *enabled* to false or 0.

The following example demonstrates how to enable closed captions programmatically.  
  
```cpp
//The user must first enable closed captions in the UI of the Game title. Afterwards, the game title can set the Boolean flag.
if (SUCCEEDED(XClosedCaptionsSetEnabled(true)))
{
    // Closed captions successfully enabled
}
```

## Requirements

**Header:** XAccessibility.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[XAccessibility](../xaccessibility_members.md)
  
[XClosedCaptionProperties](../structs/xclosedcaptionproperties.md)

[XClosedCaptionGetProperties](xclosedcaptiongetproperties.md)