---
author: aablackm
title: XTFCONFIGSETTING
description: Describes a configuration setting for a console.
ms.assetid: T:Windows.Xbox.xtfconsolecontrol.XTFCONFIGSETTING
kindex: XTFCONFIGSETTING structure
ms.author: stevenpr
ms.topic: reference
edited: 06/29/2020
security: public
---

# XTFCONFIGSETTING  
  
Describes a configuration setting for a console.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
typedef struct XTFCONFIGSETTING {
    LPCWSTR pszSettingName;
    LPCWSTR pszSettingValue;
} XTFCONFIGSETTING, *PXTFCONFIGSETTING;  
```
  
<a id="membersSection"></a>
  
### Members
  
*pszSettingName*  
Type: LPCWSTR  
  
Name of the setting.  
  
*pszSettingValue*  
Type: LPCWSTR  
  
Value of the setting.
  
<a id="remarksSection"></a>
  
## Remarks
  
This structure represents the name and value of a single configuration setting on a development console. The [IXtfConsoleControlClient::GetConfigSettings](../interfaces/IXtfConsoleControlClient/methods/ixtfconsolecontrolclient_getconfigsettings.md) function provides a pointer to an `XTFCONFIGSETTING` structure when it invokes an implemented [IXtfConfigSettingsCallback::OnFoundSetting](../interfaces/IXtfConfigSettingsCallback/methods/ixtfconfigsettingscallback_onfoundsetting.md) callback function for each configuration setting on a development console. The [IXtfConsoleControlClient::GetAllSettings](../interfaces/IXtfConsoleControlClient/methods/ixtfconsolecontrolclient_getallsettings.md) method returns an array of `XTFCONFIGSETTING` structures for all configuration settings on a development console. For more information about accessing configuration settings using Xbox Tools Framework (XTF), see [Configuration (xbconfig.exe) (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbconfig.md).  
  
<a id="requirements"></a>
  
## Requirements
  
**Header:** xtfconsolecontrol.h  
  
**Library:** xtfconsolecontrol.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[XtfConsoleControl](../xtfconsolecontrol_members.md)  
[Xbox Tools Framework native API reference](../../atoc-xtf-native.md)  
  