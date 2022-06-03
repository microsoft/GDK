---
author: aablackm
title: XtfConsoleManager (API contents)
description: The XTF API that is used to get the default development console or to manage a collection of development consoles.
ms.assetid: N:Windows.Xbox.xtfconsolemanager
kindex: XtfConsoleManager
ms.author: stevenpr
ms.topic: navigation
edited: 01/06/2020
security: public
---

# XtfConsoleManager


The Xbox Tools Framework (XTF) API that is used to get the default development console or to manage a collection of development consoles.   

<a id="interfacesSection"></a>



  
## Interfaces  
  
| Interface | Description |  
| --- | --- |  
| [IXtfConsoleManager](classes/IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) | Manages development consoles for Xbox Tools Framework (XTF) apps. |  
| [IXtfConsoleManagerCallback](classes/IXtfConsoleManagerCallback/ixtfconsolemanagercallback-xtfconsolemanager-xbox-microsoft-t.md) | Provides callbacks that are used when a development console in an [IXtfConsoleManager](classes/IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance is added or removed, or when the default development console is changed. |  
| [IXtfEnumerateConsolesCallback](classes/IXtfEnumerateConsolesCallback/ixtfenumerateconsolescallback-xtfconsolemanager-xbox-microsoft-t.md) | Provides callbacks that are used when a development console is found during an [IXtfConsoleManager::EnumerateConsoles](classes/IXtfConsoleManager/methods/enumerateconsoles-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md) operation. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XtfCreateConsoleManager](methods/xtfcreateconsolemanager-xtfconsolemanager-xbox-microsoft-m.md) | Initializes a new instance of the [IXtfConsoleManager](classes/IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) interface. |  
| [XtfGetDefaultAddress](methods/xtfgetdefaultaddress-xtfconsolemanager-xbox-windows-m.md) | Returns the IP address of the default development console for this PC. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XTFCONSOLEDATA](structures/xtfconsoledata-xtfconsolemanager-xbox-microsoft-t.md) | Contains information about a development console in an [IXtfConsoleManager](classes/IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance. |  
  



To create an object that implements the IXtfConsoleManager interface, call [XtfCreateConsoleManager](methods/xtfcreateconsolemanager-xtfconsolemanager-xbox-microsoft-m.md).   


To retrieve the IP address of the default console for a development PC, call [XtfGetDefaultAddress](methods/xtfgetdefaultaddress-xtfconsolemanager-xbox-windows-m.md) from that PC.   