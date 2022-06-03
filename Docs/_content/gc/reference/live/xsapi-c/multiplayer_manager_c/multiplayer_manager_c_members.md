---
author: joannaleecy
title: multiplayer_manager_c (contents)
description: Multiplayer Manager C API
kindex: multiplayer_manager_c
ms.author: migreen
ms.topic: navigation
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# multiplayer_manager_c  



  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XblMultiplayerEventType](enums/xblmultiplayereventtype.md) | Defines values used to indicate event types for a multiplayer lobby or game. The XblMultiplayerEventArgsHandle can be used to get additional information about the event depending on the event type. |  
| [XblMultiplayerJoinability](enums/xblmultiplayerjoinability.md) | Defines values used to indicate who can join your lobby. |  
| [XblMultiplayerMatchStatus](enums/xblmultiplayermatchstatus.md) | Defines values used to indicate status for the matchmaking stages. |  
| [XblMultiplayerSessionType](enums/xblmultiplayersessiontype.md) | Defines values used to indicate types for multiplayer sessions. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XblMultiplayerEventArgsFindMatchCompleted](functions/xblmultiplayereventargsfindmatchcompleted.md) | Retrieves additional information for `XblMultiplayerEventType.FindMatchCompleted` multiplayer events. |  
| [XblMultiplayerEventArgsMember](functions/xblmultiplayereventargsmember.md) | Retrieves additional information for `XblMultiplayerEventType::HostChanged` and `XblMultiplayerEventType::MemberPropertyChanged` events. |  
| [XblMultiplayerEventArgsMembers](functions/xblmultiplayereventargsmembers.md) | Retrieves additional information for `XblMultiplayerEventType::MemberJoined` and `XblMultiplayerEventType::MemberLeft` events. |  
| [XblMultiplayerEventArgsMembersCount](functions/xblmultiplayereventargsmemberscount.md) | Retrieves additional information for `XblMultiplayerEventType::MemberJoined` and `XblMultiplayerEventType::MemberLeft` events. |  
| [XblMultiplayerEventArgsPerformQoSMeasurements](functions/xblmultiplayereventargsperformqosmeasurements.md) | Retrieves additional information for `XblMultiplayerEventType::PerformQosMeasurements` events. |  
| [XblMultiplayerEventArgsPropertiesJson](functions/xblmultiplayereventargspropertiesjson.md) | Retrieves additional information for `XblMultiplayerEventType::MemberPropertyChanged` and `XblMultiplayerEventType::SessionPropertyChanged` events. |  
| [XblMultiplayerEventArgsTournamentGameSessionReady](functions/xblmultiplayereventargstournamentgamesessionready.md) | Retrieves additional information for XblMultiplayerEventType::TournamentGameSessionReady events. |  
| [XblMultiplayerEventArgsTournamentRegistrationStateChanged](functions/xblmultiplayereventargstournamentregistrationstatechanged.md) | Retrieves additional information for XblMultiplayerEventType::TournamentRegistrationStateChanged events. |  
| [XblMultiplayerEventArgsXuid](functions/xblmultiplayereventargsxuid.md) | Retrieves additional information for `XblMultiplayerEventType::UserAdded`, `XblMultiplayerEventType::UserRemoved`, and `XblMultiplayerEventType::JoinLobbyCompleted` events. |  
| [XblMultiplayerManagerAutoFillMembersDuringMatchmaking](functions/xblmultiplayermanagerautofillmembersduringmatchmaking.md) | Indicates whether the game should auto-fill open slots during gameplay. |  
| [XblMultiplayerManagerCancelMatch](functions/xblmultiplayermanagercancelmatch.md) | Cancels the match request on the server, if one exists. |  
| [XblMultiplayerManagerDoWork](functions/xblmultiplayermanagerdowork.md) | Maintains game state updates between the title and Multiplayer Manager (MPM). |  
| [XblMultiplayerManagerEstimatedMatchWaitTime](functions/xblmultiplayermanagerestimatedmatchwaittime.md) | Retrieves the estimated wait time, in seconds, to complete a matchmaking request in progress. |  
| [XblMultiplayerManagerFindMatch](functions/xblmultiplayermanagerfindmatch.md) | Submits a matchmaking request to the server. |  
| [XblMultiplayerManagerGameSessionActive](functions/xblmultiplayermanagergamesessionactive.md) | Indicates whether there is an active game session. |  
| [XblMultiplayerManagerGameSessionConstants](functions/xblmultiplayermanagergamesessionconstants.md) | Retrieves the session constants associated with the game session. |  
| [XblMultiplayerManagerGameSessionCorrelationId](functions/xblmultiplayermanagergamesessioncorrelationid.md) | Retrieves the correlation handle for the game session. |  
| [XblMultiplayerManagerGameSessionHost](functions/xblmultiplayermanagergamesessionhost.md) | Retrieves member information for the host member in the game session. |  
| [XblMultiplayerManagerGameSessionIsHost](functions/xblmultiplayermanagergamesessionishost.md) | Indicates whether the specified user is the host for the game session. |  
| [XblMultiplayerManagerGameSessionMembers](functions/xblmultiplayermanagergamesessionmembers.md) | Retrieves member information for the members in the game session. |  
| [XblMultiplayerManagerGameSessionMembersCount](functions/xblmultiplayermanagergamesessionmemberscount.md) | Retrieves the number of members in the game session. |  
| [XblMultiplayerManagerGameSessionPropertiesJson](functions/xblmultiplayermanagergamesessionpropertiesjson.md) | Retrieves the custom properties for the game session, as a JSON string. |  
| [XblMultiplayerManagerGameSessionSessionReference](functions/xblmultiplayermanagergamesessionsessionreference.md) | Retrieves the session reference for the game session. |  
| [XblMultiplayerManagerGameSessionSetProperties](functions/xblmultiplayermanagergamesessionsetproperties.md) | Sets the value of a custom property for the game session. |  
| [XblMultiplayerManagerGameSessionSetSynchronizedHost](functions/xblmultiplayermanagergamesessionsetsynchronizedhost.md) | Sets the host for the game session, using `XblMultiplayerSessionWriteMode::SynchronizedUpdate`. |  
| [XblMultiplayerManagerGameSessionSetSynchronizedProperties](functions/xblmultiplayermanagergamesessionsetsynchronizedproperties.md) | Sets the value of a custom property for the game session, using `XblMultiplayerSessionWriteMode::SynchronizedUpdate`. |  
| [XblMultiplayerManagerInitialize](functions/xblmultiplayermanagerinitialize.md) | Initializes Multiplayer Manager (MPM). |  
| [XblMultiplayerManagerJoinability](functions/xblmultiplayermanagerjoinability.md) | Indicates which users can join your lobby session. |  
| [XblMultiplayerManagerJoinGame](functions/xblmultiplayermanagerjoingame.md) | Joins a game session, using the globally unique session name. |  
| [XblMultiplayerManagerJoinGameFromLobby](functions/xblmultiplayermanagerjoingamefromlobby.md) | Creates a new game session for the lobby session, or joins an existing game session if one exists for the lobby session. |  
| [XblMultiplayerManagerJoinLobby](functions/xblmultiplayermanagerjoinlobby.md) | Joins an Xbox user to a lobby session. |  
| [XblMultiplayerManagerLeaveGame](functions/xblmultiplayermanagerleavegame.md) | Leaves the game session, returning the Xbox user and all other local users to the lobby session. |  
| [XblMultiplayerManagerLobbySessionAddLocalUser](functions/xblmultiplayermanagerlobbysessionaddlocaluser.md) | Joins an Xbox user to the lobby session. |  
| [XblMultiplayerManagerLobbySessionConstants](functions/xblmultiplayermanagerlobbysessionconstants.md) | Retrieves the session constants associated with the lobby session. |  
| [XblMultiplayerManagerLobbySessionCorrelationId](functions/xblmultiplayermanagerlobbysessioncorrelationid.md) | Retrieves the correlation handle for the lobby session. |  
| [XblMultiplayerManagerLobbySessionDeleteLocalMemberProperties](functions/xblmultiplayermanagerlobbysessiondeletelocalmemberproperties.md) | Deletes a custom property from a local member of the lobby session. |  
| [XblMultiplayerManagerLobbySessionHost](functions/xblmultiplayermanagerlobbysessionhost.md) | Retrieves member information for the host member in the lobby session. |  
| [XblMultiplayerManagerLobbySessionInviteFriends](functions/xblmultiplayermanagerlobbysessioninvitefriends.md) | Displays the standard Xbox UI, allowing the user to select friends or recent players and invite them to the game. |  
| [XblMultiplayerManagerLobbySessionInviteUsers](functions/xblmultiplayermanagerlobbysessioninviteusers.md) | Invites the specified users to the game without displaying additional UI. |  
| [XblMultiplayerManagerLobbySessionIsHost](functions/xblmultiplayermanagerlobbysessionishost.md) | Indicates whether the specified user is the host for the lobby session. |  
| [XblMultiplayerManagerLobbySessionLocalMembers](functions/xblmultiplayermanagerlobbysessionlocalmembers.md) | Retrieves member information for the local members in the lobby session. |  
| [XblMultiplayerManagerLobbySessionLocalMembersCount](functions/xblmultiplayermanagerlobbysessionlocalmemberscount.md) | Retrieves the number of local members in the lobby session. |  
| [XblMultiplayerManagerLobbySessionMembers](functions/xblmultiplayermanagerlobbysessionmembers.md) | Retrieves member information for the members in the lobby session. |  
| [XblMultiplayerManagerLobbySessionMembersCount](functions/xblmultiplayermanagerlobbysessionmemberscount.md) | Retrieves the number of members in the lobby session. |  
| [XblMultiplayerManagerLobbySessionPropertiesJson](functions/xblmultiplayermanagerlobbysessionpropertiesjson.md) | Retrieves the custom properties for the lobby session, as a JSON string. |  
| [XblMultiplayerManagerLobbySessionRemoveLocalUser](functions/xblmultiplayermanagerlobbysessionremovelocaluser.md) | Removes the local user from both the lobby session and game session. |  
| [XblMultiplayerManagerLobbySessionSessionReference](functions/xblmultiplayermanagerlobbysessionsessionreference.md) | Retrieves the session reference for the lobby session. |  
| [XblMultiplayerManagerLobbySessionSetLocalMemberConnectionAddress](functions/xblmultiplayermanagerlobbysessionsetlocalmemberconnectionaddress.md) | Sets the connection address for the local member. |  
| [XblMultiplayerManagerLobbySessionSetLocalMemberProperties](functions/xblmultiplayermanagerlobbysessionsetlocalmemberproperties.md) | Set a custom property for a local member to the specified JSON string. |  
| [XblMultiplayerManagerLobbySessionSetProperties](functions/xblmultiplayermanagerlobbysessionsetproperties.md) | Sets the value of a custom property for the lobby session. |  
| [XblMultiplayerManagerLobbySessionSetSynchronizedHost](functions/xblmultiplayermanagerlobbysessionsetsynchronizedhost.md) | Sets the host for the lobby session, using `XblMultiplayerSessionWriteMode::SynchronizedUpdate`. |  
| [XblMultiplayerManagerLobbySessionSetSynchronizedProperties](functions/xblmultiplayermanagerlobbysessionsetsynchronizedproperties.md) | Sets the value of a custom property for the lobby session, using `XblMultiplayerSessionWriteMode::SynchronizedUpdate`. |  
| [XblMultiplayerManagerMatchStatus](functions/xblmultiplayermanagermatchstatus.md) | Provides the current status of matchmaking. |  
| [XblMultiplayerManagerMemberAreMembersOnSameDevice](functions/xblmultiplayermanagermemberaremembersonsamedevice.md) | Determines whether two members are on the same device. |  
| [XblMultiplayerManagerSetAutoFillMembersDuringMatchmaking](functions/xblmultiplayermanagersetautofillmembersduringmatchmaking.md) | Sets if matchmaking should auto fill open slots during gameplay. This can be changed anytime. |  
| [XblMultiplayerManagerSetJoinability](functions/xblmultiplayermanagersetjoinability.md) | Restricts who can join the game. |  
| [XblMultiplayerManagerSetQosMeasurements](functions/xblmultiplayermanagersetqosmeasurements.md) | Sets json representing QoS measurements between the current user and a list of remote clients. This is only used when the title is manually managing QoS. |  
  
## Handles  
  
| Handle | Description |  
| --- | --- |  
| [XblMultiplayerEventArgsHandle](handles/xblmultiplayereventargshandle.md) | A handle to multiplayer event arguments that can be used to retrieve additional information for a multiplayer event, depending on the type of event. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XblMultiplayerConnectionAddressDeviceTokenPair](structs/xblmultiplayerconnectionaddressdevicetokenpair.md) | A connection address/device token pair to run QoS measurements on. |  
| [XblMultiplayerEvent](structs/xblmultiplayerevent.md) | A multiplayer event that is returned from [XblMultiplayerManagerDoWork](functions/xblmultiplayermanagerdowork.md). |  
| [XblMultiplayerManagerMember](structs/xblmultiplayermanagermember.md) | Represents a reference to a member in a multiplayer game. |  
| [XblMultiplayerPerformQoSMeasurementsArgs](structs/xblmultiplayerperformqosmeasurementsargs.md) | Event arguments returned for `XblMultiplayerEventType::PerformQosMeasurements` events. |  
