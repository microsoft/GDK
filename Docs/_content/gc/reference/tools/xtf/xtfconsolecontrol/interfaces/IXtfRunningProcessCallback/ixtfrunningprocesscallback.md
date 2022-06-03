---
author: aablackm
title: IXtfRunningProcessCallback (Interface contents)
description: Provides a callback that is called when a running process is found during an IXtfConsoleControlClient::GetRunningProcesses Method operation.
ms.assetid: T:Windows.Xbox.xtfconsolecontrol.IXtfRunningProcessCallback
kindex: IXtfRunningProcessCallback interface, about
ms.author: stevenpr
ms.topic: navigation
edited: 06/13/2019
security: public
---

# IXtfRunningProcessCallback  

Provides a callback that is called when a running process is found during an [IXtfConsoleControlClient::GetRunningProcesses](../IXtfConsoleControlClient/methods/ixtfconsolecontrolclient_getrunningprocesses.md) operation.  
<a id="syntaxSection"></a>



## Syntax  

```cpp
class IXtfRunningProcessCallback : public IUnknown  
```

  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [OnFoundProcess](methods/ixtfrunningprocesscallback_onfoundprocess.md) | Called when a running process is found. |  
  

<a id="requirements"></a>



## Requirements  

**Header:** xtfconsolecontrol.h  

**Library:** xtfconsolecontrol.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4E6"></a>



## See also  

<a id="ID4EBB"></a>



##### Reference  

[xtfconsolecontrol](../../xtfconsolecontrol_members.md)  