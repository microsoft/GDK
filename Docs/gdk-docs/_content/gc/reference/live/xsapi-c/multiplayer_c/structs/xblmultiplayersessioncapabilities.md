---
author: joannaleecy
title: XblMultiplayerSessionCapabilities
description: Represents the capabilities of a Multiplayer service session.
kindex: XblMultiplayerSessionCapabilities
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerSessionCapabilities  

Represents the capabilities of a Multiplayer service session.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerSessionCapabilities {  
    bool Connectivity;  
    bool Team;  
    bool Arbitration;  
    bool SuppressPresenceActivityCheck;  
    bool Gameplay;  
    bool Large;  
    bool ConnectionRequiredForActiveMembers;  
    bool UserAuthorizationStyle;  
    bool Crossplay;  
    bool Searchable;  
    bool HasOwners;  
} XblMultiplayerSessionCapabilities  
```
  
### Members  
  
*Connectivity*  
Type: bool  
  
Indicates whether a session can enable metrics and session members can set `secureDeviceAddress`. If false, the session can't enable any metrics, and session members can't set `secureDeviceAddress`.
  
*Team*  
Type: bool  
  
If true, team capability is set on the session for a tournament. DEPRECATED. This member will be removed in a future release.
  
*Arbitration*  
Type: bool  
  
If true, arbitration capability is set on the session for a tournament. DEPRECATED. This member will be removed in a future release.
  
*SuppressPresenceActivityCheck*  
Type: bool  
  
If false (the default value), active users are required to remain online playing the title. If they don't, they are demoted to inactive status. Set this flag to true to enable session members to stay active indefinitely.
  
*Gameplay*  
Type: bool  
  
Indicates whether the session represents actual gameplay rather than time in setup or a menu, such a lobby or during matchmaking. If true, the session is in gameplay mode.
  
*Large*  
Type: bool  
  
If true, the session can host 101 to 1000 users, which affects other session features. If false, the session can host 1 to 100 users. For more information, see the [Session size](../../../../../live/features/multiplayer/mpsd/concepts/live-mpsd-details.md#session-size) section of [Multiplayer Session advanced topics](../../../../../live/features/multiplayer/mpsd/concepts/live-mpsd-details.md).
  
*ConnectionRequiredForActiveMembers*  
Type: bool  
  
If true, a connection is required for a member to be marked as active. To enable session notifications and detect disconnections, this member must be set to true. For more information, see the [Subscribe for MPSD session change notifications](../../../../../live/features/multiplayer/mpsd/how-to/live-mpsd-how-tos.md#sfmscn) section of [Multiplayer tasks](../../../../../live/features/multiplayer/mpsd/how-to/live-mpsd-how-tos.md).
  
*UserAuthorizationStyle*  
Type: bool  
  
If true, the session supports calls from platforms without strong title identity. This capability can't be set on large sessions.
  
*Crossplay*  
Type: bool  
  
If true, the session supports crossplay between Windows PC and Xbox.
  
*Searchable*  
Type: bool  
  
If true, the session can be linked to a search handle for searching.
  
*HasOwners*  
Type: bool  
  
If true, the session has owners. For a session to be searchable when `UserAuthorizationStyle` is true, the session must have owners.
  
## Remarks  
  
Session capabilities are optional Boolean values that are set in the session template. If no capabilities are needed, an empty `SessionCapabilities` object should be in the template to prevent capabilities from being specified at session creation, unless the title requires dynamic session capabilities.<br /><br /> For more information, see the [Session capabilities](../../../../../live/features/multiplayer/mpsd/concepts/live-mpsd-details.md#session-capabilities) section of [Multiplayer Session advanced topics](../../../../../live/features/multiplayer/mpsd/concepts/live-mpsd-details.md).
  
## Member of
  
[XblMultiplayerSessionConstants](xblmultiplayersessionconstants.md)
  
## Argument of
  
[XblMultiplayerSessionConstantsSetCapabilities](../functions/xblmultiplayersessionconstantssetcapabilities.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  