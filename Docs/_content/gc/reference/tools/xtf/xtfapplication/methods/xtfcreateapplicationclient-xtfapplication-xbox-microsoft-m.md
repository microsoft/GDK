---
author: aablackm
title: XtfCreateApplicationClient
description: Initializes a new instance of the [IXtfApplicationClient](../classes/IXtfApplicationClient/ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md) interface for the development console with the specified address.
ms.assetid: M:Windows.Xbox.xtfapplication.XtfCreateApplicationClient(LPCWSTR,REFIID,void)
kindex: XtfCreateApplicationClient
ms.author: stevenpr
ms.topic: reference
edited: '08/24/2020'
security: public
---

# XtfCreateApplicationClient
  
Initializes a new instance of the [IXtfApplicationClient](../classes/IXtfApplicationClient/ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md) interface for the development console with the specified address.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfCreateApplicationClient(
         LPCWSTR pszAddress,
         REFIID riid,
         void **ppvObject
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszAddress*  
Type: LPCWSTR  
  
A pointer to the tools IP address of the development console to use for the new [IXtfApplicationClient](../classes/IXtfApplicationClient/ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md).  
  
*riid*  
Type: REFIID  
  
A pointer that receives the instance identifier of the newly created [IXtfApplicationClient](../classes/IXtfApplicationClient/ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md).  
  
*ppvObject*  
Type: void\*\*  
  
A pointer that receives a reference to the newly created [IXtfApplicationClient](../classes/IXtfApplicationClient/ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md).  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function creates and attaches a new instance of [IXtfApplicationClient](../classes/IXtfApplicationClient/ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md) to the development console specified in `pszAddress`. You can then use the new `IXtfApplicationClient` instance for that deployment console to deploy and uninstall apps; launch, terminate, constrain, unconstrain, suspend, resume, and query the execution state of apps; and get and set information about apps.
  
For more information about available tool and automation APIs, such as Xbox Tools Framework (XTF), see [Tool and automation APIs (NDA topic)](../../../../../test-automation-publishing/test-automation-publishing-tools/tools-automation-apis/atoc-api-tools-dev-env.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapplication.h  
  
**Library:** xtfapplication.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfApplicationClient](../classes/IXtfApplicationClient/ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md)  
[XtfApplication](../xtfapplication-xbox-microsoft-n.md)  
  