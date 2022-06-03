---
author: aablackm
title: SetConfigValue
description: Sets the value of the specified configuration setting.
ms.assetid: M:Windows.Xbox.xtfconsolecontrol.IXtfConsoleControlClient.SetConfigValue(LPCWSTR,LPCWSTR)
kindex:
- SetConfigValue method
- IXtfConsoleControlClient--SetConfigValue method
ms.author: stevenpr
ms.topic: reference
edited: 07/24/2020
security: public
---

# IXtfConsoleControlClient::SetConfigValue
  
Sets the value of the specified configuration setting.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT SetConfigValue(
         LPCWSTR pszKey,
         LPCWSTR pszValue
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszKey*  
Type: LPCWSTR  
  
A pointer to the name of the configuration setting to set the value of.  
  
*pszValue*  
Type: LPCWSTR  
  
A pointer to the value to set for the configuration setting specified in *pszKey*.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function sets the value of a single configuration setting for the current development console. If `pszKey` is set to the pointer of a string that contains a valid name (or key) of a configuration setting, the function returns `S_OK` and sets the value of the configuration setting to the string at the pointer specified in `pszValue`. Otherwise, the function returns an error.  
  
For more information about accessing configuration settings using Xbox Tools Framework (XTF), see [Configuration (xbconfig.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbconfig.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolecontrol.h  
  
**Library:** xtfconsolecontrol.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfConsoleControlClient::GetConfigValue](ixtfconsolecontrolclient_getconfigvalue.md)  
[IXtfConsoleControlClient](../ixtfconsolecontrolclient.md)  
[XtfConsoleControl](../../../xtfconsolecontrol_members.md)  
  