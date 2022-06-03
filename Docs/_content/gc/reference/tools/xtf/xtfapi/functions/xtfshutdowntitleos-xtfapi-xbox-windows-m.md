---
author: aablackm
title: XtfShutdownTitleOS
description: Shuts down the active title and Game OS.
kindex: XtfShutdownTitleOS
ms.author: zhooper
ms.topic: reference
edited: 04/15/2020
security: public
---

# XtfShutdownTitleOS
  
Shuts down the active title and Game OS.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XXtfShutdownTitleOS(
         PCWSTR address
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*address*  
Type: PCWSTR  
  
\[in\] The address of the console.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function shuts down both the active title and the Game OS. Unlike the [IXtfApplicationClient::Terminate](../../xtfapplication/classes/IXtfApplicationClient/methods/terminate-ixtfapplicationclient-xtfapplication-xbox-microsoft-m.md) method, this function ignores Fast Iteration Mode and fully terminates both the active title and the Game OS. For more information about Fast Iteration Mode, see [Application Management (xbapp.exe) (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md) and [Managing applications and files (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/xbom/manager-tool-managing-applications.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapi.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also  
  
[Run from PC Deployment (NDA topic)](../../../../../tools-console/usinggsdk/deployment/deployment.md)  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
  