---
author: aablackm
title: XtfDebugStringErrorCallback
description: Callback invoked for each error captured by [XtfCaptureOutputBegin](xtfcaptureoutputbegin-xtfapi-xbox-windows-m.md).
kindex: XtfDebugStringErrorCallback
ms.author: zhooper
ms.topic: reference
edited: 04/15/2020
security: public
---

# XtfDebugStringErrorCallback
  
Callback invoked for each error captured by [XtfCaptureOutputBegin](xtfcaptureoutputbegin-xtfapi-xbox-windows-m.md).
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void XtfDebugStringErrorCallback(
         HRESULT errorId,
         PCWSTR errorMessage,
         PVOID context
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*errorId*  
Type: HRESULT  
  
\[in\] The error that occurred.  
  
*errorMessage*  
Type: PCWSTR  
  
\[in\] The error message for that error.  
  
*context*  
Type: PVOID  
  
\[in, optional\] A pointer to a context object, passed into [XtfCaptureOutputBegin](xtfcaptureoutputbegin-xtfapi-xbox-windows-m.md).  
  
<a id="retvalSection"></a>
  
### Return value
  
None.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This callback is invoked by the `XtfCaptureOutputBegin` function for each error captured during a capture session. Use this callback function, along with an [XtfDebugStringCallback](xtfdebugstringcallback-xtfapi-xbox-windows-m.md) callback function, to capture general debug output from a development console. If you want to monitor debug output from a specific process ID on a development console, use a debug monitor client. For more information about using a debug monitor client, see [XtfCreateDebugMonitorClient](../../xtfdebugmonitor/methods/xtfcreatedebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md).
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapi.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also  
  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
  