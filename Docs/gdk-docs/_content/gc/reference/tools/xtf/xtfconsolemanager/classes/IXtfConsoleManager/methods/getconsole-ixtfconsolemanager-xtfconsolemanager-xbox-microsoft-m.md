---
author: aablackm
title: GetConsole
description: Gets information about a development console with the specified name from the [IXtfConsoleManager](../ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance.
ms.assetid: M:Windows.Xbox.xtfconsolemanager.IXtfConsoleManager.GetConsole(LPCWSTR,PXTFCONSOLEDATA)
kindex:
- GetConsole method
- IXtfConsoleManager--GetConsole method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfConsoleManager::GetConsole Method
  
Gets information about a development console with the specified name from the [IXtfConsoleManager](../ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT GetConsole(
         LPCWSTR pszAlias,
         PXTFCONSOLEDATA pConsoleData
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszAlias*  
Type: LPCWSTR  
  
A pointer to the name of the console to get information about.  
  
*pConsoleData*  
Type: PXTFCONSOLEDATA  
  
A pointer that receives an [XTFCONSOLEDATA](../../../structures/xtfconsoledata-xtfconsolemanager-xbox-microsoft-t.md) structure, which contains information about the development console.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method gets information about the development console with the name specified in `pszAlias` from the [IXtfConsoleManager](../ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance. The information is returned in `pConsoleData` as an [XTFCONSOLEDATA](../../../structures/xtfconsoledata-xtfconsolemanager-xbox-microsoft-t.md) structure containing the name and Tools IP address of the specified console.  
  
For more information about connecting and querying development consoles, see [Connect (xbconnect.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbconnect.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolemanager.h  
  
**Library:** xtfconsolemanager.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfConsoleManager::EnumerateConsoles Method](enumerateconsoles-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md)  
[IXtfConsoleManager Interface](../ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md)  
[XtfConsoleManager](../../../xtfconsolemanager-xbox-microsoft-n.md)  
  