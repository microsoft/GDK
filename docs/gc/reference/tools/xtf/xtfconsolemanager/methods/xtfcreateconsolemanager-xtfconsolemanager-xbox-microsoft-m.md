---
author: aablackm
title: XtfCreateConsoleManager
description: Initializes a new instance of the [IXtfConsoleManager](../classes/IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) interface.
ms.assetid: M:Windows.Xbox.xtfconsolemanager.XtfCreateConsoleManager(IXtfConsoleManagerCallback,REFIID,void)
kindex: XtfCreateConsoleManager
ms.author: stevenpr
ms.topic: reference
edited: '08/24/2020'
security: public
---

# XtfCreateConsoleManager
  
Initializes a new instance of the [IXtfConsoleManager](../classes/IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) interface.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfCreateConsoleManager(
         IXtfConsoleManagerCallback *pCallback,
         REFIID riid,
         void **ppvObject
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pCallback*  
Type: IXtfConsoleManagerCallback\*  
  
A pointer to the [IXtfConsoleManagerCallback](../classes/IXtfConsoleManagerCallback/ixtfconsolemanagercallback-xtfconsolemanager-xbox-microsoft-t.md) callback to invoke when a development console in the [IXtfConsoleManager](../classes/IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance is added, removed, or changed.  
  
*riid*  
Type: REFIID  
  
A pointer that receives the instance identifier of the newly created [IXtfConsoleManager](../classes/IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance.  
  
*ppvObject*  
Type: void\*\*  
  
A pointer that receives a reference to the newly created [IXtfConsoleManager](../classes/IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function initializes an instance of the [IXtfConsoleManager](../classes/IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) interface. The interface handles common console management functions for the Xbox Tools Framework (XTF) API. These functions include adding, enumerating, and removing development consoles; getting and setting the default development console; and retrieving information about a development console.  
  
For more information about connecting and querying development consoles, see [Connect (xbconnect.exe) (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbconnect.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolemanager.h  
  
**Library:** xtfconsolemanager.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[XtfGetDefaultAddress](xtfgetdefaultaddress-xtfconsolemanager-xbox-windows-m.md)  
[IXtfConsoleManager Interface](../classes/IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md)  
[XtfConsoleManager](../xtfconsolemanager-xbox-microsoft-n.md)  
  