---
author: aablackm
title: GetRunningProcesses
description: Causes all running processes to be enumerated, invoking a callback for each running process.
ms.assetid: M:Windows.Xbox.xtfconsolecontrol.IXtfConsoleControlClient.GetRunningProcesses(IXtfRunningProcessCallback)
kindex:
- GetRunningProcesses method
- IXtfConsoleControlClient--GetRunningProcesses method
ms.author: stevenpr
ms.topic: reference
edited: 07/24/2020
security: public
---

# IXtfConsoleControlClient::GetRunningProcesses
  
Causes all running processes to be enumerated, invoking a callback for each running process.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT GetRunningProcesses(
         IXtfRunningProcessCallback *pCallback
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pCallback*  
Type: IXtfRunningProcessCallback\*  
  
A pointer to the [IXtfRunningProcessCallback](../../IXtfRunningProcessCallback/ixtfrunningprocesscallback.md) interface, invoked when a running process is discovered.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function causes the Xbox Tools Framework (XTF) API to enumerate all of the running processes on the current development console. When a running process is found, the XTF API invokes the [OnFoundProcess](../../IXtfRunningProcessCallback/methods/ixtfrunningprocesscallback_onfoundprocess.md) callback function of the [IXtfRunningProcessCallback](../../IXtfRunningProcessCallback/ixtfrunningprocesscallback.md) interface implemented in your app and specified in `pCallback`. The XTF API passes a pointer to an [XTFPROCESSINFO](../../../structs/xtfprocessinfo.md) structure, describing the running process, when it invokes your implemented `OnFoundProcess` function.  
  > [!NOTE]
> Memory for the [XTFPROCESSINFO](../../../structs/xtfprocessinfo.md) structure is owned by the Xbox Tools Framework (XTF) API and is invalidated after each invocation of your [IXtfRunningProcessCallback::OnFoundProcess](../../IXtfRunningProcessCallback/methods/ixtfrunningprocesscallback_onfoundprocess.md) callback function. You must copy the information in the structure if you need it for later use.  
  
For more information about listing running processes using Xbox Tools Framework (XTF), see [Process list (xbtlist.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbtlist.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolecontrol.h  
  
**Library:** xtfconsolecontrol.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfConsoleControlClient](../ixtfconsolecontrolclient.md)  
[XtfConsoleControl](../../../xtfconsolecontrol_members.md)  
  