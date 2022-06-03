---
author: joannaleecy
title: XblMultiplayerMatchStatus
description: Defines values used to indicate status for the matchmaking stages.
kindex: XblMultiplayerMatchStatus
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerMatchStatus  

Defines values used to indicate status for the matchmaking stages.    

## Syntax  
  
```cpp
enum class XblMultiplayerMatchStatus  : uint32_t  
{  
    None,  
    SubmittingMatchTicket,  
    Searching,  
    Found,  
    Joining,  
    WaitingForRemoteClientsToJoin,  
    Measuring,  
    UploadingQosMeasurements,  
    WaitingForRemoteClientsToUploadQos,  
    Evaluating,  
    Completed,  
    Resubmitting,  
    Expired,  
    Canceling,  
    Canceled,  
    Failed,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | Indicates no matchmaking search has been started. |  
| SubmittingMatchTicket | Indicates that a match ticket was submitted for matchmaking. |  
| Searching | Indicates that matchmaking is still searching. |  
| Found | Indicates that matchmaking search has found a match. |  
| Joining | Joining initialization stage. Matchmaking creates the game session and adds users to it. The client has up to the joining timeout to join the session during this phase. |  
| WaitingForRemoteClientsToJoin | Waiting for remote clients to join the game session. The client has up to the joining timeout to join the session during this phase. |  
| Measuring | Measuring initialization stage. Stage where QoS measurement happens. The client has up to the measurement timeout to upload qos measurements to the service during this phase. |  
| UploadingQosMeasurements | Uploading QoS measurement results to the service. The client has up to the measurement timeout to upload qos measurements to the service during this phase. |  
| WaitingForRemoteClientsToUploadQos | Waiting for remote clients to upload QoS measurement results to the service. The client has up to the measurement timeout to upload qos measurements to the service during this phase. |  
| Evaluating | Evaluating initialization stage. If auto evaluate is true, then this stage is skipped. Otherwise the title will do its own evaluation. |  
| Completed | Match was found and QoS measurement was successful. |  
| Resubmitting | If the match that was found was not successful and is resubmitting. |  
| Expired | Indicates that matchmaking search has expired. |  
| Canceling | Indicates that matchmaking is in the process of canceling the search. |  
| Canceled | Indicates that matchmaking search has been canceled. |  
| Failed | Failed initialization stage. The initialization failed. |  
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
  
  