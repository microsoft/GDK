---
author: aablackm
title: Suspend
description: Suspends execution of the app with the specified package moniker.
ms.assetid: M:Windows.Xbox.xtfapplication.IXtfApplicationClient.Suspend(LPCWSTR,BOOL)
kindex:
- Suspend method
- IXtfApplicationClient--Suspend method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfApplicationClient::Suspend
  
Suspends execution of the app with the specified package moniker.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT Suspend(
         LPCWSTR pszPackageMoniker,
         BOOL fAsDebugger
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszPackageMoniker*  
Type: LPCWSTR  
  
A pointer to the package moniker of the app to suspend.  
  
*fAsDebugger*  
Type: BOOL  
  
Specify TRUE to suspend the app with debugging enabled; otherwise, FALSE to disable debugging. For more information about the effects of enabling or disabling debugging, see [DebugEnable](debugenable-ixtfapplicationclient-xtfapplication-xbox-microsoft-m.md).  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method suspends execution of the app with the specified package moniker. This method is similar to the `xbapp suspend` command from the Application Management (xbapp.exe) tool, included as part of the Xbox Tools Framework (XTF). For more information about the `xbapp suspend` command, see [Application Management (xbapp.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md).  
  
You can resume execution of the app by either invoking the [IXtfApplicationClient::Resume](resume-ixtfapplicationclient-xtfapplication-xbox-microsoft-m.md) method or calling the `xbapp resume` command from the Application Management tool. For more information about game life cycle states, see [Xbox Game Life Cycle (NDA topic)](../../../../../../../system/overviews/xbox-game-life-cycle.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapplication.h  
  
**Library:** xtfapplication.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfApplicationClient](../ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md)  
[XtfApplication](../../../xtfapplication-xbox-microsoft-n.md)  
  