---
author: aablackm
title: XTFCONSOLEDATA
description: Contains information about a development console in an [IXtfConsoleManager](../classes/IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance.
ms.assetid: T:Windows.Xbox.xtfconsolemanager.XTFCONSOLEDATA
kindex: XTFCONSOLEDATA structure
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# XTFCONSOLEDATA Structure
  
Contains information about a development console in an [IXtfConsoleManager](../classes/IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
typedef struct _XTFCONSOLEDATA {
    BSTR bstrAlias;
    BSTR bstrAddress;
} XTFCONSOLEDATA, *PXTFCONSOLEDATA;  
```
  
<a id="membersSection"></a>
  
### Members
  
*bstrAlias*  
The name of the console.  
  
*bstrAddress*  
The Tools IP address of the console.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This structure contains information, including the alias and IP address, for a development console in an [IXtfConsoleManager](../classes/IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance.  
  
The [IXtfConsoleManagerCallback]() and [IXtfEnumerateConsolesCallback]() interfaces use the `XTFCONSOLEDATA` structure to pass information about development consoles when any of their callback methods are invoked by an [IXtfConsoleManager](../classes/IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) instance. Similarly, the [IXtfConsoleManager](../classes/IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md) interface uses this structure in the [GetConsole](../classes/IXtfConsoleManager/methods/getconsole-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md) and [GetDefaultConsole](../classes/IXtfConsoleManager/methods/getdefaultconsole-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md) methods to provide information about a development console.  
  
For more information about querying development consoles, see [Connect (xbconnect.exe) (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbconnect.md).  
  
<a id="remarks_output"></a>
  
### Handling BSTR pointers
  
For more information about handling BSTR pointers returned in this structure, see [Allocating and Releasing Memory for a BSTR](/cpp/atl-mfc-shared/allocating-and-releasing-memory-for-a-bstr?view=vs-2019).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolemanager.h  
  
**Library:** xtfconsolemanager.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfConsoleManager Interface](../classes/IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md)  
[XtfConsoleManager](../xtfconsolemanager-xbox-microsoft-n.md)  
  