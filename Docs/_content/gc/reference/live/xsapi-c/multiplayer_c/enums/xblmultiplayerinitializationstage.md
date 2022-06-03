---
author: joannaleecy
title: XblMultiplayerInitializationStage
description: Defines values that indicate the initialization stage of a session during managed initialization.
kindex: XblMultiplayerInitializationStage
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerInitializationStage  

Defines values that indicate the initialization stage of a session during managed initialization.    

## Syntax  
  
```cpp
enum class XblMultiplayerInitializationStage  : uint32_t  
{  
    Unknown,  
    None,  
    Joining,  
    Measuring,  
    Evaluating,  
    Failed  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | Stage not known. |  
| None | Stage not set. |  
| Joining | Joining stage. Typically, matchmaking creates a session and adds users to the session. The client has until the joining timeout to join the session during this stage. |  
| Measuring | Measuring stage. Quality of Service (QoS) measurement happens during this stage. If the title is manually managing QoS, the title handles this stage. Otherwise, the Xbox party system handles this stage when calling `RegisterGameSession` or `RegisterMatchSession`. |  
| Evaluating | Evaluating stage. If `externalEvaluation` is false, this stage is skipped. Otherwise, the title does its own evaluation. |  
| Failed | Failed stage. If the first initilization episode didn't succeed, the session can't be initialized. |  
  
## Remarks  
  
For more information about managed initialization, see the "Managed initialization" section of [Target session initialization and QoS](../../../../../live/features/multiplayer/matchmaking/concepts/live-matchmaking-target-session.md).
  
## Member of
  
[XblMultiplayerSessionInitializationInfo](../structs/xblmultiplayersessioninitializationinfo.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  