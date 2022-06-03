---
author: aablackm
title: ConnectGamepad
description: Creates a virtual controller, and gets the device identifier for it.
ms.assetid: M:Windows.Xbox.xtfinput.IXtfInputClient.ConnectGamepad(UINT64)
kindex:
- ConnectGamepad method
- IXtfInputClient--ConnectGamepad method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfInputClient::ConnectGamepad Method
Creates a virtual controller, and gets the device identifier for it.
<a id="syntaxSection"></a>



## Syntax  

```cpp
public:
HRESULT ConnectGamepad(
         UINT64 *pControllerId
)  
```

<a id="ID4EG"></a>



### Parameters  

*pControllerId*  
Type: UINT64 *

Pointer to a UINT64 that receives the device identifier of this [IXtfInputClient](../ixtfinputclient-xtfinput-xbox-windows-t.md).

<a id="ID4EP"></a>



### Return value  
Type: HRESULT 

HRESULT success or error code.
<a id="remarks"></a>



## Remarks  

**ConnectGamepad** allocates system resources for each virtual controller created, as well as returns the identifier for the virtual controller that will be used to send input to a development console with [IXtfInputClient::SendGamepadReport](sendgamepadreport-ixtfinputclient-xtfinput-xbox-windows-m.md). Your code should wait 2 seconds after calling **ConnectGamepad** before calling [SendGamepadReport](sendgamepadreport-ixtfinputclient-xtfinput-xbox-windows-m.md), to ensure that the console has finished registering the new controller and is ready to accept input. Your code should always pair a call to **ConnectGamepad** with a call to [DisconnectGamepad](disconnectgamepad-ixtfinputclient-xtfinput-xbox-windows-m.md) to ensure that these system resources are freed for reuse. You may also call [IXtfInputClient::DisconnectAllGamepads](disconnectgamepad-ixtfinputclient-xtfinput-xbox-windows-m.md) to release all of the virtual controller resources at once.
<a id="requirements"></a>



## Requirements  

**Header:** xtfinput.h  

**Library:** xtfinput.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also
[XtfInput](../../../xtfinput-xbox-microsoft-n.md)  
[IXtfInputClient](../ixtfinputclient-xtfinput-xbox-windows-t.md)  
[IXtfInputClient::ConnectGamepad](connectgamepad-ixtfinputclient-xtfinput-xbox-windows-m.md)  
[IXtfInputClient::DisconnectGamepad](disconnectgamepad-ixtfinputclient-xtfinput-xbox-windows-m.md)  
[IXtfInputClient::DisconnectAllGamepads](disconnectgamepad-ixtfinputclient-xtfinput-xbox-windows-m.md)  