---
author: joannaleecy
title: XblMultiplayerEventArgsTournamentRegistrationStateChanged
description: Retrieves additional information for XblMultiplayerEventType::TournamentRegistrationStateChanged events.
kindex: XblMultiplayerEventArgsTournamentRegistrationStateChanged
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerEventArgsTournamentRegistrationStateChanged  

Retrieves additional information for XblMultiplayerEventType::TournamentRegistrationStateChanged events.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerEventArgsTournamentRegistrationStateChanged(  
         XblMultiplayerEventArgsHandle argsHandle,  
         XblTournamentRegistrationState* registrationState,  
         XblTournamentRegistrationReason* registrationReason  
)  
```  
  
### Parameters  
  
*argsHandle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerEventArgsHandle](../handles/xblmultiplayereventargshandle.md)  
  
The event args handle from the XblMultiplayerEvent.  
  
*registrationState* &nbsp;&nbsp;\_Out\_opt\_  
Type: [XblTournamentRegistrationState*](../../multiplayer_c/enums/xbltournamentregistrationstate.md)  
  
A caller allocated struct that passes back the tournament team registration state.  
  
*registrationReason* &nbsp;&nbsp;\_Out\_opt\_  
Type: [XblTournamentRegistrationReason*](../../multiplayer_c/enums/xbltournamentregistrationreason.md)  
  
A caller allocated struct that passes back the tournament team registration reason for the certain registration states.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
  
  