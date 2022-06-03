---
author: joannaleecy
title: XblMultiplayerSessionChangeTypes
description: Defines values that indicate change types for a multiplayer session.
kindex: XblMultiplayerSessionChangeTypes
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerSessionChangeTypes  

Defines values that indicate change types for a multiplayer session.    

## Syntax  
  
```cpp
enum class XblMultiplayerSessionChangeTypes  : uint32_t  
{  
    None = 0x0000,  
    Everything = 0x0001,  
    HostDeviceTokenChange = 0x0002,  
    InitializationStateChange = 0x0004,  
    MatchmakingStatusChange = 0x0008,  
    MemberListChange = 0x0010,  
    MemberStatusChange = 0x0020,  
    SessionJoinabilityChange = 0x0040,  
    CustomPropertyChange = 0x0080,  
    MemberCustomPropertyChange = 0x0100,  
    TournamentPropertyChange = 0x0200,  
    ArbitrationPropertyChange = 0x0400  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | None. |  
| Everything | Changes to anything in the session. |  
| HostDeviceTokenChange | Changes to the host device token. |  
| InitializationStateChange | Changes to the stage of initialization. |  
| MatchmakingStatusChange | Changes to the matchmaking status, such as match found or match expired. |  
| MemberListChange | A member joined the session. |  
| MemberStatusChange | A member left the session. |  
| SessionJoinabilityChange | Changes to the joinability ([XblMultiplayerJoinability](../../multiplayer_manager_c/enums/xblmultiplayerjoinability.md)) of the session. |  
| CustomPropertyChange | Changes in the custom properties of the session. |  
| MemberCustomPropertyChange | Changes in the custom properties of any of the members. |  
| TournamentPropertyChange | Changes in tournament server properties, such as next game, last game, or registration. DEPRECATED. This value will be removed in a future release. |  
| ArbitrationPropertyChange | Changes in arbitration server properties, such as game results. DEPRECATED. This value will be removed in a future release. |  
  
## Argument of
  
[XblMultiplayerSessionSetSessionChangeSubscription](../functions/xblmultiplayersessionsetsessionchangesubscription.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  