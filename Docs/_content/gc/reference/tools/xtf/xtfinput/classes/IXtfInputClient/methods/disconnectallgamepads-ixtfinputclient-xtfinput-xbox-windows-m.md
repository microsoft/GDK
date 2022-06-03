---
author: aablackm
title: DisconnectAllGamepads
description: Disconnects all virtual controllers simulated by this XtfInputClient instance.
ms.assetid: M:Windows.Xbox.xtfinput.IXtfInputClient.DisconnectAllGamepads
kindex:
- DisconnectAllGamepads method
- IXtfInputClient--DisconnectAllGamepads method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
quality: good
---

# IXtfInputClient::DisconnectAllGamepads Method
  
Disconnects all virtual controllers simulated by this [IXtfInputClient](../ixtfinputclient-xtfinput-xbox-windows-t.md) instance.


<a id="syntaxSection"></a>
## Syntax  

```cpp
public:
HRESULT DisconnectAllGamepads()  
```

<a id="ID4EP"></a>

### Return value  
  
Type: HRESULT 

HRESULT success or error code.  

<a id="remarksSection"></a>
## Remarks  
  
Failure to disconnect a created gamepad will result in a memory leak. 
Call `IXtfInputClient::DisconnectAllGamepads` when virtual controller operations are complete to disconnect all controllers to avoid this. 
To disconnect a single virtual controller, call [IXtfInputClient::DisconnectGamepad](disconnectgamepad-ixtfinputclient-xtfinput-xbox-windows-m.md).
  

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