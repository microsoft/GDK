---
author: aablackm
title: SendGamepadReportEx
description: Sends a controller state report to the console.
kindex: IXtfInputClient::SendGamepadReportEx
ms.author: stevenpr
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
---

# IXtfInputClient::SendGamepadReportEx  

Sends a controller state report to the console.    

## Syntax  
  
```cpp
HRESULT SendGamepadReportEx(  
         UINT64 controllerId,  
         GAMEPAD_REPORT_EX report  
)  
```  
  
### Parameters  
  
*controllerId* &nbsp;&nbsp;  
Type: UINT64  
  
The device identifier of this [IXtfInputClient](../ixtfinputclient-xtfinput-xbox-windows-t.md).  
The controller ID is the controller ID returned by [IXtfInputClient::ConnectGamepad](connectgamepad-ixtfinputclient-xtfinput-xbox-windows-m.md).
  
*report* &nbsp;&nbsp;  
Type: [GAMEPAD_REPORT_EX](../../../structures/gamepad_report_ex.md)  
  
The controller state to report.
  
  
### Return value  
Type: HRESULT
  
HRESULT success or error code.
  
## Requirements  
  
**Header:** XtfInput.h
  
**Library:** xtfinput.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also  
[XtfInput](../../../xtfinput-xbox-microsoft-n.md)  
[GAMEPAD_REPORT_EX](../../../structures/gamepad_report_ex.md)  
[IXtfInputClient::ConnectGamepad](connectgamepad-ixtfinputclient-xtfinput-xbox-windows-m.md)  
  