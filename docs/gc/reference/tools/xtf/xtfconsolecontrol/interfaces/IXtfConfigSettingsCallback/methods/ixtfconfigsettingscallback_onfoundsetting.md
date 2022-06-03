---
author: aablackm
title: OnFoundSetting
description: Callback function called when a configuration setting is being reported.
ms.assetid: M:Windows.Xbox.xtfconsolecontrol.IXtfConfigSettingsCallback.OnFoundSetting(PXTFCONFIGSETTING)
kindex:
- OnFoundSetting method
- IXtfConfigSettingsCallback--OnFoundSetting method
ms.author: stevenpr
ms.topic: reference
edited: 01/06/2020
security: public
---

# IXtfConfigSettingsCallback::OnFoundSetting
  
Callback function called when a configuration setting is being reported.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT OnFoundSetting(
         const PXTFCONFIGSETTING pSetting
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pSetting*  
Type: PXTFCONFIGSETTING  
  
A pointer to an [XTFCONFIGSETTING](../../../structs/xtfconfigsetting.md) structure describing a configuration setting.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This callback function is invoked by [IXtfConsoleControlClient::GetConfigSettings](../../IXtfConsoleControlClient/methods/ixtfconsolecontrolclient_getconfigsettings.md) for each configuration setting found on the development console. This function receives a pointer to an [XTFCONFIGSETTING](../../../structs/xtfconfigsetting.md) structure that contains the name and value of a configuration setting. For more information about accessing configuration settings using Xbox Tools Framework (XTF), see [Configuration (xbconfig.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbconfig.md).  
  > [!NOTE]
> Memory for the [XTFCONFIGSETTING](../../../structs/xtfconfigsetting.md) structure is owned by the Xbox Tools Framework (XTF) API and is invalidated after each invocation of this callback function. You must copy the information in the structure if you need it for later use.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolecontrol.h  
  
**Library:** xtfconsolecontrol.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfConfigSettingsCallback](../ixtfconfigsettingscallback.md)  
[XtfConsoleControl](../../../xtfconsolecontrol_members.md)  
[Xbox Tools Framework native API reference](../../../../atoc-xtf-native.md)  
  