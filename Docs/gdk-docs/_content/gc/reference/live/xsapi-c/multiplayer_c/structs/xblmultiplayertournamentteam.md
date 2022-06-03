---
author: joannaleecy
title: XblMultiplayerTournamentTeam
description: Represents a team in a tournament. DEPRECATED. This structure will be removed in a future release.
kindex: XblMultiplayerTournamentTeam
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerTournamentTeam  

Represents a team in a tournament. DEPRECATED. This structure will be removed in a future release.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerTournamentTeam {  
    const char* TeamId;  
    XblMultiplayerSessionReference TeamSessionReference;  
} XblMultiplayerTournamentTeam  
```
  
### Members  
  
*TeamId*  
Type: const char*  
  
ID of the team.
  
*TeamSessionReference*  
Type: [XblMultiplayerSessionReference](xblmultiplayersessionreference.md)  
  
Session reference of the session the team is in.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  