---
author: joannaleecy
title: XblPresenceUserState
description: Defines values used to indicate the state of the user with regard to the presence service.
kindex: XblPresenceUserState
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblPresenceUserState  

Defines values used to indicate the state of the user with regard to the presence service.    

## Syntax  
  
```cpp
enum class XblPresenceUserState  : uint32_t  
{  
    Unknown,  
    Online,  
    Away,  
    Offline  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | The state is unknown. |  
| Online | User is signed in to Xbox Live and active in a title. |  
| Away | User is signed-in to Xbox Live, but inactive in all titles. |  
| Offline | User is not signed in to Xbox Live. |  
  
## Argument of
  
[XblPresenceRecordGetUserState](../functions/xblpresencerecordgetuserstate.md)
  
## Requirements  
  
**Header:** presence_c.h
  
## See also  
[presence_c](../presence_c_members.md)  
  
  