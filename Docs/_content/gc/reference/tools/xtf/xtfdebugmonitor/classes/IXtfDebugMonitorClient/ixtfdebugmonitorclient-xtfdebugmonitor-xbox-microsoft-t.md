---
author: aablackm
title: IXtfDebugMonitorClient Interface (Interface contents)
description: Receives debug output from Xbox Tools Framework (XTF) apps.
ms.assetid: T:Windows.Xbox.xtfdebugmonitor.IXtfDebugMonitorClient
kindex: IXtfDebugMonitorClient interface, about
ms.author: stevenpr
ms.topic: navigation
edited: 00/00/0000
security: public
---

# IXtfDebugMonitorClient Interface
Receives debug output from Xbox Tools Framework (XTF) apps.
<a id="syntaxSection"></a>



## Syntax  

```cpp
interface IXtfDebugMonitorClient : public IUnknown  
```

  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [Start](methods/start-ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md) | Starts listening for debug output from the development console. |  
| [Stop](methods/stop-ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md) | Stops listening for debug output from the development console. |  


<a id="requirements"></a>



## Requirements  

**Header:** xtfdebugmonitor.h  

**Library:** xtfdebugmonitor.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4E1"></a>

## Remarks

This interface is created by calling [XtfCreateDebugMonitorClient](../../methods/xtfcreatedebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md). The interface allows you to monitor for debug messages being output by a game on a development console. In order to start listening for debug messages call [IXtfDebugMonitorClient::Start](methods/start-ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md). Once you have finished listening for debug messages from the console call [IXtfDebugMonitorClient::Stop](methods/stop-ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md). The IXtfDebugMonitorClient Interface monitors debug output from a specific process. If you want to read more general debug output from a development console you will need to call [XtfCaptureOutputBegin](../../../xtfapi/functions/xtfcaptureoutputbegin-xtfapi-xbox-windows-m.md).

## See also  

<a id="ID4E3"></a>

[XtfDebugMonitor](../../xtfdebugmonitor-xbox-microsoft-n.md)  
[XtfCreateDebugMonitorClient](../../methods/xtfcreatedebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md)
[IXtfDebugMonitorClient::Start](methods/start-ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md)  
[IXtfDebugMonitorClient::Stop](methods/stop-ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md)  
[XtfCaptureOutputBegin](../../../xtfapi/functions/xtfcaptureoutputbegin-xtfapi-xbox-windows-m.md)  