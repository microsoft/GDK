---
author: aablackm
title: XtfConsoleControl (API contents)
description: The XTF API that is used to get information about and manage a development console.
ms.assetid: N:Windows.Xbox.xtfconsolecontrol
kindex: XtfConsoleControl
ms.author: stevenpr
ms.topic: navigation
edited: 00/00/0000
security: public
---

# XtfConsoleControl  


The Xbox Tools Framework (XTF) API that is used to get information about and manage a development console.   

  
## Interfaces  
  
| Interface | Description |  
| --- | --- |  
| [IXtfConfigSettingsCallback](interfaces/IXtfConfigSettingsCallback/ixtfconfigsettingscallback.md) | Callback used by the XtfConfigSettings.GetConfigSettings. |  
| [IXtfConsoleControlClient](interfaces/IXtfConsoleControlClient/ixtfconsolecontrolclient.md) | Represents an Xbox Tools Framework (XTF) development console client. |  
| [IXtfRunningProcessCallback](interfaces/IXtfRunningProcessCallback/ixtfrunningprocesscallback.md) | Provides a callback that is called when a running process is found during an IXtfConsoleControlClient::GetRunningProcesses Method operation. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XtfCaptureScreenshot](functions/xtfcapturescreenshot.md) | Captures the current screen display of the specified development console as a bitmap. |  
| [XtfCreateConsoleControlClient](functions/xtfcreateconsolecontrolclient-xtfconsolecontrol-xbox-microsoft-m.md) | Initializes a new instance of the IXtfConsoleControlClient interface with the specified address. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XTFCONFIGSETTING](structs/xtfconfigsetting.md) | Describes a configuration setting for a console. |  
| [XTFPROCESSINFO](structs/xtfprocessinfo.md) | Contains information about a running Xbox Tools Framework (XTF) process. |  
| [XTFSYSTEMTIME](structs/xtfsystemtime.md) | Contains system time information for Xbox Tools Framework (XTF) apps. |  
