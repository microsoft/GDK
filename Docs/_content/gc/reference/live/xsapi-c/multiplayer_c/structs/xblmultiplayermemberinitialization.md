---
author: joannaleecy
title: XblMultiplayerMemberInitialization
description: Represents requirements for a new Multiplayer service session.
kindex: XblMultiplayerMemberInitialization
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerMemberInitialization  

Represents requirements for a new Multiplayer service session.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerMemberInitialization {  
    uint64_t JoinTimeout;  
    uint64_t MeasurementTimeout;  
    uint64_t EvaluationTimeout;  
    bool ExternalEvaluation;  
    uint32_t MembersNeededToStart;  
} XblMultiplayerMemberInitialization  
```
  
### Members  
  
*JoinTimeout*  
Type: uint64_t  
  
Maximum time, in milliseconds, for the joining stage of the Quality of Service (QoS) process.
  
*MeasurementTimeout*  
Type: uint64_t  
  
Maximum time, in milliseconds, for the measurement stage of the QoS process.
  
*EvaluationTimeout*  
Type: uint64_t  
  
Maximum time, in milliseconds, for the evaluation stage of the QoS process.
  
*ExternalEvaluation*  
Type: bool  
  
When set to true, indicates that the title performs the evaluation stage.
  
*MembersNeededToStart*  
Type: uint32_t  
  
Minimum number of members for the session. Defaults to 2. Must be between 1 and `maxMemberCount`. Applies only to the joining stage.
  
## Member of
  
[XblMultiplayerSessionConstants](xblmultiplayersessionconstants.md)
  
## Argument of
  
[XblMultiplayerSessionConstantsSetMemberInitialization](../functions/xblmultiplayersessionconstantssetmemberinitialization.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  