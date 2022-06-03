---
author: aablackm
title: XtfCreateDebugMonitorClient
description: Initializes a new instance of the IXtfDebugMonitorClient Interface interface.
ms.assetid: M:Windows.Xbox.xtfdebugmonitor.XtfCreateDebugMonitorClient(LPCWSTR,REFIID,void)
kindex: XtfCreateDebugMonitorClient
ms.author: stevenpr
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# XtfCreateDebugMonitorClient
Initializes a new instance of the [IXtfDebugMonitorClient](../classes/IXtfDebugMonitorClient/ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-t.md) interface.
<a id="syntaxSection"></a>



## Syntax  

```cpp
HRESULT XtfCreateDebugMonitorClient(
         LPCWSTR pszAddress,
         REFIID riid,
         void **ppvObject
)  
```

<a id="ID4EL"></a>



### Parameters  

*pszAddress*  
Type: LPCWSTR 

Pointer to the tools IP address of the development console to receive debug output from.


*riid*  
Type: REFIID 

Pointer that receives the instance identifier of the newly created [IXtfDebugMonitorClient](../classes/IXtfDebugMonitorClient/ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-t.md).


*ppvObject*  
Type: void **

Pointer that receives a reference to the newly created [IXtfDebugMonitorClient](../classes/IXtfDebugMonitorClient/ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-t.md).

<a id="ID4ES"></a>



### Return value  
Type: HRESULT 

HRESULT success or error code.  
<a id="requirements"></a>

## Remarks

The [IXtfDebugMonitorClient](../classes/IXtfDebugMonitorClient/ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-t.md) interface will allow you to receive debug output from your game on a development console. After creating the client you can use its [start](../classes/IXtfDebugMonitorClient/methods/start-ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md) and [stop](../classes/IXtfDebugMonitorClient/methods/stop-ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md) functions to determine when to listen for debug output from the development console. In addition you will want to define an [IXtfDebugMonitorCallback](../classes/IXtfDebugMonitorCallback/ixtfdebugmonitorcallback-xtfdebugmonitor-xbox-microsoft-t.md) to be called when there is output to be captured from the development console.

## Requirements  

**Header:** xtfdebugmonitor.h  

**Library:** xtfdebugmonitor.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4ETB"></a>



## See also  

<a id="ID4EVB"></a>

[XtfDebugMonitor](../xtfdebugmonitor-xbox-microsoft-n.md)  
[IXtfDebugMonitorClient](../classes/IXtfDebugMonitorClient/ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-t.md)  
[start](../classes/IXtfDebugMonitorClient/methods/start-ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md)  
[stop](../classes/IXtfDebugMonitorClient/methods/stop-ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md)  