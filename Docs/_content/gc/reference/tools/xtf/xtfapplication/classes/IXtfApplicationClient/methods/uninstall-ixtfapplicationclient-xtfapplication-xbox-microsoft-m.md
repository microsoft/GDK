---
author: aablackm
title: Uninstall
description: Uninstalls the app with the specified package moniker.
ms.assetid: M:Windows.Xbox.xtfapplication.IXtfApplicationClient.Uninstall(LPCWSTR)
kindex:
- Uninstall method
- IXtfApplicationClient--Uninstall method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfApplicationClient::Uninstall
  
Uninstalls the app with the specified package moniker.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT Uninstall(
         LPCWSTR pszPackageMoniker
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszPackageMoniker*  
Type: LPCWSTR  
  
A pointer to the package moniker of the app to uninstall.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method uninstalls the app with the specified package name. This method is similar to the `xbapp uninstall` command from the Application Management (xbapp.exe) tool, included as part of the Xbox Tools Framework (XTF). For more information about the `xbapp uninstall` command, see [Application Management (xbapp.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md).  
  
For more information about game life cycle states, see [Xbox Game Life Cycle (NDA topic)](../../../../../../../system/overviews/xbox-game-life-cycle.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapplication.h  
  
**Library:** xtfapplication.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[Deploy](deploy-ixtfapplicationclient-xtfapplication-xbox-microsoft-m.md)  
[IXtfApplicationClient](../ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md)  
[XtfApplication](../../../xtfapplication-xbox-microsoft-n.md)  
  