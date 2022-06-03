---
author: aablackm
title: GetConfigValue
description: Gets the value of the specified configuration setting.
ms.assetid: M:Windows.Xbox.xtfconsolecontrol.IXtfConsoleControlClient.GetConfigValue(LPCWSTR,LPBSTR)
kindex:
- GetConfigValue method
- IXtfConsoleControlClient--GetConfigValue method
ms.author: stevenpr
ms.topic: reference
edited: 07/24/2020
security: public
---

# IXtfConsoleControlClient::GetConfigValue
  
Gets the value of the specified configuration setting.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT GetConfigValue(
         LPCWSTR pszKey,
         LPBSTR pszValue
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszKey*  
Type: LPCWSTR  
  
A pointer to the name of the configuration setting to get the value of.  
  
*pszValue*  
Type: LPBSTR  
  
The pointer that receives the value of the configuration setting specified in *pszKey*.  
  
<a id="retvalSection"></a>  
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function returns the value of a single configuration setting from the current development console. If `pszKey` is set to the pointer of a string that contains a valid name (or key) of a configuration setting, the function returns `S_OK` and sets `pszValue` to the pointer of a string that contains the value of that configuration setting. Otherwise, the function returns an error.  
  
If you want to enumerate each configuration setting on the current console, you can use the [IXtfConsoleControlClient::GetConfigSettings](ixtfconsolecontrolclient_getconfigsettings.md) function to iterate over the configuration settings and invoke an [IXtfConfigSettingsCallback::OnFoundSetting](../../IXtfConfigSettingsCallback/methods/ixtfconfigsettingscallback_onfoundsetting.md) callback function, implemented in your app, for each configuration setting. You can also use the [IXtfConsoleControlClient::GetAllSettings](ixtfconsolecontrolclient_getallsettings.md) method to return an array of `XTFCONFIGSETTING` structures for all configuration settings on the current development console.  
  
For more information about accessing configuration settings using Xbox Tools Framework (XTF), see [Configuration (xbconfig.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbconfig.md).  
  
<a id="remarks_output"></a>
  
### Handling LPBSTR pointers
  
For more information about handling LPBSTR pointers returned by this function, see [Allocating and Releasing Memory for a BSTR](/cpp/atl-mfc-shared/allocating-and-releasing-memory-for-a-bstr?view=vs-2019).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolecontrol.h  
  
**Library:** xtfconsolecontrol.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfConsoleControlClient](../ixtfconsolecontrolclient.md)  
[XtfConsoleControl](../../../xtfconsolecontrol_members.md)  
  