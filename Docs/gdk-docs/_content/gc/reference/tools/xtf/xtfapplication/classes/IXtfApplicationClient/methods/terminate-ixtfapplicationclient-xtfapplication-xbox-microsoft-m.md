---
author: aablackm
title: Terminate
description: Terminates the app with the specified package moniker.
ms.assetid: M:Windows.Xbox.xtfapplication.IXtfApplicationClient.Terminate(LPCWSTR)
kindex:
- Terminate method
- IXtfApplicationClient--Terminate method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfApplicationClient::Terminate
  
Terminates the app with the specified package moniker.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT Terminate(
         LPCWSTR pszPackageMoniker
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszPackageMoniker*  
Type: LPCWSTR  
  
A pointer to the package moniker of the app to terminate.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method terminates the app with the specified package moniker. This method is similar to the `xbapp terminate` command from the Application Management (xbapp.exe) tool, included as part of the Xbox Tools Framework (XTF). For more information about the `xbapp terminate` command, see [Application Management (xbapp.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md).  
> [!NOTE]
> To simulate the termination sequence performed by a development console, suspend the app for at least one second before terminating it. Immediate termination is a non-standard process that should not be used in test scenarios. For more information about game life cycle states, see [Xbox Game Life Cycle (NDA topic)](../../../../../../../system/overviews/xbox-game-life-cycle.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapplication.h  
  
**Library:** xtfapplication.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfApplicationClient](../ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md)  
[XtfApplication](../../../xtfapplication-xbox-microsoft-n.md)  
  