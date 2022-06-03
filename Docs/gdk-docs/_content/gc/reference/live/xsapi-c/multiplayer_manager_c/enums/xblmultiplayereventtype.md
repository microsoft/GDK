---
author: joannaleecy
title: XblMultiplayerEventType
description: Defines values used to indicate event types for a multiplayer lobby or game. The XblMultiplayerEventArgsHandle can be used to get additional information about the event depending on the event type.
kindex: XblMultiplayerEventType
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerEventType  

Defines values used to indicate event types for a multiplayer lobby or game. The XblMultiplayerEventArgsHandle can be used to get additional information about the event depending on the event type.    

## Syntax  
  
```cpp
enum class XblMultiplayerEventType  : uint32_t  
{  
    UserAdded,  
    UserRemoved,  
    MemberJoined,  
    MemberLeft,  
    MemberPropertyChanged,  
    LocalMemberPropertyWriteCompleted,  
    LocalMemberConnectionAddressWriteCompleted,  
    SessionPropertyChanged,  
    SessionPropertyWriteCompleted,  
    SessionSynchronizedPropertyWriteCompleted,  
    HostChanged,  
    SynchronizedHostWriteCompleted,  
    JoinabilityStateChanged,  
    PerformQosMeasurements,  
    FindMatchCompleted,  
    JoinGameCompleted,  
    LeaveGameCompleted,  
    JoinLobbyCompleted,  
    ClientDisconnectedFromMultiplayerService,  
    InviteSent,  
    TournamentRegistrationStateChanged,  
    TournamentGameSessionReady,  
    ArbitrationComplete  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| UserAdded | Indicates the user was added. You can call XblMultiplayerEventArgsXuid to get the xuid of the added user. |  
| UserRemoved | Indicates the user was removed. You can call XblMultiplayerEventArgsXuid to get the xuid of the added user. |  
| MemberJoined | Indicates a new member has joined the session. You can call XblMultiplayerEventArgsMembersCount, XblMultiplayerEventArgsMembers to get the members who joined. |  
| MemberLeft | Indicates a member has left the session. You can call XblMultiplayerEventArgsMembersCount, XblMultiplayerEventArgsMembers to get the members who left. |  
| MemberPropertyChanged | Indicates a member property has changed. You can call XblMultiplayerEventArgsMember, XblMultiplayerEventArgsPropertiesJson to get the properties that changed and the member. |  
| LocalMemberPropertyWriteCompleted | Indicates that the XblMultiplayerManagerLobbySessionSetLocalMemberProperties() or XblMultiplayerManagerLobbySessionDeleteLocalMemberProperties() operation has completed. Upon completion, the game can view the XblMultiplayerEvent::Result to see if the write succeeded. A game can write local member properties by calling the XblMultiplayerManagerLobbySessionSetLocalMemberProperties() operation. |  
| LocalMemberConnectionAddressWriteCompleted | Indicates that the XblMultiplayerManagerLobbySessionSetLocalMemberConnectionAddress() operation has completed. Upon completion, the game can view the XblMultiplayerEvent::Result to see if the write succeeded. A game can write local member properties by calling the XblMultiplayerManagerLobbySessionSetLocalMemberConnectionAddress() operation. |  
| SessionPropertyChanged | Indicates a session (lobby or game) property has changed. You can call XblMultiplayerEventArgsPropertiesJson for the changed properties. |  
| SessionPropertyWriteCompleted | Indicates that the set property operation has completed. Upon completion, the game can view the XblMultiplayerEvent::Result to see if the write succeeded. A game can write synchronized properties by calling the XblMultiplayerManagerLobbySessionSetProperties() or XblMultiplayerManagerGameSessionSetProperties() operation. |  
| SessionSynchronizedPropertyWriteCompleted | Indicates that the set synchronized property operation has completed. Upon completion, the game can view the XblMultiplayerEvent::Result to see if the write succeeded. A game can write synchronized properties by calling the XblMultiplayerManagerGameSessionSetSynchronizedProperties() operation. |  
| HostChanged | Indicates host has changed. You can call XblMultiplayerEventArgsMember for the new host. |  
| SynchronizedHostWriteCompleted | Indicates that the XblMultiplayerManagerLobbySessionSetSynchronizedHost() operation has completed. Upon completion, the game can view the XblMultiplayerEvent::Result to see if the write succeeded. A game can write synchronized host by calling the XblMultiplayerManagerLobbySessionSetSynchronizedHost() operation. |  
| JoinabilityStateChanged | Indicates that the XblMultiplayerJoinability value has changed. A game can change the state by calling the XblMultiplayerManagerSetJoinability() operation. |  
| PerformQosMeasurements | Fired when a match has been found, and the client has joined the target game session. When this event occurs, title should provide QOS measurement results (via XblMultiplayerSessionCurrentUserSetQosMeasurements) between itself and a list of remote clients. Note: If your title does not require QoS (based on the session template), this event will not be triggered. You can call XblMultiplayerEventArgsPerformQoSMeasurements for the measurements. |  
| FindMatchCompleted | Indicates that the XblMultiplayerManagerFindMatch() operation has completed. You can call XblMultiplayerEventArgsFindMatchCompleted for more information. |  
| JoinGameCompleted | Indicates that the XblMultiplayerManagerJoinGame() operation has completed. Once the join succeeds, the member is now part of the game session, and can use data in the session to connect to other game members. |  
| LeaveGameCompleted | Indicates that the XblMultiplayerManagerLeaveGame() operation has completed. After receiving this event, the game session object will be set to null. You can join another game by calling XblMultiplayerManagerJoinGame() or XblMultiplayerManagerJoinGameFromLobby(). |  
| JoinLobbyCompleted | Indicates that the [XblMultiplayerManagerJoinLobby](../functions/xblmultiplayermanagerjoinlobby.md) operation has completed. Once the join succeeds, the member is now part of the lobby session, and can use data in the session to connect to other lobby members. You can call XblMultiplayerEventArgsXuid for the xuid. |  
| ClientDisconnectedFromMultiplayerService | Fired when the title's connection to MPSD using the real-time activity service is lost. When this event occurs, the title should shut down the multiplayer. |  
| InviteSent | Indicates that the invite API operation has been completed. |  
| TournamentRegistrationStateChanged | Only applicable if you are using Xbox Live Tournaments. Triggered when the tournament's team registration state changes. You can call XblMultiplayerEventArgsTournamentRegistrationStateChanged for more information. DEPRECATED. It will be removed in a future release |  
| TournamentGameSessionReady | Only applicable if you are using Xbox Live Tournaments. Triggered when a new game has been scheduled. You can call XblMultiplayerEventArgsTournamentGameSessionReady for more information. DEPRECATED. It will be removed in a future release |  
| ArbitrationComplete | Only applicable if you are using Xbox Live Tournaments. Triggered when arbitration is complete and game results have been written to the game session. DEPRECATED. It will be removed in a future release |  
  
## Member of  
  
[XblMultiplayerEvent](../structs/xblmultiplayerevent.md)  
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
  
  