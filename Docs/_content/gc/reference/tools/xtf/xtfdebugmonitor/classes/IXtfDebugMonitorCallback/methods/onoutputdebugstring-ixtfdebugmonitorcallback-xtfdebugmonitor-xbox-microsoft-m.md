---
author: aablackm
title: OnOutputDebugString
description: Called when an Xbox Tools Framework (XTF) app sends debug output.
ms.assetid: M:Windows.Xbox.xtfdebugmonitor.IXtfDebugMonitorCallback.OnOutputDebugString(XTF_OUTPUT_DEBUG_STRING_DATA)
kindex:
- OnOutputDebugString method
- IXtfDebugMonitorCallback--OnOutputDebugString method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
quality: good
security: public
---

# IXtfDebugMonitorCallback::OnOutputDebugString Method
Called when an Xbox Tools Framework (XTF) app sends debug output.
<a id="syntaxSection"></a>



## Syntax  

```cpp
public:
HRESULT OnOutputDebugString(
         const XTF_OUTPUT_DEBUG_STRING_DATA *pData
)  
```

<a id="ID4EH"></a>



### Parameters  

*pData*  
Type: XTF_OUTPUT_DEBUG_STRING_DATA *

Pointer that receives an [XTF_OUTPUT_DEBUG_STRING_DATA](../../../structures/XTF_OUTPUT_DEBUG_STRING_DATA-xtfdebugmonitor-xbox-microsoft-t.md) structure that contains the debug string data.

<a id="ID4EQ"></a>



### Return value  
Type: HRESULT 

HRESULT success or error code.  
<a id="requirements"></a>

## Remarks

This title-defined function handles the debug strings produced by games on the dev console. This function determines what happens to each debug string detected after [IXtfDebugMonitorClient::Start](../../IXtfDebugMonitorClient/methods/start-ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md) is called. The title defined method must match the return value and parameters of the **IXtfDebugMonitorCallback::OnOutputDebugString** method.

## Requirements  

**Header:** xtfdebugmonitor.h  

**Library:** xtfdebugmonitor.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4EHB"></a>



## See also  

<a id="ID4EJB"></a>

[IXtfDebugMonitorCallback Interface](../ixtfdebugmonitorcallback-xtfdebugmonitor-xbox-microsoft-t.md)  
[XtfDebugMonitor](../../../xtfdebugmonitor-xbox-microsoft-n.md)  
[IXtfDebugMonitorCallback](../ixtfdebugmonitorcallback-xtfdebugmonitor-xbox-microsoft-t.md)  