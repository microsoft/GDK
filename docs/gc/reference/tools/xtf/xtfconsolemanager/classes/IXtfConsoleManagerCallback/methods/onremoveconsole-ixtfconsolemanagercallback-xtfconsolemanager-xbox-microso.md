---
author: aablackm
title: OnRemoveConsole
description: Called when a development console is removed from an [IXtfConsoleManager](../../IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance.
ms.assetid: M:Windows.Xbox.xtfconsolemanager.IXtfConsoleManagerCallback.OnRemoveConsole(XTFCONSOLEDATA)
kindex:
- OnRemoveConsole method
- IXtfConsoleManagerCallback--OnRemoveConsole method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfConsoleManagerCallback::OnRemoveConsole Method
  
Called when a development console is removed from an [IXtfConsoleManager](../../IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
void OnRemoveConsole(
         const XTFCONSOLEDATA *pConsoleData
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pConsoleData*  
Type: XTFCONSOLEDATA\*  
  
A pointer that receives an [XTFCONSOLEDATA](../../../structures/xtfconsoledata-xtfconsolemanager-xbox-microsoft-t.md) structure, which contains information about the development console that was removed.  
  
<a id="retvalSection"></a>
  
### Return value
  
None.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This callback method is invoked by an [IXtfConsoleManager](../../IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance when a development console is removed from the instance by invoking the [RemoveConsole](../../IXtfConsoleManager/methods/removeconsole-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md) method for that instance. This method provides information, including the name and Tools IP address, about the removed development console.  
  
For more information about connecting and querying development consoles, see [Connect (xbconnect.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbconnect.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolemanager.h  
  
**Library:** xtfconsolemanager.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfConsoleManagerCallback Interface](../ixtfconsolemanagercallback-xtfconsolemanager-xbox-microsoft-t.md)  
[XtfConsoleManager](../../../xtfconsolemanager-xbox-microsoft-n.md)  
  