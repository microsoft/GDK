---
author: aablackm
title: EnumerateConsoles
description: Enumerates the development consoles in the [IXtfConsoleManager](../ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance.
ms.assetid: M:Windows.Xbox.xtfconsolemanager.IXtfConsoleManager.EnumerateConsoles(IXtfEnumerateConsolesCallback)
kindex:
- EnumerateConsoles method
- IXtfConsoleManager--EnumerateConsoles method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfConsoleManager::EnumerateConsoles method
  
Enumerates the development consoles in the [IXtfConsoleManager](../ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT EnumerateConsoles(
         IXtfEnumerateConsolesCallback *pCallback
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pCallback*  
Type: IXtfEnumerateConsolesCallback\*  
  
A pointer to the [IXtfEnumerateConsolesCallback](../../IXtfEnumerateConsolesCallback/ixtfenumerateconsolescallback-xtfconsolemanager-xbox-microsoft-t.md) callback to invoke when a console has been enumerated.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method enumerates the development consoles in the [IXtfConsoleManager](../ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance. For each development console found in the instance, the `IXtfConsoleManager` instance invokes the [OnConsoleFound](../../IXtfEnumerateConsolesCallback/methods/onconsolefound-ixtfenumerateconsolescallback-xtfconsolemanager-xbox-mi.md) callback method from the [IXtfEnumerateConsolesCallback](../../IXtfEnumerateConsolesCallback/ixtfenumerateconsolescallback-xtfconsolemanager-xbox-microsoft-t.md) interface specified in `pCallback`. The `OnConsoleFound` method, in turn, provides an [XTFCONSOLEDATA](../../../structures/xtfconsoledata-xtfconsolemanager-xbox-microsoft-t.md) structure that contains information about that development console.  
  
For more information about connecting and querying development consoles, see [Connect (xbconnect.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbconnect.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolemanager.h  
  
**Library:** xtfconsolemanager.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfConsoleManager::GetConsole Method](getconsole-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md)  
[IXtfConsoleManager::GetDefaultConsole Method](getdefaultconsole-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md)  
[IXtfConsoleManager Interface](../ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md)  
[XtfConsoleManager](../../../xtfconsolemanager-xbox-microsoft-n.md)  
  