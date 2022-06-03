---
author: aablackm
title: OnConsoleFound
description: Called when a development console is found during an [IXtfConsoleManager::EnumerateConsoles](../../IXtfConsoleManager/methods/enumerateconsoles-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md) operation.
ms.assetid: M:Windows.Xbox.xtfconsolemanager.IXtfEnumerateConsolesCallback.OnConsoleFound(XTFCONSOLEDATA)
kindex:
- OnConsoleFound method
- IXtfEnumerateConsolesCallback--OnConsoleFound method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfEnumerateConsolesCallback::OnConsoleFound Method
  
Called when a development console is found during an [IXtfConsoleManager::EnumerateConsoles](../../IXtfConsoleManager/methods/enumerateconsoles-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md) operation.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT OnConsoleFound(
         const XTFCONSOLEDATA *pConsoleData
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pConsoleData*  
Type: XTFCONSOLEDATA\*  
  
A pointer that receives an [XTFCONSOLEDATA](../../../structures/xtfconsoledata-xtfconsolemanager-xbox-microsoft-t.md) structure, which contains information about the development console that was found.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This callback method is invoked by an [IXtfConsoleManager](../../IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance for each development console found during the invocation of the [EnumerateConsoles](../../IXtfConsoleManager/methods/enumerateconsoles-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md) method for that instance. This method provides information, including the name and Tools IP address, about the found development console.  
  
For more information about connecting and querying development consoles, see [Connect (xbconnect.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbconnect.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolemanager.h  
  
**Library:** xtfconsolemanager.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfConsoleManager::GetConsole Method](../../IXtfConsoleManager/methods/getconsole-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md)  
[IXtfConsoleManager::GetDefaultConsole Method](../../IXtfConsoleManager/methods/getdefaultconsole-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md)  
[IXtfEnumerateConsolesCallback Interface](../ixtfenumerateconsolescallback-xtfconsolemanager-xbox-microsoft-t.md)  
[XtfConsoleManager](../../../xtfconsolemanager-xbox-microsoft-n.md)  
  