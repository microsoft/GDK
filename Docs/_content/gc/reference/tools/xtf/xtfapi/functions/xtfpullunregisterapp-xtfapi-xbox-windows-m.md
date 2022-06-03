---
author: aablackm
title: XtfPullUnregisterApp
description: Reserved for internal use.
kindex: XtfPullUnregisterApp
ms.author: zhooper
ms.topic: reference-internal
edited: 04/15/2020
quality: good
security: public
---

# XtfPullUnregisterApp
  
Reserved for internal use.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfPullUnregisterApp(
         LPCWSTR consoleAddress, 
         LPCWSTR packageFullName, 
         PLogCallback logCallback,
         PProgressCallback progressCallback
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*consoleAddress*  
Type: LPCWSTR  
  
\[in\] Reserved for internal use.  
  
*packageFullName*  
Type: LPCWSTR  
  
\[in, optional\] Reserved for internal use.  
  
*logCallback*  
Type: PLogCallback  
  
\[in, optional\] Reserved for internal use.  
  
*progressCallback*  
Type: PProgressCallback  
  
\[in, optional\] Reserved for internal use.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Reserved for internal use.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** pullapi.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also  
  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
  