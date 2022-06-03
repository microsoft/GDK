---
author: aablackm
title: ShutdownConsole
description: Shuts down the development console.
ms.assetid: M:Windows.Xbox.xtfconsolecontrol.IXtfConsoleControlClient.ShutdownConsole(DWORD)
kindex:
- ShutdownConsole method
- IXtfConsoleControlClient--ShutdownConsole method
ms.author: stevenpr
ms.topic: reference
edited: 07/24/2020
security: public
---

# IXtfConsoleControlClient::ShutdownConsole
  
Shuts down the development console.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT ShutdownConsole(
         DWORD dwFlags
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*dwFlags*  
Type: DWORD  
  
A bitwise-OR combination of flags that specify how to shut down the development console. The following table lists the available flags:  
  
| Value | Constant | Description |  
| ----- | -------- | ----------- |  
| 0x00000001 | XTFSHUTDOWN_REBOOT | Shuts down and reboots the development console. |  
| 0x00000002 | XTFSHUTDOWN_POWER_MODE_AWARE | Shuts down and reboots the development console according to the console's power mode settings. |  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function shuts down the current development console, depending on the combination of flags specified in `dwFlags`. If the system isn't ready to accept a shutdown request at the time the function is invoked, the function includes retry logic, such as attempting to shut down the console using the Host OS as a fallback if the System OS is not accessible. The function attempts to shut down the console until the function either succeeds or times out after 5 minutes and returns an error.  
  
For more information about shutting down and rebooting a console using Xbox Tools Framework (XTF), see [Reboot (xbreboot.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbreboot.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolecontrol.h  
  
**Library:** xtfconsolecontrol.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfConsoleControlClient](../ixtfconsolecontrolclient.md)  
[XtfConsoleControl](../../../xtfconsolecontrol_members.md)  
  