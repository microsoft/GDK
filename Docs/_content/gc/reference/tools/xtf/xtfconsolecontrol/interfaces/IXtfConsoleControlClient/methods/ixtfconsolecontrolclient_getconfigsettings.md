---
author: aablackm
title: GetConfigSettings
description: Causes all configuration settings to be enumerated, invoking a callback for each configuration setting.
ms.assetid: M:Windows.Xbox.xtfconsolecontrol.IXtfConsoleControlClient.GetConfigSettings(IXtfConfigSettingsCallback)
kindex:
- GetConfigSettings method
- IXtfConsoleControlClient--GetConfigSettings method
ms.author: stevenpr
ms.topic: reference
edited: 07/24/2020
security: public
---

# IXtfConsoleControlClient::GetConfigSettings
  
Causes all configuration settings to be enumerated, invoking a callback for each configuration setting.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT GetConfigSettings(
         IXtfConfigSettingsCallback *pCallback
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pCallback*  
Type: [IXtfConfigSettingsCallback](../../IXtfConfigSettingsCallback/ixtfconfigsettingscallback.md)\*
  
A pointer to an instance of the [IXtfConfigSettingsCallback](../../IXtfConfigSettingsCallback/ixtfconfigsettingscallback.md) interface, to be invoked as each configuration setting is enumerated.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function causes the Xbox Tools Framework (XTF) API to enumerate all of the configuration settings on the current development console. When a configuration setting is found, the XTF API invokes the [OnFoundSetting](../../IXtfConfigSettingsCallback/methods/ixtfconfigsettingscallback_onfoundsetting.md) callback function from the [IXtfConfigSettingsCallback](../../IXtfConfigSettingsCallback/ixtfconfigsettingscallback.md) interface implemented in your app and specified in `pCallback`. The XTF API passes a pointer to an [XTFCONFIGSETTING](../../../structs/xtfconfigsetting.md) structure, describing the configuration setting, when it invokes your implemented `OnFoundSetting` function.  
  > [!NOTE]
> Memory for the [XTFCONFIGSETTING](../../../structs/xtfconfigsetting.md) structure is owned by the Xbox Tools Framework (XTF) API and is invalidated after each invocation of your [IXtfConfigSettingsCallback::OnFoundSetting](../../IXtfConfigSettingsCallback/methods/ixtfconfigsettingscallback_onfoundsetting.md) callback function. You must copy the information in the structure if you need it for later use.  
  
You can also use the [IXtfConsoleControlClient::GetAllSettings](ixtfconsolecontrolclient_getallsettings.md) method to return an array of `XTFCONFIGSETTING` structures for all configuration settings on the current development console.  
  
For more information about accessing configuration settings using Xbox Tools Framework (XTF), see [Configuration (xbconfig.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbconfig.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolecontrol.h  
  
**Library:** xtfconsolecontrol.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfConfigSettingsCallback::OnFoundSetting](../../IXtfConfigSettingsCallback/methods/ixtfconfigsettingscallback_onfoundsetting.md)  
[IXtfConsoleControlClient::GetAllSettings](ixtfconsolecontrolclient_getallsettings.md)  
[IXtfConsoleControlClient](../ixtfconsolecontrolclient.md)  
[XtfConsoleControl](../../../xtfconsolecontrol_members.md)  
  