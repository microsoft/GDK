---
author: aablackm
title: RemoveConsole
description: Removes the development console with the specified name from the [IXtfConsoleManager](../ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance.
ms.assetid: M:Windows.Xbox.xtfconsolemanager.IXtfConsoleManager.RemoveConsole(LPCWSTR)
kindex:
- RemoveConsole method
- IXtfConsoleManager--RemoveConsole method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfConsoleManager::RemoveConsole Method
  
Removes the development console with the specified name from the [IXtfConsoleManager](../ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT RemoveConsole(
         LPCWSTR pszAlias
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszAlias*  
Type: LPCWSTR  
  
A pointer to the name of the development console to remove.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method removes the development console with the name specified in `pszAlias` from the [IXtfConsoleManager](../ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance.  
  
After this method is successfully called, the `IXtfConsoleManager` instance invokes the [OnRemoveConsole](../../IXtfConsoleManagerCallback/methods/onremoveconsole-ixtfconsolemanagercallback-xtfconsolemanager-xbox-microso.md) callback method from the associated [IXtfConsoleManagerCallback](../../IXtfConsoleManagerCallback/ixtfconsolemanagercallback-xtfconsolemanager-xbox-microsoft-t.md) instance. If the default development console is removed, the [OnChangedDefaultConsole](../../IXtfConsoleManagerCallback/methods/onchangeddefaultconsole-ixtfconsolemanagercallback-xtfconsolemanager-xbox.md) callback method from the associated `IXtfConsoleManagerCallback` instance is also invoked.  
  
For more information about connecting and querying development consoles, see [Connect (xbconnect.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbconnect.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolemanager.h  
  
**Library:** xtfconsolemanager.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfConsoleManager Interface](../ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md)  
[XtfConsoleManager](../../../xtfconsolemanager-xbox-microsoft-n.md)  
  