---
author: aablackm
title: QueryConnectedStandby
description: Determines whether the current development console is in Connected Standby mode.
ms.assetid: M:Windows.Xbox.xtfconsolecontrol.IXtfConsoleControlClient.QueryConnectedStandby(BOOL,BOOL)
kindex:
- QueryConnectedStandby method
- IXtfConsoleControlClient--QueryConnectedStandby method
ms.author: scotmi
ms.topic: reference
edited: 07/24/2020
security: public
---

# IXtfConsoleControlClient::QueryConnectedStandby
  
Determines whether the current development console is in Connected Standby mode.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT QueryConnectedStandby(
         BOOL *pfIsInConnectedStandby,  
         BOOL *pfAllowsInstantOn  
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pfIsInConnectedStandby*  
Type: BOOL\*  
  
A pointer to a Boolean value that is set to TRUE if the console is currently in Connected Standby mode; FALSE otherwise.  
  
*pfAllowsInstantOn*  
Type: BOOL\*  
  
A pointer to a Boolean value that is set to TRUE if the console currently allows Instant On; FALSE otherwise.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function determines whether the current development console is in Connected Standby mode, and whether the power mode for the console is set to support Instant On. If you need to also determine whether the console supports Xbox app connections, use the [IXtfConsoleControlClient::QueryConnectedStandbyEx](ixtfconsolecontrolclient_queryconnectedstandbyex.md) function instead.  
  
For more information about querying power mode options using Xbox Tools Framework (XTF), see [Reboot (xbreboot.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbreboot.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolecontrol.h  
  
**Library:** xtfconsolecontrol.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfConsoleControlClient](../ixtfconsolecontrolclient.md)  
[XtfConsoleControl](../../../xtfconsolecontrol_members.md)  
  