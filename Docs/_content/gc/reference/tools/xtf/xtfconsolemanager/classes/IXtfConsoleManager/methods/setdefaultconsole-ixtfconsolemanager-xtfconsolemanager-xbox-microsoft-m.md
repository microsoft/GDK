---
author: aablackm
title: SetDefaultConsole
description: Sets the default development console for Xbox Tools Framework (XTF) tools and API.
ms.assetid: M:Windows.Xbox.xtfconsolemanager.IXtfConsoleManager.SetDefaultConsole(LPCWSTR)
kindex:
- SetDefaultConsole method
- IXtfConsoleManager--SetDefaultConsole method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfConsoleManager::SetDefaultConsole Method
  
Sets the default development console for Xbox Tools Framework (XTF) tools and API.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT SetDefaultConsole(
         LPCWSTR pszAlias
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszAlias*  
Type: LPCWSTR  
  
A pointer to the name of the development console to set as the default development console.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method sets the development console with the alias specified in `pszAlias` from the [IXtfConsoleManager](../ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance as the default development console to use with Xbox Tools Framework (XTF) tools and API on this PC.  
  
After this method is successfully called, the `IXtfConsoleManager` instance invokes the [OnChangedDefaultConsole](../../IXtfConsoleManagerCallback/methods/onchangeddefaultconsole-ixtfconsolemanagercallback-xtfconsolemanager-xbox.md) callback method from the associated [IXtfConsoleManagerCallback](../../IXtfConsoleManagerCallback/ixtfconsolemanagercallback-xtfconsolemanager-xbox-microsoft-t.md) instance.  
  
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
  