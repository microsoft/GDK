---
author: aablackm
title: Unconstrain
description: Returns the constrained app with the specified package moniker to the regular running state.
ms.assetid: M:Windows.Xbox.xtfapplication.IXtfApplicationClient.Unconstrain(LPCWSTR)
kindex:
- Unconstrain method
- IXtfApplicationClient--Unconstrain method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfApplicationClient::Unconstrain
  
Returns the constrained app with the specified package moniker to the regular running state.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT Unconstrain(
         LPCWSTR pszPackageMoniker
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszPackageMoniker*  
Type: LPCWSTR  
  
A pointer to the package moniker of the constrained app to return to the regular running state.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method returns the constrained app with the specified package moniker to the regular running state, with full access to resources. This method is similar to the `xbapp unconstrain` command from the Application Management (xbapp.exe) tool, included as part of the Xbox Tools Framework (XTF). For more information about the `xbapp unconstrain` command, see [Application Management (xbapp.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md).  
  
For more information about game life cycle states, see [Xbox Game Life Cycle (NDA topic)](../../../../../../../system/overviews/xbox-game-life-cycle.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapplication.h  
  
**Library:** xtfapplication.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also  
  
[Constrain](constrain-ixtfapplicationclient-xtfapplication-xbox-windows-m.md)  
[IXtfApplicationClient](../ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md)  
[XtfApplication](../../../xtfapplication-xbox-microsoft-n.md)  
  