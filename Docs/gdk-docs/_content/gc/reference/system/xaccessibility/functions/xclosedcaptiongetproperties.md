---
author: M-Stahl
title: XClosedCaptionGetProperties
description: Returns the properties of the current closed caption.
kindex: XClosedCaptionGetProperties
ms.author: v-sahain
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XClosedCaptionGetProperties  

Returns the properties of the current closed caption.

## Syntax  
  
```cpp
HRESULT XClosedCaptionGetProperties(  
         XClosedCaptionProperties* properties  
)  
```  
  
### Parameters  
  
*properties* &nbsp;&nbsp;\_Out\_  
Type: [XClosedCaptionProperties*](../structs/xclosedcaptionproperties.md)  
  
When the function returns, *properties* contains the current closed caption properties.  

### Return value

Type: HRESULT
  
HRESULT if closed captions are enabled and *properties* contains the current [XClosedCaptionProperties](../structs/xclosedcaptionproperties.md). Otherwise, returns an error code.  
For a list of error codes, see [Error Codes](../../../errorcodes.md).

## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
For this function to be successful, closed captions must be enabled.
The user must enable the closed captions feature in the UI of the Game title.
If the user enabled closed captions, your Game title can flag the status of closed captions by calling [XClosedCaptionSetEnabled](xclosedcaptionsetenabled.md).

The following example demonstrates how to return the closed caption properties.

```cpp
XClosedCaptionProperties ccProperties;
if (SUCCEEDED(XClosedCaptionGetProperties(&ccProperties))
{
    // The game title can now access color and font settings in the ccProperties structure.
}
```

## Requirements  
  
**Header:** XAccessibility.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[XAccessibility](../xaccessibility_members.md)

[XClosedCaptionProperties](../structs/xclosedcaptionproperties.md)  

[XClosedCaptionSetEnabled](xclosedcaptionsetenabled.md)