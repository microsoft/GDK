---
author: aablackm
title: AddConsole
description: Adds a development console to the [IXtfConsoleManager](../ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance.
ms.assetid: M:Windows.Xbox.xtfconsolemanager.IXtfConsoleManager.AddConsole(LPCWSTR,LPCWSTR,XTF_ADD_CONSOLE_FLAGS)
kindex:
- AddConsole method
- IXtfConsoleManager--AddConsole method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfConsoleManager::AddConsole method
  
Adds a development console to the [IXtfConsoleManager](../ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance.  
  
<a id="syntaxSection"></a>  
  
## Syntax
  
```cpp
public:
HRESULT AddConsole(
         LPCWSTR pszAlias,
         LPCWSTR pszAddress,
         XTF_ADD_CONSOLE_FLAGS dwFlags
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszAlias*  
Type: LPCWSTR  
  
A pointer to the name of the console to add.  
  
*pszAddress*  
Type: LPCWSTR  
  
A pointer to the Tools IP address of the console to add.  
  
*dwFlags*  
Type: XTF_ADD_CONSOLE_FLAGS  
  
A combination of bitwise-OR flags that specify how to add the console to the instance. The following table describes the available flags.  
  
| Value | Macro | Description |  
| ----- | ----- | ----------- |  
| 0x0 | XTF_ADD_CONSOLE_FLAGS_NONE | No flags are specified. |  
| 0x1 | XTF_ADD_CONSOLE_FLAGS_SETDEFAULT | After the development console is added, set it as the default development console for this PC. |  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method adds the development console specified in `pszAddress`, using the name specified in `pszAlias`, to the [IXtfConsoleManager](../ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance. If `XTF_ADD_CONSOLE_FLAGS_SETDEFAULT` is specified in `dwFlags`, the development console is also set as the default development console for this PC. For more information about the default development console, see [IXtfConsoleManager::SetDefaultConsole Method](setdefaultconsole-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md).  
  
After this method is successfully called, the `IXtfConsoleManager` instance invokes the [OnAddConsole](../../IXtfConsoleManagerCallback/methods/onaddconsole-ixtfconsolemanagercallback-xtfconsolemanager-xbox-microsoft-.md) callback method from the associated [IXtfConsoleManagerCallback](../../IXtfConsoleManagerCallback/ixtfconsolemanagercallback-xtfconsolemanager-xbox-microsoft-t.md) instance. If `XTF_ADD_CONSOLE_FLAGS_SETDEFAULT` is specified in `dwFlags`, the [OnChangedDefaultConsole](../../IXtfConsoleManagerCallback/methods/onchangeddefaultconsole-ixtfconsolemanagercallback-xtfconsolemanager-xbox.md) callback method from the associated `IXtfConsoleManagerCallback` instance is also invoked.  
  
For more information about connecting and querying development consoles, see [Connect (xbconnect.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbconnect.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolemanager.h  
  
**Library:** xtfconsolemanager.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfConsoleManager::GetConsole Method](getconsole-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md)  
[IXtfConsoleManager::RemoveConsole Method](removeconsole-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md)  
[IXtfConsoleManager Interface](../ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md)  
[XtfConsoleManager](../../../xtfconsolemanager-xbox-microsoft-n.md)  
  