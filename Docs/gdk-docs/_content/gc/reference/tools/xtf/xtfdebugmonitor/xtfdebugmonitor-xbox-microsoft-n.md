---
author: aablackm
title: XtfDebugMonitor (API contents)
description: The XTF API that is used to receive debug output from an app or game running on a development console.
ms.assetid: N:Windows.Xbox.xtfdebugmonitor
kindex: XtfDebugMonitor
ms.author: stevenpr
ms.topic: navigation
edited: 01/06/2020
security: public
---

# XtfDebugMonitor


Xbox Tools Framework (XTF) API that is used to receive debug output from an app or game running on a development console.   

<a id="interfacesSection"></a>



  
## Interfaces  
  
| Interface | Description |  
| --- | --- |  
| [IXtfDebugMonitorCallback](classes/IXtfDebugMonitorCallback/ixtfdebugmonitorcallback-xtfdebugmonitor-xbox-microsoft-t.md) | Provides a callback that is used when an Xbox Tools Framework (XTF) app sends debug output. |  
| [IXtfDebugMonitorClient](classes/IXtfDebugMonitorClient/ixtfdebugmonitorclient-xtfdebugmonitor-xbox-microsoft-t.md) | Receives debug output from Xbox Tools Framework (XTF) apps. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XtfCreateDebugMonitorClient](methods/xtfcreatedebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md) | Initializes a new instance of the IXtfDebugMonitorClient Interface interface. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XTF_OUTPUT_DEBUG_STRING_DATA structure](structures/XTF_OUTPUT_DEBUG_STRING_DATA-xtfdebugmonitor-xbox-microsoft-t.md) | Contains debug output string data. |  
  


To create an object that implements the IXtfDebugMonitorClient interface, call [XtfCreateDebugMonitorClient](methods/xtfcreatedebugmonitorclient-xtfdebugmonitor-xbox-microsoft-m.md).   