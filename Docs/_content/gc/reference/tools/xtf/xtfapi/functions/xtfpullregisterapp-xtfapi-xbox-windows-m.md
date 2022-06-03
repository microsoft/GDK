---
author: aablackm
title: XtfPullRegisterApp
description: Reserved for internal use.
kindex: XtfPullRegisterApp
ms.author: zhooper
ms.topic: reference-internal
edited: 04/15/2020
quality: good
security: public
---

# XtfPullRegisterApp
  
Reserved for internal use.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfPullRegisterApp(
         LPCWSTR consoleAddress,
         LPCWSTR layoutPath,
         LPCWSTR mapFilePath,
         LPCWSTR tempPath,
         BSTR environmentBlock,
         PLogCallback logCallback,
         PProgressCallback progressCallback,
         PWSTR* packageFullName,
         UINT* aumidCount,
         PWSTR** aumids
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*consoleAddress*  
Type: LPCWSTR  
  
\[in\] Reserved for internal use.  
  
*layoutPath*  
Type: LPCWSTR  
  
\[in\] Reserved for internal use.  
  
*mapFilePath*  
Type: LPCWSTR  
  
\[in, optional\] Reserved for internal use.  
  
*tempPath*  
Type: LPCWSTR  
  
\[in, optional\] Reserved for internal use.  
  
*environmentBlock*  
Type: BSTR  
  
\[in, optional\] Reserved for internal use.  
  
*logCallback*  
Type: PLogCallback  
  
\[in, optional\] Reserved for internal use.  
  
*progressCallback*  
Type: PProgressCallback  
  
\[in, optional\] Reserved for internal use.  
  
*packageFullName*  
Type: PWSTR\*  
  
\[out\] Reserved for internal use.  
  
*aumidCount*  
Type: UINT\*  
  
\[out\] Reserved for internal use.  
  
*aumids*  
Type: PWSTR\*\*  
  
\[out\] Reserved for internal use.  
  
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
  