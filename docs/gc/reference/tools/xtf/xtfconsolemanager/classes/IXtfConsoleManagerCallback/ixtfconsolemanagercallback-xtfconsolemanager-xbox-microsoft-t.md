---
author: aablackm
title: IXtfConsoleManagerCallback Interface (Interface contents)
description: Provides callbacks that are used when a development console in an [IXtfConsoleManager](../IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance is added or removed, or when the default development console is changed.
ms.assetid: T:Windows.Xbox.xtfconsolemanager.IXtfConsoleManagerCallback
kindex: IXtfConsoleManagerCallback interface, about
ms.author: stevenpr
ms.topic: navigation
edited: '08/24/2020'
security: public
---

# IXtfConsoleManagerCallback Interface
  
Provides callbacks that are used when a development console in an [IXtfConsoleManager](../IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance is added or removed, or when the default development console is changed.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
interface IXtfConsoleManagerCallback : public IUnknown  
```
  
  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [OnAddConsole](methods/onaddconsole-ixtfconsolemanagercallback-xtfconsolemanager-xbox-microsoft-.md) | Called when a development console is added to an [IXtfConsoleManager](../IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance. |  
| [OnChangedDefaultConsole](methods/onchangeddefaultconsole-ixtfconsolemanagercallback-xtfconsolemanager-xbox.md) | Called when a development console is set as the default development console in an [IXtfConsoleManager](../IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance. |  
| [OnRemoveConsole](methods/onremoveconsole-ixtfconsolemanagercallback-xtfconsolemanager-xbox-microso.md) | Called when a development console is removed from an [IXtfConsoleManager](../IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance. |  

  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolemanager.h  
  
**Library:** xtfconsolemanager.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfConsoleManager Interface](../IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md)  
[XtfConsoleManager](../../xtfconsolemanager-xbox-microsoft-n.md)  
  