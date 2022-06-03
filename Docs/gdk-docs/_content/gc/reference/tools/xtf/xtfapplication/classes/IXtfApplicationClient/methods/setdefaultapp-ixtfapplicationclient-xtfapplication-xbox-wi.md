---
author: aablackm
title: SetDefaultApp
description: Sets the ID of the application to launch when an activation request is received for a specific title ID.
ms.assetid: M:Windows.Xbox.xtfapplication.IXtfApplicationClient.SetDefaultApp(LPCWSTR,LPCWSTR)
kindex:
- SetDefaultApp method
- IXtfApplicationClient--SetDefaultApp method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfApplicationClient::SetDefaultApp
  
Sets the ID of the application to launch when an activation request is received for a specific title ID.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT SetDefaultApp(
         LPCWSTR pszTitleId,
         LPCWSTR pszAumid
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszTitleId*  
Type: LPCWSTR  
  
The title ID scheme to change the defaults for.  
  
*pszAumid*  
Type: LPCWSTR  
  
A pointer to a string that contains the AUMID of the app to launch.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method sets the ID of the application to launch when an activation request is received for a specific title ID. This method is similar to the `xbapp setdefaultapp` command from the Application Management (xbapp.exe) tool, included as part of the Xbox Tools Framework (XTF). For more information about the `xbapp setdefaultapp` command, see [Application Management (xbapp.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md).  
  > [!NOTE]
> To maximize future compatibility, your tools should use the `xbapp setdefaultapp` command from the Application Management tool, instead of directly invoking this method.  
  
The default App User Model ID (AUMID) specified in `pszAumid` determines which version of an application to launch when a game is launched from the shell or when another app launches the game.  
  > [!NOTE]
> When a title calls [XLaunchNewGame](../../../../../../system/xgame/functions/xlaunchnewgame.md), the default value is temporarily overridden with the AUMID of the currently running version of the title, to ensure that the same version is launched on restart.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapplication.h  
  
**Library:** xtfapplication.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfApplicationClient Interface](../ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md)  
[XtfApplication](../../../xtfapplication-xbox-microsoft-n.md)  
  