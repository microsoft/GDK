---
author: aablackm
title: GetDefaultConsole
description: Gets information about the default development console from the [IXtfConsoleManager](../ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance.
ms.assetid: M:Windows.Xbox.xtfconsolemanager.IXtfConsoleManager.GetDefaultConsole(PXTFCONSOLEDATA)
kindex:
- GetDefaultConsole method
- IXtfConsoleManager--GetDefaultConsole method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfConsoleManager::GetDefaultConsole Method
  
Gets information about the default development console from the [IXtfConsoleManager](../ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT GetDefaultConsole(
         PXTFCONSOLEDATA pConsoleData
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pConsoleData*  
Type: PXTFCONSOLEDATA  
  
A pointer that receives an [XTFCONSOLEDATA](../../../structures/xtfconsoledata-xtfconsolemanager-xbox-microsoft-t.md) structure, which contains information about the default development console.
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method gets information about the default development console to use with Xbox Tools Framework (XTF) tools and API on this PC from the [IXtfConsoleManager](../ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance. The default development console is used if a development console is not otherwise specified when using XTF tools and API on this PC.  
  
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
  