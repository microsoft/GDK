---
author: joannaleecy
title: XblSocialNotificationType
description: Defines values used to identify the type of social notification.
kindex: XblSocialNotificationType
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblSocialNotificationType  

Defines values used to identify the type of social notification.    

## Syntax  
  
```cpp
enum class XblSocialNotificationType  : uint32_t  
{  
    Unknown,  
    Added,  
    Changed,  
    Removed  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | Unknown. |  
| Added | User(s) were added. |  
| Changed | User(s) data changed. |  
| Removed | User(s) were removed. |  
  
## Member of
  
[XblSocialRelationshipChangeEventArgs](../structs/xblsocialrelationshipchangeeventargs.md)
  
## Requirements  
  
**Header:** social_c.h
  
## See also  
[social_c](../social_c_members.md)  
  
  