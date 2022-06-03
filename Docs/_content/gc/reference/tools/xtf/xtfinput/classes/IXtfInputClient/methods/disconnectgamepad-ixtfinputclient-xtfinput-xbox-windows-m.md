---
author: aablackm
title: DisconnectGamepad
description: Disconnects a specified virtual controller.
ms.assetid: M:Windows.Xbox.xtfinput.IXtfInputClient.DisconnectGamepad(UINT64)
kindex:
- DisconnectGamepad method
- IXtfInputClient--DisconnectGamepad method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfInputClient::DisconnectGamepad Method
Disconnects a specified virtual controller.
<a id="syntaxSection"></a>



## Syntax  

```cpp
public:
HRESULT DisconnectGamepad(
         UINT64 controllerId
)  
```

<a id="ID4EG"></a>



### Parameters  

*controllerId*  
Type: UINT64 

The device identifier of this [IXtfInputClient](../ixtfinputclient-xtfinput-xbox-windows-t.md).

<a id="ID4EP"></a>



### Return value  
Type: HRESULT 

HRESULT success or error code.
<a id="remarks"></a>



## Remarks  


Call **DisconnectGamepad** when virtual controller operations are complete, to ensure that resources allocated for the virtual controller are freed. Every call to [IXtfInputClient::ConnectGamepad](connectgamepad-ixtfinputclient-xtfinput-xbox-windows-m.md) should be paired with a call to **DisconnectGamepad**. Failure to disconnect a created gamepad will result in a memory leak. You may call [IXtfInputClient::DisconnectAllGamepads](disconnectgamepad-ixtfinputclient-xtfinput-xbox-windows-m.md) to ensure that all virtual controllers are disconnected in order to avoid a memory leak. 

<a id="requirements"></a>



## Requirements  

**Header:** xtfinput.h  

**Library:** xtfinput.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also
[XtfInput](../../../xtfinput-xbox-microsoft-n.md)  
[IXtfInputClient](../ixtfinputclient-xtfinput-xbox-windows-t.md)  
[IXtfInputClient::ConnectGamepad](connectgamepad-ixtfinputclient-xtfinput-xbox-windows-m.md)  
[IXtfInputClient::DisconnectAllGamepads](disconnectgamepad-ixtfinputclient-xtfinput-xbox-windows-m.md)  