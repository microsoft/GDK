---
author: aablackm
title: XTF_OUTPUT_DEBUG_STRING_DATA structure
description: Contains debug output string data.
ms.assetid: T:Windows.Xbox.xtfdebugmonitor.XTF_OUTPUT_DEBUG_STRING_DATA
kindex: XTF_OUTPUT_DEBUG_STRING_DATA structure
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# XTF_OUTPUT_DEBUG_STRING_DATA structure
Contains debug output string data.
<a id="syntaxSection"></a>



## Syntax  
```cpp
typedef struct XTF_OUTPUT_DEBUG_STRING_DATA {
    DWORD dwProcessId;
    LPCWSTR pszDbgStr;
} XTF_OUTPUT_DEBUG_STRING_DATA;  
```

<a id="ID4EH"></a>



### Members  

**dwProcessId**  
Identifier of the process.


**pszDbgStr**  
Pointer to the debug output string.

<a id="requirements"></a>

## Remarks

This structure is a parameter for [IXtfDebugMonitorCallback::OnOutputDebugString](../classes/IXtfDebugMonitorCallback/methods/onoutputdebugstring-ixtfdebugmonitorcallback-xtfdebugmonitor-xbox-microsoft-m.md). It is used to send the contents of a message from your game to the debug output. 
For more information about the Xtf debug monitor, see [XtfDebugMonitor](../xtfdebugmonitor-xbox-microsoft-n.md).

## Requirements  

**Header:** xtfdebugmonitor.h  

**Library:** xtfdebugmonitor.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4EBB"></a>


## See also  

<a id="ID4EDB"></a>

[XtfDebugMonitor](../xtfdebugmonitor-xbox-microsoft-n.md)  
[IXtfDebugMonitorCallback::OnOutputDebugString](../classes/IXtfDebugMonitorCallback/methods/onoutputdebugstring-ixtfdebugmonitorcallback-xtfdebugmonitor-xbox-microsoft-m.md)  