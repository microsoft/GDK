---
author: joannaleecy
title: XblPresenceTitleViewState
description: Defines values used to indicate the states of the screen view of presence information.
kindex: XblPresenceTitleViewState
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblPresenceTitleViewState  

Defines values used to indicate the states of the screen view of presence information.    

## Syntax  
  
```cpp
enum class XblPresenceTitleViewState  : uint32_t  
{  
    Unknown,  
    FullScreen,  
    Filled,  
    Snapped,  
    Background  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | Unknown view state. |  
| FullScreen | The title's view is using the full screen. |  
| Filled | The title's view is using part of the screen with another application snapped. |  
| Snapped | The title's view is snapped with another application using a part of the screen. |  
| Background | The title's running in the background and is not visible. |  
  
## Member of
  
[XblPresenceTitleRecord](../structs/xblpresencetitlerecord.md)
  
## Requirements  
  
**Header:** presence_c.h
  
## See also  
[presence_c](../presence_c_members.md)  
  
  