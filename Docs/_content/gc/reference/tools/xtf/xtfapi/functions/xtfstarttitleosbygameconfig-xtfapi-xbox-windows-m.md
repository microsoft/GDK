---
author: aablackm
title: XtfStartTitleOSByGameConfig
description: Starts or restarts the Game OS based on the contents of a MicrosoftGame.config file that is stored in memory as a string.
ms.assetid: M:Windows.Xbox.xtfapi.XtfStartTitleOSByGameConfig(PCWSTR@,UINT32,PCWSTR@)
kindex: XtfStartTitleOSByGameConfig
ms.author: zhooper
ms.topic: reference
edited: 03/27/2020
security: public
---

# XtfStartTitleOSByGameConfig
  
Starts or restarts the Game OS based on the contents of a MicrosoftGame.config file that is stored in memory as a string.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfStartTitleOSByGameConfig(
         PCWSTR address,
         UINT32 flags,
         PCWSTR gameconfigContents
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*address*  
Type: PCWSTR  
  
\[in\] The IP address of the console.  
  
*flags*  
Type: UINT32  
  
\[in\] Currently unused, but reserved for future behavior changes.  
  
*gameconfigContents*  
Type: PCWSTR  
  
\[in\] The contents of a MicrosoftGame.config file.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
Use this function to start or restart the game OS based on the contents of a MicrosoftGame.config file that is stored in memory as a string. If a value for `address` or `gameconfigContents` isn't specified, an error occurs.  
  
For more information about the contents of a MicrosoftGame.config file, see [MicrosoftGame.config Overview](../../../../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Overview.md).
  
<a id="requirements"></a>
  
## Requirements
  
**Header:** xtfapi.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
  