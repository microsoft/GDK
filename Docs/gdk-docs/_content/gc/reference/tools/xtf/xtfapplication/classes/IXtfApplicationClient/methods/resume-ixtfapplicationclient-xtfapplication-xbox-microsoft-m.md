---
author: aablackm
title: Resume
description: Resumes execution of the app with the specified package moniker.
ms.assetid: M:Windows.Xbox.xtfapplication.IXtfApplicationClient.Resume(LPCWSTR)
kindex:
- Resume method
- IXtfApplicationClient--Resume method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfApplicationClient::Resume
  
Resumes execution of the app with the specified package moniker.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT Resume(
         LPCWSTR pszPackageMoniker
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszPackageMoniker*  
Type: LPCWSTR  
  
A pointer to the package moniker of the app to resume.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method resumes execution of all processes for the app with the specified package moniker. This method is similar to the `xbapp resume` command from the Application Management (xbapp.exe) tool, included as part of the Xbox Tools Framework (XTF). For more information about the `xbapp resume` command, see [Application Management (xbapp.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md).  
  
Use this method to resume an app previously suspended by either invoking the [IXtfApplicationClient::Suspend](suspend-ixtfapplicationclient-xtfapplication-xbox-windows-.md
) method or calling the `xbapp suspend` command from the Application Management tool. For more information about game life cycle states, see [Xbox Game Life Cycle (NDA topic)](../../../../../../../system/overviews/xbox-game-life-cycle.md).  
  
<a id="requirementsSection"></a>
  
## Requirements  
  
**Header:** xtfapplication.h  
  
**Library:** xtfapplication.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfApplicationClient Interface](../ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md)  
[XtfApplication](../../../xtfapplication-xbox-microsoft-n.md)  
  