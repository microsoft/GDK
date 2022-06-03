---
author: aablackm
title: QueryConnectedStandbyEx
description: Determines whether the current development console is in Connected Standby mode and allows Xbox app connections.
ms.assetid: M:Windows.Xbox.xtfconsolecontrol.IXtfConsoleControlClient.QueryConnectedStandbyEx(BOOL,BOOL,BOOL)
kindex:
- QueryConnectedStandbyEx method
- IXtfConsoleControlClient--QueryConnectedStandbyEx method
ms.author: scotmi
ms.topic: reference
edited: 07/24/2020
security: public
---

# IXtfConsoleControlClient::QueryConnectedStandbyEx
  
Determines whether the current development console is in Connected Standby mode and allows Xbox app connections.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT QueryConnectedStandbyEx(
         BOOL *pfIsInConnectedStandby,  
         BOOL *pfAllowsInstantOn,  
         BOOL *pfAllowsXboxAppConnections  
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
  
*pfAllowsXboxAppConnections*  
Type: BOOL\*  
  
A pointer to a Boolean value that is set to TRUE if the console currently allows Xbox app connections; FALSE otherwise.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function determines whether the current development console is in Connected Standby mode, whether the power mode for the console is set to support Instant On, and whether the console supports Xbox app connections. If you don't need to determine whether the console can support Xbox app connections, you can use the [IXtfConsoleControlClient::QueryConnectedStandby](ixtfconsolecontrolclient_queryconnectedstandby.md) function instead.  
  
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
  