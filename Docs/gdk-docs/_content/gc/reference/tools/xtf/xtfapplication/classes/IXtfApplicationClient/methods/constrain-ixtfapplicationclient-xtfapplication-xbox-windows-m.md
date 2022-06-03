---
author: aablackm
title: Constrain
description: Places the app with the specified package moniker into constrained mode.
ms.assetid: M:Windows.Xbox.xtfapplication.IXtfApplicationClient.Constrain(LPCWSTR)
kindex:
- Constrain method
- IXtfApplicationClient--Constrain method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfApplicationClient::Constrain
  
Places the app with the specified package moniker into constrained mode.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT Constrain(
         LPCWSTR pszPackageMoniker
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszPackageMoniker*  
Type: LPCWSTR  
  
A pointer to the package moniker for the app that is to be put into constrained mode.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function puts the app specified in `pszPackageMoniker` into constrained mode. While in constrained mode, the app has reduced access to reserved system resources. Use the [Unconstrain](unconstrain-ixtfapplicationclient-xtfapplication-xbox-windows-m.md) method to leave constrained mode and return to full mode. For more information about game life cycle states, see [Xbox Game Life Cycle (NDA topic)](../../../../../../../system/overviews/xbox-game-life-cycle.md).  
  
For more information about how to use Xbox Tools Framework (XTF) to constrain and unconstrain an app for testing, see [Application Management (xbapp.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapplication.h  
  
**Library:** xtfapplication.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfApplicationClient::Unconstrain](unconstrain-ixtfapplicationclient-xtfapplication-xbox-windows-m.md)  
[IXtfApplicationClient](../ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md)  
[XtfApplication](../../../xtfapplication-xbox-microsoft-n.md)  
  