---
author: M-Stahl
title: XGameStreamingTouchControlsStateValue
description: Specifies the type and value of a specific element of touch control state.
kindex: XGameStreamingTouchControlsStateValue
ms.author: arikcohen
ms.topic: reference
security: public
edited: 12/24/2020
applies-to: pc-gdk
---

# XGameStreamingTouchControlsStateValue

Specifies the type and value of a specific element of touch control state.

<a id="syntaxSection"></a>

## Syntax

```cpp
struct XGameStreamingTouchControlsStateValue {
    XGameStreamingTouchControlsStateValueKind valueKind;
        union
        {
            bool booleanValue;
            int64_t integerValue;
            double doubleValue;
            const char* stringValue;
        };
};
```

<a id="membersSection"></a>

### Members

*valueKind*  
Type: [XGameStreamingTouchControlsStateValueKind](../enums/xgamestreamingtouchcontrolsstatevaluekind.md)

The type that the specific piece of touch control state.

*booleanValue*  
Type: bool

The boolean value to be applied.

*integerValue*  
Type: int64_t

The integer value to be applied.

*doubleValue*  
Type: double

The double value to be applied.

*stringValue*  
Type: const char\*

The string value to be applied.

<a id="remarksSection"></a>

## Remarks

You use this structure to provide the type and value of a specific element of touch control state.

You should provide just a single value that represents the type of the variable being modified.

If you specify an incorrect value type, then it causes a runtime error, returned when using either [XGameStreamingShowTouchControlsWithStateUpdate](../functions/xgamestreamingshowtouchcontrolswithstateupdate.md) or [XGameStreamingShowTouchControlsWithStateUpdateOnClient](../functions/xgamestreamingshowtouchcontrolswithstateupdateonclient.md).

<a id="requirementsSection"></a>

## Requirements

**Header:** XGameStreaming.h

**Supported Platforms**: Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[XGameStreaming](../xgamestreaming_members.md)  
[XGameStreamingTouchControlsStateOperationKind](../enums/xgamestreamingtouchcontrolsstateoperationkind.md)  
[XGameStreamingTouchControlsStateOperation](xgamestreamingtouchcontrolsstateoperation.md)  
[XGameStreamingUpdateTouchControlsState](../functions/xgamestreamingupdatetouchcontrolsstate.md)  
[XGameStreamingUpdateTouchControlsStateOnClient](../functions/xgamestreamingupdatetouchcontrolsstateonclient.md)  
[XGameStreamingShowTouchControlsWithStateUpdate](../functions/xgamestreamingshowtouchcontrolswithstateupdate.md)  [XGameStreamingShowTouchControlsWithStateUpdateOnClient](../functions/xgamestreamingshowtouchcontrolswithstateupdateonclient.md)  