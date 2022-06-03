---
author: joannaleecy
title: XblTournamentArbitrationState
description: Defines values that indicate the arbitration state of a tournament game. DEPRECATED. This enumeration will be removed in a future release.
kindex: XblTournamentArbitrationState
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblTournamentArbitrationState  

Defines values that indicate the arbitration state of a tournament game. DEPRECATED. This enumeration will be removed in a future release.    

## Syntax  
  
```cpp
enum class XblTournamentArbitrationState  : uint32_t  
{  
    None,  
    Completed,  
    Canceled,  
    NoResults,  
    PartialResults  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | No arbitration state is set. |  
| Completed | Results were fully uploaded and complete. |  
| Canceled | The match was canceled, such as in the case of forfeiting. |  
| NoResults | The match began, but no players or servers reported results before the arbitration deadline. |  
| PartialResults | Some results were received, and results were compiled based on the incomplete data. |  
  
## Member of
  
[XblMultiplayerArbitrationServer](../structs/xblmultiplayerarbitrationserver.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  