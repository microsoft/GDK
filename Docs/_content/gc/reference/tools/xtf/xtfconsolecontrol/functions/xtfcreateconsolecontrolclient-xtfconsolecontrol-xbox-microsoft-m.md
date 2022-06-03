---
author: aablackm
title: XtfCreateConsoleControlClient
description: Initializes a new instance of the IXtfConsoleControlClient interface with the specified address.
ms.assetid: M:Windows.Xbox.xtfconsolecontrol.XtfCreateConsoleControlClient(LPCWSTR,REFIID,void)
kindex: XtfCreateConsoleControlClient
ms.author: stevenpr
ms.topic: reference
edited: 07/24/2020
security: public
---

# XtfCreateConsoleControlClient
  
Initializes a new instance of the [IXtfConsoleControlClient](../interfaces/IXtfConsoleControlClient/ixtfconsolecontrolclient.md) interface with the specified address.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfCreateConsoleControlClient(
         LPCWSTR pszAddress,
         REFIID riid,
         void **ppvObject
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszAddress*  
Type: LPCWSTR  
  
A pointer to the tools IP address of the development console to use for the new [IXtfConsoleControlClient](../interfaces/IXtfConsoleControlClient/ixtfconsolecontrolclient.md) instance.  
  
*riid*  
Type: REFIID  
  
The pointer to receive the instance identifier of the newly created [IXtfConsoleControlClient](../interfaces/IXtfConsoleControlClient/ixtfconsolecontrolclient.md) instance.  
  
*ppvObject*  
Type: void\*\*
  
The pointer to receive a reference to the newly created [IXtfConsoleControlClient](../interfaces/IXtfConsoleControlClient/ixtfconsolecontrolclient.md) instance.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function creates and attaches a new instance of [IXtfConsoleControlClient](../interfaces/IXtfConsoleControlClient/ixtfconsolecontrolclient.md) to the console specified in `pszAddress`. You can then use the new `IXtfConsoleControlClient` instance to retrieve information, such as configuration settings, system time, or currently running processes, from the console. You can also set configuration values, generate stack dumps, or shut down the console.  
  
For more information about available tool and automation APIs, such as Xbox Tools Framework (XTF), see [Tool and automation APIs (NDA topic)](../../../../../test-automation-publishing/test-automation-publishing-tools/tools-automation-apis/atoc-api-tools-dev-env.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolecontrol.h  
  
**Library:** xtfconsolecontrol.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[XtfConsoleControl](../xtfconsolecontrol_members.md)  
[Xbox Tools Framework](../../atoc-xbox-tools-framework.md)  
  