---
author: M-Stahl
title: XGameStreamingTouchControlsStateOperation
description: Specifies the kind of operation to use, the path to the specific variable, and the state value to be applied.
kindex: XGameStreamingTouchControlsStateOperation
ms.author: arikcohen
ms.topic: reference
security: public
edited: 12/24/2020
applies-to: pc-gdk
---

# XGameStreamingTouchControlsStateOperation

Specifies the kind of operation to use, the path to the specific variable, and the state value to be applied.

<a id="syntaxSection"></a>

## Syntax

```cpp
typedef struct XGameStreamingTouchControlsStateOperation {
    XGameStreamingTouchControlsStateOperationKind operationKind;
    const char* path;
    XGameStreamingTouchControlsStateValue value;
} XGameStreamingTouchControlsStateOperation
```

<a id="membersSection"></a>

### Members

*operationKind*  
Type: [XGameStreamingTouchControlsStateOperationKind](../enums/xgamestreamingtouchcontrolsstateoperationkind.md)

The operation that is being specified.

*path*  
Type: const char\*

The path to the state variable that is being affected. This should be one of the properties that are defined in the `state` portion of the touch layout bundle.

*value*  
Type: [XGameStreamingTouchControlsStateValue](xgamestreamingtouchcontrolsstatevalue.md)

The value that will utilized in the operation on the state variable.

<a id="remarksSection"></a>

## Remarks

You used this structure to represent an update to a touch layout control.

To perform an update, specify the:

1. Operation. Currently, only replace is supported.
2. Path to the variable to be replaced.
3. Value to be applied to that variable.

<a id="requirementsSection"></a>

## Requirements

**Header:** XGameStreaming.h

**Supported Platforms**: Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[XGameStreaming](../xgamestreaming_members.md)  
[XGameStreamingTouchControlsStateOperationKind](../enums/xgamestreamingtouchcontrolsstateoperationkind.md)  
[XGameStreamingTouchControlsStateValue](xgamestreamingtouchcontrolsstatevalue.md)  
[XGameStreamingUpdateTouchControlsState](../functions/xgamestreamingupdatetouchcontrolsstate.md)  
[XGameStreamingUpdateTouchControlsStateOnClient](../functions/xgamestreamingupdatetouchcontrolsstateonclient.md)  
[XGameStreamingShowTouchControlsWithStateUpdate](../functions/xgamestreamingshowtouchcontrolswithstateupdate.md)  [XGameStreamingShowTouchControlsWithStateUpdateOnClient](../functions/xgamestreamingshowtouchcontrolswithstateupdateonclient.md)  