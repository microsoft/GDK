---
author: joannaleecy
title: XblMultiplayerManagerJoinGame
description: Joins a game session, using the globally unique session name.
kindex: XblMultiplayerManagerJoinGame
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerJoinGame  

Joins a game session, using the globally unique session name.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerJoinGame(  
         const char* sessionName,  
         const char* sessionTemplateName,  
         const uint64_t* xuids,  
         size_t xuidsCount  
)  
```  
  
### Parameters  
  
*sessionName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The globally unique session name for the game session.  
  
*sessionTemplateName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The name of the session template for the game session to be based on.  
  
*xuids* &nbsp;&nbsp;\_In\_opt\_  
Type: uint64_t*  
  
An array of Xbox User IDs (XUIDs) that represents the users you want to be part of the game.  
  
*xuidsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The number of elements in the array specified for `xuids`.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This function joins a list of Xbox users, specified in `xuids`, to the game session identified by the globally unique session name specified in `sessionName.` You can get the globally unique session name from the results of the title's third-party matchmaking, and you should call this function for all clients that need to join the game. <br />The result of this function is delivered as a multiplayer event with an event type set to `XblMultiplayerEventType::JoinGameCompleted`. You can call [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) to retrieve multiplayer events.  <br />When attempting to join a game session, the service returns `HTTP_E_STATUS_BAD_REQUEST` if the server is full.  <br />After joining, you can set the properties for the game session by calling [XblMultiplayerManagerGameSessionSetProperties](xblmultiplayermanagergamesessionsetproperties.md) or [XblMultiplayerManagerGameSessionSetSynchronizedProperties](xblmultiplayermanagergamesessionsetsynchronizedproperties.md), or you can set the host for the game session by calling [XblMultiplayerManagerGameSessionSetSynchronizedHost](xblmultiplayermanagergamesessionsetsynchronizedhost.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
  
  