---
author: aablackm
title: XtfDebugStringCallback
description: Callback invoked for each output debug string captured by [XtfCaptureOutputBegin](xtfcaptureoutputbegin-xtfapi-xbox-windows-m.md).
kindex: XtfDebugStringCallback
ms.author: zhooper
ms.topic: reference
edited: 04/15/2020
security: public
---

# XtfDebugStringCallback
  
Callback invoked for each output debug string captured by [XtfCaptureOutputBegin](xtfcaptureoutputbegin-xtfapi-xbox-windows-m.md).  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void *XtfDebugStringCallback(
         UINT32 processId,
         UINT32 threadId,
         UINT16 cpuGroup,
         UINT16 cpuIndex,
         UINT32 level,
         UINT32 componentId,
         UINT32 sequenceNumber,
         UINT64 interruptTime,
         UINT32 flags,
         PCWSTR sourceIdentifier,
         PCWSTR messageData,
         PVOID context
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*processId*  
Type: UINT32  
  
\[in\] The ID of the process for this debug string.  
  
*threadId*  
Type: UINT32  
  
\[in\] The ID of the thread for the title.  
  
*cpuGroup*  
Type: UINT16  
  
\[in\] The CPU group for the title.  
  
*cpuIndex*  
Type: UINT16  
  
\[in\] The CPU index for the title.  
  
*level*  
Type: UINT32  
  
\[in\] Reserved for internal use.  
  
*componentId*  
Type: UINT32  
  
\[in\] Reserved for internal use.  
  
*sequenceNumber*  
Type: UINT32  
  
\[in\] The sequence number of the debug string. The value of this parameter allows you to determine the order of the debug output, in the rare cases where debug strings may be returned in the wrong order.  
  
*interruptTime*  
Type: UINT64  
  
\[in\] Reserved for internal use.  
  
*flags*  
Type: UINT32  
  
\[in\] Reserved for internal use.  
  
*sourceIdentifier*  
Type: PCWSTR  
  
\[in\] The source of the debug string. This parameter is set to either "Title" or "System".  
  
*messageData*  
Type: PCWSTR  
  
\[in\] The debug output string.  
  
*context*  
Type: PVOID  
  
\[in, optional\] A pointer to a context object, passed into [XtfCaptureOutputBegin](xtfcaptureoutputbegin-xtfapi-xbox-windows-m.md).  
  
<a id="retvalSection"></a>
  
### Return value
  
None.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This callback is invoked by the `XtfCaptureOutputBegin` function for each output debug string captured during a capture session. Use this callback function, along with an [XtfDebugStringErrorCallback](xtfdebugstringerrorcallback-xtfapi-xbox-windows-m.md) callback function, to capture general debug output from a development console. If you want to monitor debug output from a specific process ID on a development console, use a debug monitor client. For more information about using a debug monitor client, see [XtfCreateDebugMonitorClient](../../xtfdebugmonitor/methods/xtfcreatedebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md).
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapi.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also  
  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
  