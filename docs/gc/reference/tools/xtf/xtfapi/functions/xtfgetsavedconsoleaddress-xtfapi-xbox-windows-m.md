---
author: aablackm
title: XtfGetSavedConsoleAddress
description: Gets the Tools IP address of the default console for Xbox Tools Framework (XTF) apps.
kindex: XtfGetSavedConsoleAddress
ms.author: zhooper
ms.topic: reference
edited: 04/15/2020
security: public
---

# XtfGetSavedConsoleAddress
  
Gets the Tools IP address of the default console for Xbox Tools Framework (XTF) apps.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfGetSavedConsoleAddress(
         BSTR* savedAddress
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*savedAddress*  
Type: BSTR\*  
  
\[in\] A pointer to the address of the default console for XTF apps.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function gets the Tools IP address from the development console identified by the [IXtfConsoleManager::SetDefaultConsole](../../xtfconsolemanager/classes/IXtfConsoleManager/methods/setdefaultconsole-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md) method as the default console for Xbox Tools Framework (XTF) apps. `XtfGetSavedConsoleAddress` is a utility function that gets the value of the `bstrAddress` member from the [XTFCONSOLEDATA](../../xtfconsolemanager/structures/xtfconsoledata-xtfconsolemanager-xbox-microsoft-t.md) structure returned by the [IXtfConsoleManager::GetDefaultConsole method](../../xtfconsolemanager/classes/IXtfConsoleManager/methods/getdefaultconsole-ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-m.md) of the console manager. For more information about the console manager, see [IXtfConsoleManager Interface](../../xtfconsolemanager/classes/IXtfConsoleManager/ixtfconsolemanager-xtfconsolemanager-xbox-microsoft-t.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfutils.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also  
  
[Run from PC Deployment (NDA topic)](../../../../../tools-console/usinggsdk/deployment/deployment.md)  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
  