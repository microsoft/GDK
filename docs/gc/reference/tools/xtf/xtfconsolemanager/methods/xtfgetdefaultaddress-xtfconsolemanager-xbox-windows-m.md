---
author: aablackm
title: XtfGetDefaultAddress
description: Returns the IP address of the default development console for this PC.
ms.assetid: M:Windows.Xbox.xtfconsolemanager.XtfGetDefaultAddress(LPBSTR)
kindex: XtfGetDefaultAddress
ms.author: stevenpr
ms.topic: reference
edited: '08/24/2020'
security: public
---

# XtfGetDefaultAddress
  
Returns the IP address of the default development console for this PC.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfGetDefaultAddress(
         LPBSTR pbstrAddress
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pbstrAddress*  
Type: LPBSTR  
  
The IP address that this PC uses for its default development console.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method, if successful, gets the IP address of the default development console for this PC in `pbstrAddress`. You can also use the [IXtfConsoleManager::GetDefaultConsole](../classes/IXtfConsoleManager/methods/getdefaultconsole-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md) method to retrieve more information about the default development console, or set the default development console by invoking the [IXtfConsoleManager::SetDefaultConsole](../classes/IXtfConsoleManager/methods/setdefaultconsole-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md) method. The default development console is used by other Xbox Tools Framework (XTF) tools and API.  
  
For more information about querying the default development console, see [Connect (xbconnect.exe) (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbconnect.md).  
  
<a id="remarks_output"></a>
  
### Handling LPBSTR pointers
  
For more information about handling LPBSTR pointers returned by this method, see [Allocating and Releasing Memory for a BSTR](/cpp/atl-mfc-shared/allocating-and-releasing-memory-for-a-bstr?view=vs-2019).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolemanager.h  
  
**Library:** xtfconsolemanager.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfConsoleManager Interface](../classes/IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md)  
[XtfConsoleManager](../xtfconsolemanager-xbox-microsoft-n.md)  
  