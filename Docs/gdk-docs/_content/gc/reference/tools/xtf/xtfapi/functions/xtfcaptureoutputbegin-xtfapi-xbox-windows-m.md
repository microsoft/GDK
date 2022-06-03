---
author: aablackm
title: XtfCaptureOutputBegin
description: Starts capture of debug output.
ms.assetid: M:Windows.Xbox.xtfapi.XtfCaptureOutputBegin(PCWSTR,XtfDebugStringCallback,XtfDebugStringErrorCallback,PVOID,PHANDLE@)
kindex: XtfCaptureOutputBegin
ms.author: stevenpr
ms.topic: reference
edited: 06/13/2019
security: public
---

# XtfCaptureOutputBegin
  
Starts capture of debug output.  
  
<a id="syntaxSection"></a>
  
## Syntax  
  
```cpp
void XtfCaptureOutputBegin(
         PCWSTR address,
         XtfDebugStringCallback debugStringCallback,
         XtfDebugStringErrorCallback debugStringErrorCallback,
         PVOID context,
         PHANDLE hListen
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*address*  
Type: PCWSTR  
  
\[in\] The IP address of the console.  
  
*debugStringCallback*  
Type: [XtfDebugStringCallback](xtfdebugstringcallback-xtfapi-xbox-windows-m.md)  
  
\[in, optional\] An optional callback invoked for each output debug string.  
  
*debugStringErrorCallback*  
Type: [XtfDebugStringErrorCallback](xtfdebugstringerrorcallback-xtfapi-xbox-windows-m.md)  
  
\[in, optional\] An optional callback invoked for each error encountered.  
  
*context*  
Type: PVOID  
  
\[in, optional\] A pointer to an object that is passed into the callback functions. This object allows each callback invocation to be associated with this capture session.  
  
*hListen*  
Type: PHANDLE  
  
\[out\] The handle that represents this capture session.  
  
<a id="retvalSection"></a>
  
### Return value
  
None.
  
<a id="remarksSection"></a>
  
## Remarks
  
Use this function and the [XtfCaptureOutputEnd](xtfcaptureoutputend-xtfapi-xbox-windows-m.md) function to start and stop capturing general debug output from a development console. If you want to monitor debug output from a specific process ID on a development console, use a debug monitor client. For more information about using a debug monitor client, see [XtfCreateDebugMonitorClient](../../xtfdebugmonitor/methods/xtfcreatedebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md).  
  
You must implement and specify a `XtfDebugStringCallback` function in `debugStringCallback` if you want to capture debug strings for a capture session. Similarly, you must implement and specify an `XtfDebugStringErrorCallback` function in `debugStringErrorCallback` to capture errors encountered during a capture session. Neither callback function is required, however.  
  
To stop capturing debug output and free the resources associated with a capture session, call [XtfCaptureOutputEnd](xtfcaptureoutputend-xtfapi-xbox-windows-m.md) and specify the handle returned in `hListen` for that capture session.  
  > [!NOTE]
> You must call `XtfCaptureOutputEnd` to stop a capture session. Otherwise, the capture session is orphaned and the resources associated with the capture session are not freed, causing a memory leak.  
  
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
  