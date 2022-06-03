---
author: aablackm
title: Stop
description: Stops listening for debug output from the development console.
ms.assetid: M:Windows.Xbox.xtfdebugmonitor.IXtfDebugMonitorClient.Stop(DWORD,XTF_DBGMON_STOP_FLAGS)
kindex:
- Stop method
- IXtfDebugMonitorClient--Stop method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
quality: good
security: public
---

# IXtfDebugMonitorClient::Stop Method
Stops listening for debug output from the development console.
<a id="syntaxSection"></a>



## Syntax  

```cpp
public:
HRESULT Stop(
         DWORD dwProcessId,
         XTF_DBGMON_STOP_FLAGS dwFlags
)  
```

<a id="ID4EH"></a>



### Parameters  

*dwProcessId*  
Type: DWORD 

Identifier of the process.


*dwFlags*  
Type: XTF_DBGMON_STOP_FLAGS 

Flags that specify how to perform the operation.  
This functionality is not fully developed and, so the parameter should take a value of 0.  

<a id="ID4EQ"></a>



### Return value  
Type: HRESULT 

HRESULT success or error code.  
<a id="requirements"></a>

## Remarks

Call this method when you have finished listening to a game on a development console for debug output. The call should occur after you have called [IXtfDebugMonitorClient::Start](start-ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md) to start listening for debug output. Failure to call **IXtfDebugMonitorClient::Stop** could result in resource leakage and an orphaned debugger attachment to the game, this may require a game restart to fix.

## Requirements  

**Header:** xtfdebugmonitor.h  

**Library:** xtfdebugmonitor.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4EEB"></a>



## See also  

<a id="ID4EGB"></a>

[IXtfDebugMonitorClient Interface](../ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-t.md)  
[XtfDebugMonitor](../../../xtfdebugmonitor-xbox-microsoft-n.md)  
[IXtfDebugMonitorClient::Start](start-ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md)  