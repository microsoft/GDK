---
author: aablackm
title: XTFPROCESSINFO
description: Contains information about a running Xbox Tools Framework (XTF) process.
ms.assetid: T:Windows.Xbox.xtfconsolecontrol.XTFPROCESSINFO
kindex: XTFPROCESSINFO structure
ms.author: stevenpr
ms.topic: reference
edited: 06/29/2020
security: public
---

# XTFPROCESSINFO
  
Contains information about a running Xbox Tools Framework (XTF) process.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
typedef struct XTFPROCESSINFO {
    DWORD dwProcessId;
    LPCWSTR pszImageFileName;
} XTFPROCESSINFO, *LPXTFPROCESSINFO;  
```
  
<a id="membersSection"></a>
  
### Members
  
*dwProcessId*  
Type: DWORD  
  
Identifier of the process.  
  
*pszImageFileName*  
Type: LPCWSTR  
  
Pointer to the filename of the process image.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This structure represents the process ID and filename of the process image for a running process on a development console. The [IXtfConsoleControlClient::GetRunningProcesses](../interfaces/IXtfConsoleControlClient/methods/ixtfconsolecontrolclient_getrunningprocesses.md) function provides a pointer to an `XTFPROCESSINFO` structure when the function invokes an implemented [IXtfRunningProcessCallback::OnFoundProcess](ixtfrunningprocesscallback_onfoundprocess.md
) callback function for each running process on a development console. For more information about listing running processes using Xbox Tools Framework (XTF), see [Process list (xbtlist.exe) (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbtlist.md).  
  
<a id="requirements"></a>
  
## Requirements
  
**Header:** xtfconsolecontrol.h  
  
**Library:** xtfconsolecontrol.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[XtfConsoleControl](../xtfconsolecontrol_members.md)  
[Xbox Tools Framework native API reference](../../atoc-xtf-native.md)  
  