---
author: M-Stahl
title: XGameStreamingTouchControlsStateValueKind
description: Specifies the type of state associated with the touch layouts.
kindex: XGameStreamingTouchControlsStateValueKind
ms.author: arikcohen
ms.topic: reference
security: public
edited: 12/24/2020
applies-to: pc-gdk
---

# XGameStreamingTouchControlsStateValueKind

Specifies the type of state associated with the touch layouts.

<a id="syntaxSection"></a>

## Syntax

```cpp
enum class XGameStreamingTouchControlsStateValueKind  : uint32_t
{
    Boolean = 0,
    Integer = 1,
     Double = 2,
     String = 3
}
```

<a id="constantsSection"></a>

## Constants

| Constant | Description |
| --- | --- |
| Boolean | State of type Boolean |
| Integer | State of type Integer |
| Double | State of type Double |
| String | State of type String |

<a id="remarksSection"></a>

## Remarks

You use this enumeration when you build the set of updates to the touch layout state that is then sent to all streaming clienhts, or to a specific streaming client.

Common uses for this enumeration include:

* Enabling and disabling particular touch layout controls.

* Changing the visual representation of a particular touch layout control.

<a id="requirementsSection"></a>

## Requirements

**Header:** XGameStreaming.h

**Supported Platforms**: Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[XGameStreaming](../xgamestreaming_members.md)  
[XGameStreamingTouchControlsStateOperationKind](xgamestreamingtouchcontrolsstateoperationkind.md)  
[XGameStreamingTouchControlsStateOperation](../structs/xgamestreamingtouchcontrolsstateoperation.md)  
[XGameStreamingTouchControlsStateValue](../structs/xgamestreamingtouchcontrolsstatevalue.md)  
[XGameStreamingUpdateTouchControlsState](../functions/xgamestreamingupdatetouchcontrolsstate.md)  
[XGameStreamingUpdateTouchControlsStateOnClient](../functions/xgamestreamingupdatetouchcontrolsstateonclient.md)  
[XGameStreamingShowTouchControlsWithStateUpdate](../functions/xgamestreamingshowtouchcontrolswithstateupdate.md)  
[XGameStreamingShowTouchControlsWithStateUpdateOnClient](../functions/xgamestreamingshowtouchcontrolswithstateupdateonclient.md)  