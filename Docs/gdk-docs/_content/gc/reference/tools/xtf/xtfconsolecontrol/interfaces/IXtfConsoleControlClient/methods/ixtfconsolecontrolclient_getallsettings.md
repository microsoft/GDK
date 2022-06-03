---
author: aablackm
title: GetAllSettings
description: Returns settings for the current console.
ms.assetid: M:Windows.Xbox.xtfconsolecontrol.IXtfConsoleControlClient.GetAllSettings(XTFCONFIGSETTING,int)
kindex:
- GetAllSettings method
- IXtfConsoleControlClient--GetAllSettings method
ms.author: stevenpr
ms.topic: reference
edited: 07/24/2020
security: public
---

# IXtfConsoleControlClient::GetAllSettings
  
Returns settings for the current console.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT GetAllSettings(
         XTFCONFIGSETTING **pConfigSettings,
         int *count
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pConfigSettings*  
Type: [XTFCONFIGSETTING](../../../structs/xtfconfigsetting.md)\*\*
  
A pointer to an array of [XTFCONFIGSETTING](../../../structs/xtfconfigsetting.md) structures describing the settings.  
  
*count*  
Type: int\*  
  
The number of elements in the *pConfigSettings* array.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function returns all of the configuration settings on the current development console. The configuration settings are retrieved as an array of [XTFCONFIGSETTING](../../../structs/xtfconfigsetting.md) structures, each of which contains the name and current value of the configuration setting.  
  
You can also use the [IXtfConsoleControlClient::GetConfigSettings](ixtfconsolecontrolclient_getconfigsettings.md) function to iterate over the configuration settings on the current console and invoke an [IXtfConfigSettingsCallback::OnFoundSetting](../../IXtfConfigSettingsCallback/methods/ixtfconfigsettingscallback_onfoundsetting.md) callback function implemented in your app for each configuration setting. For more information about accessing configuration settings using Xbox Tools Framework (XTF), see [Configuration (xbconfig.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbconfig.md).
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolecontrol.h  
  
**Library:** xtfconsolecontrol.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfConfigSettingsCallback::OnFoundSetting](../../IXtfConfigSettingsCallback/methods/ixtfconfigsettingscallback_onfoundsetting.md)  
[IXtfConsoleControlClient::GetConfigSettings](ixtfconsolecontrolclient_getconfigsettings.md)  
[IXtfConsoleControlClient](../ixtfconsolecontrolclient.md)  
[XtfConsoleControl](../../../xtfconsolecontrol_members.md)  
  