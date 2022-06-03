---
author: aablackm
title: GetSystemTime
description: Retrieves the system time from the current development console.
ms.assetid: M:Windows.Xbox.xtfconsolecontrol.IXtfConsoleControlClient.GetSystemTime(XTFSYSTEMTIME)
kindex:
- GetSystemTime method
- IXtfConsoleControlClient--GetSystemTime method
ms.author: stevenpr
ms.topic: reference
edited: 07/24/2020
security: public
---

# IXtfConsoleControlClient::GetSystemTime
  
Retrieves the system time from the current development console.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT GetSystemTime(
         XTFSYSTEMTIME *pSystemTime
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pSystemTime*  
Type: XTFSYSTEMTIME\*  
  
A pointer to an [XTFSYSTEMTIME](../../../structs/xtfsystemtime.md) structure that receives the system time from the current development console.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function retrieves the system date and time from the current development console as an [XTFSYSTEMTIME](../../../structs/xtfsystemtime.md) structure. The structure represents the system date and time in its various components, from year to millisecond. For more information about viewing the current system time on a development console, see [Developer Home on the console (Dev Home) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/devhome/devhome.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolecontrol.h  
  
**Library:** xtfconsolecontrol.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[XTFSYSTEMTIME](../../../structs/xtfsystemtime.md)  
[IXtfConsoleControlClient](../ixtfconsolecontrolclient.md)  
[XtfConsoleControl](../../../xtfconsolecontrol_members.md)  
  