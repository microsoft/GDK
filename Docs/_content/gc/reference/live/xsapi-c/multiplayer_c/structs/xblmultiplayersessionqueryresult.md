---
author: joannaleecy
title: XblMultiplayerSessionQueryResult
description: Session information returned from a XblMultiplayerQuerySessionsAsync call.
kindex: XblMultiplayerSessionQueryResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerSessionQueryResult  

Session information returned from a XblMultiplayerQuerySessionsAsync call.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerSessionQueryResult {  
    time_t StartTime;  
    XblMultiplayerSessionReference SessionReference;  
    XblMultiplayerSessionStatus Status;  
    XblMultiplayerSessionVisibility Visibility;  
    bool IsMyTurn;  
    uint64_t Xuid;  
    uint32_t AcceptedMemberCount;  
    XblMultiplayerSessionRestriction JoinRestriction;  
} XblMultiplayerSessionQueryResult  
```
  
### Members  
  
*StartTime*  
Type: time_t  
  
The time that the session began.
  
*SessionReference*  
Type: [XblMultiplayerSessionReference](xblmultiplayersessionreference.md)  
  
Session reference for the session.
  
*Status*  
Type: [XblMultiplayerSessionStatus](../enums/xblmultiplayersessionstatus.md)  
  
The current status of the session.
  
*Visibility*  
Type: [XblMultiplayerSessionVisibility](../enums/xblmultiplayersessionvisibility.md)  
  
The visibility state of the session. Whether other users can see, or join, etc.
  
*IsMyTurn*  
Type: bool  
  
Indicates if it is my turn.
  
*Xuid*  
Type: uint64_t  
  
Xbox User ID of the member.
  
*AcceptedMemberCount*  
Type: uint32_t  
  
Approximate number of non-reserved members.
  
*JoinRestriction*  
Type: [XblMultiplayerSessionRestriction](../enums/xblmultiplayersessionrestriction.md)  
  
Join restriction for the session.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  