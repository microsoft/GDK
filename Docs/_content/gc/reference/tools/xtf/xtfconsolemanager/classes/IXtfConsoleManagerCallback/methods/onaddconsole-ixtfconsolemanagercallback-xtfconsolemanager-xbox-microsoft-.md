---
author: aablackm
title: OnAddConsole
description: Called when a development console is added to an [IXtfConsoleManager](../../IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance.
ms.assetid: M:Windows.Xbox.xtfconsolemanager.IXtfConsoleManagerCallback.OnAddConsole(XTFCONSOLEDATA)
kindex:
- OnAddConsole method
- IXtfConsoleManagerCallback--OnAddConsole method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfConsoleManagerCallback::OnAddConsole Method
  
Called when a development console is added to an [IXtfConsoleManager](../../IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
void OnAddConsole(
         const XTFCONSOLEDATA *pConsoleData
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pConsoleData*  
Type: XTFCONSOLEDATA\*  
  
A pointer that receives an [XTFCONSOLEDATA](../../../structures/xtfconsoledata-xtfconsolemanager-xbox-microsoft-t.md) structure, which contains information about the development console that was added.  
  
<a id="retvalSection"></a>
  
### Return value
  
None.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This callback method is invoked by an [IXtfConsoleManager](../../IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance when a development console is added to the instance by invoking the [AddConsole](../../IXtfConsoleManager/methods/addconsole-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md) method for that instance. This method provides information, including the name and Tools IP address, about the added development console.  
  
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
  