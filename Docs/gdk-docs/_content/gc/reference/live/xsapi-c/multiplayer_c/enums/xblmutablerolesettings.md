---
author: joannaleecy
title: XblMutableRoleSettings
description: Defines values that indicate which multiplayer role settings are mutable.
kindex: XblMutableRoleSettings
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMutableRoleSettings  

Defines values that indicate which multiplayer role settings are mutable.    

## Syntax  
  
```cpp
enum class XblMutableRoleSettings  : uint32_t  
{  
    None = 0x0,  
    Max = 0x1,  
    Target = 0x2  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | None of the role settings are mutable. |  
| Max | Allows you to set the maximum number of players that can fill the role. |  
| Target | Allows you to set the target number of players that should fill the role. |  
  
## Remarks  
  
Only the session owner can modify role settings and only those that are set in `XblMultiplayerRoleType::MutableRoleSettings`. You can set `XblMutableRoleSettings` in the session template.
  
## Member of
  
[XblMultiplayerRoleType](../structs/xblmultiplayerroletype.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  