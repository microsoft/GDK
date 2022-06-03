---
author: aablackm
title: XtfGetSystemUpTime
description: Gets the amount of time in milliseconds that the System OS and Game OS have been running.
ms.assetid: M:Windows.Xbox.xtfapi.XtfGetSystemUpTime(PWCSTR,UINT64@,UINT64@)
kindex: XtfGetSystemUpTime
ms.author: stevenpr
ms.topic: reference
edited: 06/10/2019
security: public
---

# XtfGetSystemUpTime
  
Gets the amount of time in milliseconds that the System OS and Game OS have been running.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfGetSystemUpTime(
         PWCSTR address,
         UINT64* systemUpTimeSystem,
         UINT64* systemUpTimeTitle
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*address*  
Type: PWCSTR  
  
\[in\] The address of the console.  
  
*systemUpTimeSystem*  
Type: UINT64\*  
  
\[out, optional\] The amount of time, in milliseconds, that the System OS has been running. If this value is not required, set this to `nullptr`.  
  
*systemUpTimeTitle*  
Type: UINT64\*  
  
\[out, optional\] The amount of time, in milliseconds, that the Game OS has been running. If this value is not required, set this to `nullptr`.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function returns the amount of time that the System OS and Game OS have been running.
For the System OS, this value is the time, in milliseconds, since the console was booted. For the Game OS, this is the time, in milliseconds, since the game was launched. For more information about the System OS and Game OS, see For a complete introduction, see [What is the Microsoft Game Development Kit? (NDA topic)](../../../../../intro/overviews/introduction.md).
  
<a id="requirementsSection"></a>
  
## Requirements  
  
**Header:** xtfapi.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
  