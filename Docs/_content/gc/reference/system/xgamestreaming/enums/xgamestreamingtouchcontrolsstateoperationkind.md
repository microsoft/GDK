---
author: M-Stahl
title: XGameStreamingTouchControlsStateOperationKind
description: Operations that can be taken when updating touch control layout state.
kindex: XGameStreamingTouchControlsStateOperationKind
ms.author: arikcohen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XGameStreamingTouchControlsStateOperationKind  

Operations that can be taken when updating touch control layout state.

## Syntax  
  
```cpp
enum class XGameStreamingTouchControlsStateOperationKind  : uint32_t  
{  
    Replace = 0  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Replace | Replace a reference in the touch control state with the specified value.   |  
  
## Remarks  
  
Used when building the set of updates to the touch layout state that can be sent to all or a specific streaming client.  

Common uses include:
* Changing the visual representation of a particular touch layout control.
* Enabling/disabling a particular touch layout control.

  
## Requirements  
  
**Header:** XGameStreaming.h
**Supported Platforms**: Windows, Xbox One family consoles and Xbox Series consoles
  
## See also  
[XGameStreaming](../xgamestreaming_members.md#TouchAdaptation)  
[XGameStreamingTouchControlsStateOperation](../structs/xgamestreamingtouchcontrolsstateoperation.md)  
[XGameStreamingTouchControlsStateValue](../structs/xgamestreamingtouchcontrolsstatevalue.md)  
[XGameStreamingUpdateTouchControlsState](../functions/xgamestreamingupdatetouchcontrolsstate.md)  
[XGameStreamingUpdateTouchControlsStateOnClient](../functions/xgamestreamingupdatetouchcontrolsstateonclient.md)  
[XGameStreamingShowTouchControlsWithStateUpdate](../functions/xgamestreamingshowtouchcontrolswithstateupdate.md)  
[XGameStreamingShowTouchControlsWithStateUpdateOnClient](../functions/xgamestreamingshowtouchcontrolswithstateupdateonclient.md)  
  

  
  