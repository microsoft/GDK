---
author: aablackm
title: IXtfInputClient Interface (Interface contents)
description: Represents an XTF input client.
ms.assetid: T:Windows.Xbox.xtfinput.IXtfInputClient
kindex: IXtfInputClient interface, about
ms.author: stevenpr
ms.topic: navigation
edited: 00/00/0000
security: public
---

# IXtfInputClient Interface
Represents an XTF input client.
<a id="syntaxSection"></a>

## Syntax  

```cpp
interface IXtfInputClient : public IUnknown  
```

  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [ConnectGamepad](methods/connectgamepad-ixtfinputclient-xtfinput-xbox-windows-m.md) | Creates a virtual controller, and gets the device identifier for it. |  
| [DisconnectAllGamepads](methods/disconnectallgamepads-ixtfinputclient-xtfinput-xbox-windows-m.md) | Disconnects all virtual controllers simulated by this XtfInputClient instance. |  
| [DisconnectGamepad](methods/disconnectgamepad-ixtfinputclient-xtfinput-xbox-windows-m.md) | Disconnects a specified virtual controller. |  
| [SendGamepadReport](methods/sendgamepadreport-ixtfinputclient-xtfinput-xbox-windows-m.md) | Sends a controller state report to the console. |  
| [SendGamepadReportEx](methods/ixtfinputclient_sendgamepadreportex.md) | Sends a controller state report to the console. |  


<a id="requirements"></a>

## Remarks

**IXtfInputClient** is used to create create, disconnect, and send game reports to a virtual controller on a development console. You can automate unit tests, stress tests, long-haul tests, and user tests by programmatically simulating gamepad input. To create an instance of **IXtfInputClient** call [XtfCreateInputClient](../../methods/xtfcreateinputclient-xtfinput-xbox-windows-m.md)

## Requirements  

**Header:** xtfinput.h  

**Library:** xtfinput.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4E2"></a>

## See also

[XtfInput](../../xtfinput-xbox-microsoft-n.md)  
[XtfCreateInputClient](../../methods/xtfcreateinputclient-xtfinput-xbox-windows-m.md)  