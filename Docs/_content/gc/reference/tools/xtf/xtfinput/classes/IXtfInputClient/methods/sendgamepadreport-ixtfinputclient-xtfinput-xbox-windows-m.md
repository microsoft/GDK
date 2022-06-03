---
author: aablackm
title: SendGamepadReport
description: Sends a controller state report to the console.
ms.assetid: M:Windows.Xbox.xtfinput.IXtfInputClient.SendGamepadReport(UINT64,GAMEPAD_REPORT)
kindex:
- SendGamepadReport method
- IXtfInputClient--SendGamepadReport method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfInputClient::SendGamepadReport Method
Sends a controller state report to the console.
<a id="syntaxSection"></a>



## Syntax  

```cpp
public:
HRESULT SendGamepadReport(
         UINT64 controllerId,
         GAMEPAD_REPORT report
)  
```

<a id="ID4EG"></a>



### Parameters  

*controllerId*  
Type: UINT64 

The device identifier of this [IXtfInputClient](../ixtfinputclient-xtfinput-xbox-windows-t.md).  
The controller ID is the controller ID returned by [IXtfInputClient::ConnectGamepad](connectgamepad-ixtfinputclient-xtfinput-xbox-windows-m.md).

*report*  
Type: GAMEPAD_REPORT 

The controller state to report

<a id="ID4EP"></a>



### Return value  
Type: HRESULT 

HRESULT success or error code.
<a id="remarks"></a>



## Remarks  

The **SendGameReport** method sends a controller state represented by a [GAMEPAD_REPORT](../../../structures/GAMEPAD_REPORT-xtfinput-xbox-windows-t.md) to a virtual controller created by [IXtfInputClient::ConnectGamepad](connectgamepad-ixtfinputclient-xtfinput-xbox-windows-m.md). You will need to send multiple states to simulate a single button press and release. To simulate a button press, call **SendGamepadReport** with the appropriate flag set in [GAMEPAD_REPORT.Buttons](../../../structures/GAMEPAD_REPORT-xtfinput-xbox-windows-t.md), wait for 250ms, and then call **SendGamepadReport** again, with [GAMEPAD_REPORT.Buttons](../../../structures/GAMEPAD_REPORT-xtfinput-xbox-windows-t.md) set to [GAMEPAD_BUTTONS::NONE](../../../enumerations/GAMEPAD_BUTTONS-typedef---xtfinput-xbox-windows-t.md).  

If you call **SendGamepadReport** too frequently, the console will not respond to virtual controller state changes. Your code should not call **SendGamepadReport** more than once every 250ms.   

<a id="requirements"></a>


## Requirements  

**Header:** xtfinput.h  

**Library:** xtfinput.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also
[XtfInput](../../../xtfinput-xbox-microsoft-n.md)  
[GAMEPAD_REPORT](../../../structures/GAMEPAD_REPORT-xtfinput-xbox-windows-t.md)  
[IXtfInputClient::ConnectGamepad](connectgamepad-ixtfinputclient-xtfinput-xbox-windows-m.md)  