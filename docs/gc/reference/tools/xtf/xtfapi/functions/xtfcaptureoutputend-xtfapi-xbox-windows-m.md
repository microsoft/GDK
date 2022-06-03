---
author: aablackm
title: XtfCaptureOutputEnd
description: Stop capture debug output.
ms.assetid: M:Windows.Xbox.xtfapi.XtfCaptureOutputEnd(HANDLE)
kindex: XtfCaptureOutputEnd
ms.author: stevenpr
ms.topic: reference
edited: 06/13/2019
security: public
---

# XtfCaptureOutputEnd
  
Stop capture of debug output.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void XtfCaptureOutputEnd(
         HANDLE hListen
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*hListen*  
Type: HANDLE  
  
\[in\] Listener handle returned by [XtfCaptureOutputBegin](xtfcaptureoutputbegin-xtfapi-xbox-windows-m.md).  
  
<a id="retvalSection"></a>
  
### Return value

None.  
  
<a id="remarksSection"></a>
  
## Remarks
  
Use the [XtfCaptureOutputBegin](xtfcaptureoutputbegin-xtfapi-xbox-windows-m.md) function and this function to start and stop capturing general debug output from a development console. If you want to monitor debug output from a specific process ID on a development console, use a debug monitor client. For more information about using a debug monitor client, see [XtfCreateDebugMonitorClient](../../xtfdebugmonitor/methods/xtfcreatedebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md).  
  
Call this function and specify the handle returned in `hListen` from the `XtfCaptureOutputBegin` function to stop capturing debug output and free the resources associated with the capture session.  
  > [!NOTE]
> You must call this function to stop a capture session. Otherwise, the capture session is orphaned and the resources associated with the capture session are not freed, causing a memory leak.  
  
<a id="requirements"></a>
  
## Requirements
  
**Header:** xtfapi.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfDebugMonitorClient Interface](../../xtfdebugmonitor/classes/IXtfDebugMonitorClient/ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-t.md)  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
  