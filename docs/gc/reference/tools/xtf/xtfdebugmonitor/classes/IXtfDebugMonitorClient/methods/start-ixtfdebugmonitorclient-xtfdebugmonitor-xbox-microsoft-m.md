---
author: aablackm
title: Start
description: Starts listening for debug output from the development console.
ms.assetid: M:Windows.Xbox.xtfdebugmonitor.IXtfDebugMonitorClient.Start(DWORD,XTF_DBGMON_START_FLAGS,IXtfDebugMonitorCallback)
kindex:
- Start method
- IXtfDebugMonitorClient--Start method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
quality: good
security: public
---

# IXtfDebugMonitorClient::Start Method
Starts listening for debug output from the development console.
<a id="syntaxSection"></a>



## Syntax  

```cpp
public:
HRESULT Start(
         DWORD dwProcessId,
         XTF_DBGMON_START_FLAGS dwFlags,
         IXtfDebugMonitorCallback *pCallback
)  
```

<a id="ID4EH"></a>



### Parameters  

*dwProcessId*  
Type: DWORD 

Identifier of the process.


*dwFlags*  
Type: XTF_DBGMON_START_FLAGS 

Flags that specify how to perform the operation.  
This functionality is not fully developed and, so the parameter should take a value of 0.  

*pCallback*  
Type: IXtfDebugMonitorCallback *

Pointer to the [IXtfDebugMonitorCallback](../../IXtfDebugMonitorCallback/ixtfdebugmonitorcallback-xtfdebugmonitor-xbox-microsoft-t.md) to call when the client receives debug output from the development console.

<a id="ID4EQ"></a>



### Return value  
Type: HRESULT 

HRESULT success or error code.  
<a id="requirements"></a>



## Requirements  

**Header:** xtfdebugmonitor.h  

**Library:** xtfdebugmonitor.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4ENB"></a>

## Remarks

This function is used to start listening for debug output from a game on a development console. When you are finished listening for debug output call [IXtfDebugMonitorClient::Stop](stop-ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md) to stop listening for output. If you do not call [IXtfDebugMonitorClient::Stop](stop-ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md) it may result in resource leakage and an orphaned debugger attachment to the game, this may require a game restart to fix.  

## See also  

<a id="ID4EPB"></a>


[IXtfDebugMonitorClient Interface](../ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-t.md)  
[XtfDebugMonitor](../../../xtfdebugmonitor-xbox-microsoft-n.md)  
[IXtfDebugMonitorClient::Stop](stop-ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md)  