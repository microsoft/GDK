---
author: aablackm
title: IXtfConsoleManager Interface (Interface contents)
description: Manages development consoles for Xbox Tools Framework (XTF) apps.
ms.assetid: T:Windows.Xbox.xtfconsolemanager.IXtfConsoleManager
kindex: IXtfConsoleManager interface, about
ms.author: stevenpr
ms.topic: navigation
edited: '08/24/2020'
security: public
---

# IXtfConsoleManager Interface
  
Manages development consoles for Xbox Tools Framework (XTF) apps.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
interface IXtfConsoleManager : public IUnknown  
```
  
  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [AddConsole](methods/addconsole-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md) | Adds a development console to the [IXtfConsoleManager](ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance. |  
| [EnumerateConsoles](methods/enumerateconsoles-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md) | Enumerates the development consoles in the [IXtfConsoleManager](ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance. |  
| [GetConsole](methods/getconsole-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md) | Gets information about a development console with the specified name from the [IXtfConsoleManager](ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance. |  
| [GetDefaultConsole](methods/getdefaultconsole-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md) | Gets information about the default development console from the [IXtfConsoleManager](ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance. |  
| [RemoveConsole](methods/removeconsole-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md) | Removes the development console with the specified name from the [IXtfConsoleManager](ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance. |  
| [SetDefaultConsole](methods/setdefaultconsole-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md) | Sets the default development console for Xbox Tools Framework (XTF) tools and API. |  

  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolemanager.h  
  
**Library:** xtfconsolemanager.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfConsoleManagerCallback Interface](../IXtfConsoleManagerCallback/ixtfconsolemanagercallback-xtfconsolemanager-xbox-microsoft-t.md)  
[IXtfEnumerateConsolesCallback Interface](../IXtfEnumerateConsolesCallback/ixtfenumerateconsolescallback-xtfconsolemanager-xbox-microsoft-t.md)  
[XtfConsoleManager](../../xtfconsolemanager-xbox-microsoft-n.md)  
  