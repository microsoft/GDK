---
author: joannaleecy
title: XblPresenceDetailLevel
description: Defines values used to set the level of presence detail return from the service. Choosing proper detail level could help the performance of the API.
kindex: XblPresenceDetailLevel
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblPresenceDetailLevel  

Defines values used to set the level of presence detail return from the service. Choosing proper detail level could help the performance of the API.    

## Syntax  
  
```cpp
enum class XblPresenceDetailLevel  : uint32_t  
{  
    Default,  
    User,  
    Device,  
    Title,  
    All  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Default | Default detail level. |  
| User | User detail level. User presence info only, no device, title or rich presence info. |  
| Device | Device detail level. User and device presence info only, no title or rich presence info. |  
| Title | Title detail level. User, device and title presence info only, no rich presence info. |  
| All | All detail possible. User, device, title and rich presence info will be provided. |  
  
## Member of
  
[XblPresenceQueryFilters](../structs/xblpresencequeryfilters.md)
  
## Requirements  
  
**Header:** presence_c.h
  
## See also  
[presence_c](../presence_c_members.md)  
  
  