---
author: joannaleecy
title: XblTournamentReference
description: Represents a reference to a tournament reference. DEPRECATED. This structure will be removed in a future release.
kindex: XblTournamentReference
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblTournamentReference  

Represents a reference to a tournament reference. DEPRECATED. This structure will be removed in a future release.  

## Syntax  
  
```cpp
typedef struct XblTournamentReference {  
    char DefinitionName[XBL_TOURNAMENT_REFERENCE_DEFINITION_NAME_MAX_LENGTH];  
    char TournamentId[XBL_GUID_LENGTH];  
    char Organizer[XBL_TOURNAMENT_REFERENCE_ORGANIZER_LENGTH];  
    char Scid[XBL_SCID_LENGTH];  
} XblTournamentReference  
```
  
### Members  
  
*DefinitionName*  
Type: char[XBL_TOURNAMENT_REFERENCE_DEFINITION_NAME_MAX_LENGTH]  
  
The definition name of the tournament.
  
*TournamentId*  
Type: char[XBL_GUID_LENGTH]  
  
The tournament ID specific to the tournament.
  
*Organizer*  
Type: char[XBL_TOURNAMENT_REFERENCE_ORGANIZER_LENGTH]  
  
The name of the tournament organizer.
  
*Scid*  
Type: char[XBL_SCID_LENGTH]  
  
The service configuration ID specific to the tournament.
  
## Member of
  
[XblMultiplayerTournamentsServer](xblmultiplayertournamentsserver.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  