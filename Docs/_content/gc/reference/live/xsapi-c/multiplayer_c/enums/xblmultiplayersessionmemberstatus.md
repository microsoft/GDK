---
author: joannaleecy
title: XblMultiplayerSessionMemberStatus
description: Defines values that indicate the status of a member of a session.
kindex: XblMultiplayerSessionMemberStatus
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerSessionMemberStatus  

Defines values that indicate the status of a member of a session.    

## Syntax  
  
```cpp
enum class XblMultiplayerSessionMemberStatus  : uint32_t  
{  
    Reserved,  
    Inactive,  
    Ready,  
    Active  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Reserved | The member is reserved for a specific Xbox user ID. The specified member must join the session to fill the reservation. If a reserved member doesn't join before the end of `JoinTimeout` (in the [XblMultiplayerMemberInitialization](../structs/xblmultiplayermemberinitialization.md) structure), the member is removed from the session. |  
| Inactive | The member is inactive in the current title. The member may be active in another title, as specified by `ActiveTitleId` in the [XblMultiplayerSessionMember](../structs/xblmultiplayersessionmember.md) structure. If an inactive member doesn't mark themselves as active before the end of `MemberInactiveTimeout` (in the [XblMultiplayerSessionConstants](../structs/xblmultiplayersessionconstants.md) structure), the member is removed from the session. |  
| Ready | When the shell launches the title to start a multiplayer game, the member is marked as ready. If a ready member doesn't mark themselves as active before the end of `MemberReadyTimeout` (in the [XblMultiplayerSessionConstants](../structs/xblmultiplayersessionconstants.md) structure), the member is marked as inactive. |  
| Active | The member is active in the current title. |  
  
## Member of
  
[XblMultiplayerManagerMember](../../multiplayer_manager_c/structs/xblmultiplayermanagermember.md)  
[XblMultiplayerSessionMember](../structs/xblmultiplayersessionmember.md)
  
## Argument of
  
[XblMultiplayerSessionCurrentUserSetStatus](../functions/xblmultiplayersessioncurrentusersetstatus.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  