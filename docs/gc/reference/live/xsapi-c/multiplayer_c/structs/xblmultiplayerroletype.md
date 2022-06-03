---
author: joannaleecy
title: XblMultiplayerRoleType
description: Represents a category of roles for a multiplayer session.
kindex: XblMultiplayerRoleType
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerRoleType  

Represents a category of roles for a multiplayer session.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerRoleType {  
    const char* Name;  
    bool OwnerManaged;  
    XblMutableRoleSettings MutableRoleSettings;  
    struct XblMultiplayerRole* Roles;  
    size_t RoleCount;  
} XblMultiplayerRoleType  
```
  
### Members  
  
*Name*  
Type: const char*  
  
Name of the role type.
  
*OwnerManaged*  
Type: bool  
  
If true, only the owner of the session can assign this role to members.
  
*MutableRoleSettings*  
Type: [XblMutableRoleSettings](../enums/xblmutablerolesettings.md)  
  
The settings (for roles in this role type) that can be modified throughout the life of the session. Exclude role settings to lock them.
  
*Roles*  
Type: XblMultiplayerRole*  
  
A collection of roles for this role type.
  
*RoleCount*  
Type: size_t  
  
The number of roles in the `Roles` array.
  
## Remarks  
  
For more information, see [Multiplayer roles](../../../../../live/features/multiplayer/concepts/live-multiplayer-roles.md).
  
## Member of
  
[XblMultiplayerRole](xblmultiplayerrole.md)
  
## Argument of
  
[XblMultiplayerSessionRoleTypes](../functions/xblmultiplayersessionroletypes.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  