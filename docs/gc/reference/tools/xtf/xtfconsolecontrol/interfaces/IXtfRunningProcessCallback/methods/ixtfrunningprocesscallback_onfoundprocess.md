---
author: aablackm
title: OnFoundProcess
description: Called when a running process is found.
ms.assetid: M:Windows.Xbox.xtfconsolecontrol.IXtfRunningProcessCallback.OnFoundProcess(LPCXTFPROCESSINFO)
kindex:
- OnFoundProcess method
- IXtfRunningProcessCallback--OnFoundProcess method
ms.author: stevenpr
ms.topic: reference
edited: 06/29/2020
security: public
---

# IXtfRunningProcessCallback::OnFoundProcess
  
Called when a running process is found.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT OnFoundProcess(
         LPCXTFPROCESSINFO pProcessData
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pProcessData*  
Type: LPCXTFPROCESSINFO  
  
Pointer to an [XTFPROCESSINFO](../../../structs/xtfprocessinfo.md) structure that contains information about the running process.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, it returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This callback function is invoked by [IXtfConsoleControlClient::GetRunningProcesses](../../IXtfConsoleControlClient/methods/ixtfconsolecontrolclient_getrunningprocesses.md) for each running process found on the development console. This function receives a pointer to an [XTFPROCESSINFO](../../../structs/xtfprocessinfo.md) structure that contains the process ID and process image file name of a running process. For more information about listing running processes using Xbox Tools Framework (XTF), see [Process list (xbtlist.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbtlist.md).  
  > [!NOTE]
> Memory for the [XTFPROCESSINFO](../../../structs/xtfprocessinfo.md) structure is owned by the Xbox Tools Framework (XTF) API and is invalidated after each invocation of this callback function. You must copy the information in the structure if you need it for later use.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolecontrol.h  
  
**Library:** xtfconsolecontrol.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfRunningProcessCallback](../ixtfrunningprocesscallback.md)  
[XtfConsoleControl](../../../xtfconsolecontrol_members.md)  
[Xbox Tools Framework native API reference](../../../../atoc-xtf-native.md)  
  