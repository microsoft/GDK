---
author: aablackm
title: Launch
description: Launches the app with the specified AUMID and command-line arguments.
ms.assetid: M:Windows.Xbox.xtfapplication.IXtfApplicationClient.Launch(LPCWSTR)
kindex:
- Launch method
- IXtfApplicationClient--Launch method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfApplicationClient::Launch
  
Launches the app with the specified AUMID and command-line arguments.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT Launch(
         LPCWSTR pszAumid
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszAumid*  
Type: LPCWSTR  
  
A pointer to a string that contains the AUMID of the app that is to launch and any command-line arguments, delimited by spaces; for example, "myAumid arg1 arg2 arg3".  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method launches the app with the AUMID specified in `pszAumid`. This method is similar to the `xbapp launch` command from the Application Management (xbapp.exe) tool,  included as part of the Xbox Tools Framework (XTF). For more information about the `xbapp launch` command, see [Application Management (xbapp.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md).  
  
For more information about game life cycle states, see [Xbox Game Life Cycle (NDA topic)](../../../../../../../system/overviews/xbox-game-life-cycle.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapplication.h  
  
**Library:** xtfapplication.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfApplicationClient Interface](../ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md)  
[XtfApplication](../../../xtfapplication-xbox-microsoft-n.md)  
  