---
author: joannaleecy
title: XblMultiplayerSessionInitializationInfo
description: Present during member initialization.
kindex: XblMultiplayerSessionInitializationInfo
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionInitializationInfo  

Present during member initialization.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerSessionInitializationInfo {  
    XblMultiplayerInitializationStage Stage;  
    time_t StageStartTime;  
    uint32_t Episode;  
} XblMultiplayerSessionInitializationInfo  
```
  
### Members  
  
*Stage*  
Type: [XblMultiplayerInitializationStage](../enums/xblmultiplayerinitializationstage.md)  
  
The 'stage' goes from "joining" to "measuring" to "evaluating". If episode #1 fails, then 'stage' is set to "failed" and the session cannot be initialized. Otherwise, when an initialization episode completes, the 'initializing' object is removed. If 'autoEvaluate' is set, "evaluating" is skipped. If neither 'metrics' nor 'measurementServerAddresses' is set, "measuring" is skipped.
  
*StageStartTime*  
Type: time_t  
  
The time with the initialization stage started.
  
*Episode*  
Type: uint32_t  
  
If member_initialization set and Initialize is true on the member, then the member gets assigned to an InitializingEpisode. An episode is a set of users that need to have QoS metrics applied to them. Will be 0 when the InitializingEpisode is not set. This value is only useful when manually managing QoS.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  