---
author: aablackm
title: IXtfConfigSettingsCallback (Interface contents)
description: Callback used by the XtfConfigSettings.GetConfigSettings.
ms.assetid: T:Windows.Xbox.xtfconsolecontrol.IXtfConfigSettingsCallback
kindex: IXtfConfigSettingsCallback interface, about
ms.author: stevenpr
ms.topic: navigation
edited: 00/00/0000
security: public
---

# IXtfConfigSettingsCallback  

Callback used by the XtfConfigSettings.GetConfigSettings.  

<a id="syntaxSection"></a>



## Syntax  

```cpp
class IXtfConfigSettingsCallback : public IUnknown  
```

  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [OnFoundSetting](methods/ixtfconfigsettingscallback_onfoundsetting.md) | Callback function called when a configuration setting is being reported. |  
  

## Requirements  

**Header:** xtfconsolecontrol.h  

**Library:** xtfconsolecontrol.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also  
[xtfconsolecontrol](../../xtfconsolecontrol_members.md)  