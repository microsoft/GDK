---
author: aablackm
title: IXtfDebugMonitorCallback Interface (Interface contents)
description: Provides a callback that is used when an Xbox Tools Framework (XTF) app sends debug output.
ms.assetid: T:Windows.Xbox.xtfdebugmonitor.IXtfDebugMonitorCallback
kindex: IXtfDebugMonitorCallback interface, about
ms.author: stevenpr
ms.topic: navigation
edited: 00/00/0000
security: public
---

# IXtfDebugMonitorCallback Interface
Provides a callback that is used when an Xbox Tools Framework (XTF) app sends debug output.
<a id="syntaxSection"></a>



## Syntax  

```cpp
interface IXtfDebugMonitorCallback : public IUnknown  
```

  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [OnOutputDebugString](methods/onoutputdebugstring-ixtfdebugmonitorcallback-xtfdebugmonitor-xbox-microsoft-m.md) | Called when an Xbox Tools Framework (XTF) app sends debug output. |  


<a id="requirements"></a>

## Remarks

The **IXtfDebugMonitorCallback Interface** dictates how debug output read from the console is handled. This behavior is established when an **IXtfDebugMonitorCallback** is passed to [IXtfDebugMonitorClient::Start](../IXtfDebugMonitorClient/methods/start-ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md) as a parameter. The interface contains the method [IXtfDebugMonitorCallback::OnOutputDebugString](methods/onoutputdebugstring-ixtfdebugmonitorcallback-xtfdebugmonitor-xbox-microsoft-m.md) which defines how debug output is handled when it is detected.  

## Requirements  

**Header:** xtfdebugmonitor.h  

**Library:** xtfdebugmonitor.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4E1"></a>


## See also  

<a id="ID4E3"></a>

[XtfDebugMonitor](../../xtfdebugmonitor-xbox-microsoft-n.md)  
[IXtfDebugMonitorClient::Start](../IXtfDebugMonitorClient/methods/start-ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md)  
[IXtfDebugMonitorCallback::OnOutputDebugString](methods/onoutputdebugstring-ixtfdebugmonitorcallback-xtfdebugmonitor-xbox-microsoft-m.md)  